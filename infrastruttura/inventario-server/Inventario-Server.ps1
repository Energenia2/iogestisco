<#
  Inventario in SOLA LETTURA del server Windows di Energenia (SERVER-ENER).

  - Non modifica nulla: usa solo comandi di lettura (Get-*, vssadmin list, wbadmin get, netdom query).
  - Non legge ne' salva password.
  - Compatibile con Windows Server 2012 R2 (PowerShell 4.0).
  - Scrive un file di testo sul Desktop di chi lo esegue.

  Esecuzione (sul server, come amministratore):
    1. Copiare questo file sul server (es. sul Desktop).
    2. Tasto destro su "Windows PowerShell" > "Esegui come amministratore".
    3. Digitare:  Set-ExecutionPolicy -Scope Process Bypass -Force
       (vale solo per quella finestra, si annulla chiudendola)
    4. Digitare:  & "$env:USERPROFILE\Desktop\Inventario-Server.ps1"
#>

$ErrorActionPreference = 'Continue'
$stamp   = Get-Date -Format 'yyyyMMdd_HHmm'
$desktop = [Environment]::GetFolderPath('Desktop')
$outFile = Join-Path $desktop ("Inventario_{0}_{1}.txt" -f $env:COMPUTERNAME, $stamp)

function Write-Out([string]$text) {
    Add-Content -Path $outFile -Value $text -Encoding UTF8
}

function Section([string]$title, [scriptblock]$code) {
    Write-Host ("-> " + $title)
    Write-Out ""
    Write-Out ("===== " + $title + " =====")
    try {
        $result = & $code 2>&1 | Out-String -Width 250
        if ([string]::IsNullOrWhiteSpace($result)) { $result = "(nessun dato)" }
        Write-Out $result
    } catch {
        Write-Out ("NON DISPONIBILE: " + $_.Exception.Message)
    }
}

Write-Out ("Inventario in sola lettura del server " + $env:COMPUTERNAME)
Write-Out ("Data: " + (Get-Date -Format 'dd/MM/yyyy HH:mm') + "  -  Eseguito da: " + $env:USERDOMAIN + "\" + $env:USERNAME)
Write-Out "Lo script non ha modificato nulla sul server."

# 1. Sistema operativo
Section "1. Sistema operativo" {
    $os = Get-CimInstance Win32_OperatingSystem
    [pscustomobject]@{
        Nome          = $os.Caption
        Versione      = $os.Version
        Build         = $os.BuildNumber
        Installato_il = $os.InstallDate
        Ultimo_avvio  = $os.LastBootUpTime
        Lingua        = $os.MUILanguages -join ','
    } | Format-List
}

# 2. Hardware
Section "2. Hardware" {
    $cs   = Get-CimInstance Win32_ComputerSystem
    $bios = Get-CimInstance Win32_BIOS
    $cpu  = Get-CimInstance Win32_Processor
    [pscustomobject]@{
        Produttore      = $cs.Manufacturer
        Modello         = $cs.Model
        Seriale         = $bios.SerialNumber
        BIOS_versione   = $bios.SMBIOSBIOSVersion
        BIOS_data       = $bios.ReleaseDate
        Processore      = ($cpu | Select-Object -ExpandProperty Name) -join ' | '
        Core_totali     = ($cpu | Measure-Object -Property NumberOfCores -Sum).Sum
        RAM_GB          = [math]::Round($cs.TotalPhysicalMemory / 1GB, 1)
    } | Format-List
    "Dischi fisici:"
    Get-CimInstance Win32_DiskDrive | Select-Object Model, InterfaceType, @{n='GB';e={[math]::Round($_.Size/1GB,0)}}, Status | Format-Table -AutoSize
    "Volumi:"
    Get-Volume | Where-Object { $_.DriveLetter } | Select-Object DriveLetter, FileSystemLabel, FileSystem, @{n='GB_totali';e={[math]::Round($_.Size/1GB,1)}}, @{n='GB_liberi';e={[math]::Round($_.SizeRemaining/1GB,1)}}, HealthStatus | Format-Table -AutoSize
}

# 3. Aggiornamenti
Section "3. Ultimi 15 aggiornamenti installati" {
    Get-HotFix | Sort-Object { if ($_.InstalledOn) { $_.InstalledOn } else { [datetime]::MinValue } } -Descending |
        Select-Object -First 15 HotFixID, Description, InstalledOn | Format-Table -AutoSize
}

# 4. Ruoli e funzionalita'
Section "4. Ruoli e funzionalita' installati" {
    Import-Module ServerManager -ErrorAction SilentlyContinue
    Get-WindowsFeature | Where-Object { $_.Installed } | Select-Object Name, DisplayName | Format-Table -AutoSize
}

# 5. Programmi installati
Section "5. Programmi installati" {
    $keys = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
            'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
    Get-ItemProperty -Path $keys -ErrorAction SilentlyContinue |
        Where-Object { $_.DisplayName } |
        Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |
        Sort-Object DisplayName -Unique | Format-Table -AutoSize
}

# 6. Servizi automatici in esecuzione
Section "6. Servizi in esecuzione (avvio automatico)" {
    Get-CimInstance Win32_Service | Where-Object { $_.State -eq 'Running' -and $_.StartMode -eq 'Auto' } |
        Select-Object Name, DisplayName, PathName | Sort-Object DisplayName | Format-Table -AutoSize -Wrap
}

# 7. Cartelle condivise
Section "7. Cartelle condivise e permessi di condivisione" {
    $shares = Get-SmbShare
    $shares | Select-Object Name, Path, Description | Format-Table -AutoSize
    foreach ($s in ($shares | Where-Object { $_.Name -notlike '*$' })) {
        "Permessi su " + $s.Name + ":"
        Get-SmbShareAccess -Name $s.Name | Select-Object AccountName, AccessControlType, AccessRight | Format-Table -AutoSize
    }
}

# 8. Versioni precedenti (copie shadow)
Section "8. Versioni precedenti (copie shadow)" {
    vssadmin list shadowstorage
    "Attivita' pianificate delle copie shadow:"
    Get-ScheduledTask | Where-Object { $_.TaskName -like 'ShadowCopyVolume*' } |
        Select-Object TaskName, State, @{n='Orari';e={ ($_.Triggers | ForEach-Object { $_.StartBoundary }) -join ', ' }} | Format-Table -AutoSize -Wrap
}

# 9. Backup di Windows Server
Section "9. Backup di Windows Server" {
    $wb = Get-Module -ListAvailable -Name WindowsServerBackup
    if ($wb) {
        Import-Module WindowsServerBackup
        "Politica di backup:"
        Get-WBPolicy | Out-String
        "Riepilogo ultimo backup:"
        Get-WBSummary | Select-Object LastSuccessfulBackupTime, LastBackupResultHR, LastBackupTarget, NumberOfVersions | Format-List
    } else {
        "Modulo Windows Server Backup non installato: il backup e' fatto con un altro programma (vedi sezioni 5, 6 e 10)."
    }
}

# 10. Attivita' pianificate non Microsoft
Section "10. Attivita' pianificate (escluse quelle di Microsoft)" {
    Get-ScheduledTask | Where-Object { $_.TaskPath -notlike '\Microsoft\*' } |
        Select-Object TaskPath, TaskName, State, @{n='Esegue';e={ ($_.Actions | ForEach-Object { $_.Execute + ' ' + $_.Arguments }) -join ' ; ' }} |
        Format-Table -AutoSize -Wrap
}

# 11. Dominio
Section "11. Dominio e controller di dominio" {
    Import-Module ActiveDirectory -ErrorAction Stop
    Get-ADDomain | Select-Object DNSRoot, NetBIOSName, DomainMode, PDCEmulator, RIDMaster, InfrastructureMaster | Format-List
    Get-ADForest | Select-Object Name, ForestMode, SchemaMaster, DomainNamingMaster | Format-List
    "Controller di dominio:"
    Get-ADDomainController -Filter * | Select-Object HostName, OperatingSystem, IPv4Address, IsGlobalCatalog | Format-Table -AutoSize
    "Ruoli FSMO:"
    netdom query fsmo
}

# 12. Computer del dominio
Section "12. Computer registrati nel dominio" {
    Import-Module ActiveDirectory -ErrorAction Stop
    Get-ADComputer -Filter * -Properties OperatingSystem, LastLogonDate |
        Select-Object Name, OperatingSystem, LastLogonDate, Enabled | Sort-Object OperatingSystem, Name | Format-Table -AutoSize
}

# 13. Utenti (solo conteggi, nessun nome)
Section "13. Utenti del dominio (solo conteggi)" {
    Import-Module ActiveDirectory -ErrorAction Stop
    $all = @(Get-ADUser -Filter *)
    # Gruppo amministratori del dominio cercato per SID (-512): funziona anche con Windows in italiano
    $admSid = (Get-ADDomain).DomainSID.Value + '-512'
    $adm = @(Get-ADGroupMember -Identity $admSid -Recursive)
    [pscustomobject]@{
        Utenti_totali                 = $all.Count
        Utenti_attivi                 = @($all | Where-Object { $_.Enabled }).Count
        Utenti_disattivati            = @($all | Where-Object { -not $_.Enabled }).Count
        Membri_amministratori_dominio = $adm.Count
    } | Format-List
}

# 14. Criteri di gruppo
Section "14. Criteri di gruppo (GPO)" {
    Import-Module GroupPolicy -ErrorAction Stop
    Get-GPO -All | Select-Object DisplayName, GpoStatus, ModificationTime | Sort-Object DisplayName | Format-Table -AutoSize
}

# 15. DNS
Section "15. Server DNS: inoltri verso internet e zone" {
    Import-Module DnsServer -ErrorAction Stop
    "Inoltri (server DNS di internet usati dal server):"
    Get-DnsServerForwarder | Format-List
    "Zone:"
    Get-DnsServerZone | Select-Object ZoneName, ZoneType, IsDsIntegrated, IsReverseLookupZone | Format-Table -AutoSize
}

# 16. DHCP
Section "16. Server DHCP (indirizzi ai PC)" {
    $f = Get-WindowsFeature -Name DHCP -ErrorAction SilentlyContinue
    if ($f -and $f.Installed) {
        Import-Module DhcpServer
        Get-DhcpServerv4Scope | Select-Object ScopeId, Name, StartRange, EndRange, SubnetMask, State, LeaseDuration | Format-Table -AutoSize
        Get-DhcpServerv4OptionValue | Select-Object OptionId, Name, Value | Format-Table -AutoSize -Wrap
    } else {
        "Ruolo DHCP non installato: gli indirizzi ai PC li assegna un altro apparato (probabilmente firewall o router)."
    }
}

# 17. Rete
Section "17. Configurazione di rete del server" {
    Get-NetIPConfiguration | Format-List InterfaceAlias, IPv4Address, IPv4DefaultGateway, DNSServer
}

# 18. Stampanti
Section "18. Stampanti installate o condivise" {
    Get-Printer | Select-Object Name, DriverName, PortName, Shared, ShareName | Format-Table -AutoSize
}

# 19. Easyfatt / Firebird
Section "19. Tracce di Danea Easyfatt (servizio Firebird, cartelle, archivi .eft)" {
    "Servizi Firebird:"
    Get-CimInstance Win32_Service | Where-Object { $_.Name -like '*Firebird*' -or $_.DisplayName -like '*Firebird*' } |
        Select-Object Name, State, StartMode, PathName | Format-Table -AutoSize -Wrap
    "Cartelle Danea nei programmi:"
    foreach ($p in @($env:ProgramFiles, ${env:ProgramFiles(x86)}, $env:ProgramData)) {
        if ($p -and (Test-Path $p)) { Get-ChildItem -Path $p -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like '*Danea*' -or $_.Name -like '*Easyfatt*' } | Select-Object FullName }
    }
    "Archivi .eft nelle cartelle condivise (puo' richiedere qualche minuto):"
    foreach ($s in (Get-SmbShare | Where-Object { $_.Name -notlike '*$' -and $_.Path })) {
        Get-ChildItem -Path $s.Path -Filter '*.eft' -Recurse -File -ErrorAction SilentlyContinue |
            Select-Object FullName, @{n='MB';e={[math]::Round($_.Length/1MB,1)}}, LastWriteTime
    }
}

Write-Out ""
Write-Out "===== FINE INVENTARIO ====="
Write-Host ""
Write-Host ("Inventario completato. File creato: " + $outFile)
Write-Host "Prima di condividerlo, aprilo e controlla che non contenga nulla che preferisci non mostrare."
