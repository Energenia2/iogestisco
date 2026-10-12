# Inventario in sola lettura di SERVER-ENER

Scopo: sapere con precisione cosa fa oggi il server Windows Server 2012 R2 (dominio, DNS,
cartelle, backup, programmi, eventuale archivio Easyfatt) prima di decidere se e come
sostituirlo con Linux.

## Garanzie

- Lo script **non modifica nulla**: usa solo comandi di lettura.
- **Non legge e non salva password.** Le credenziali di amministratore le digita la persona
  che lo esegue, nella normale finestra di Windows; non vanno mai scritte in chat.
- Degli utenti del dominio riporta **solo i conteggi**, non i nomi.
- Scritto per PowerShell 4.0 (quello di Windows Server 2012 R2). Non e' stato possibile
  provarlo su un Windows Server vero prima della consegna: ogni sezione e' protetta, quindi
  se un comando non funziona la sezione riporta "NON DISPONIBILE" e lo script prosegue.

## Come si esegue (circa 5 minuti)

1. Avvisare il tecnico esterno che gestisce il server (buona norma e tutela del suo contratto
   di assistenza).
2. Copiare `Inventario-Server.ps1` sul Desktop del server (da chiavetta o da cartella condivisa).
3. Sul server: tasto destro su **Windows PowerShell** > **Esegui come amministratore**.
4. Digitare: `Set-ExecutionPolicy -Scope Process Bypass -Force`
   (vale solo per quella finestra).
5. Digitare: `& "$env:USERPROFILE\Desktop\Inventario-Server.ps1"`
6. Sul Desktop compare `Inventario_SERVER-ENER_<data>.txt`. Aprirlo, controllarlo e
   condividerlo nella sessione di Claude.

## Cosa contiene il risultato

Sistema e hardware, ultimi aggiornamenti, ruoli installati, programmi, servizi, cartelle
condivise e permessi, versioni precedenti, backup, attivita' pianificate, dominio e livello
funzionale, computer del dominio con il loro Windows, conteggio utenti, criteri di gruppo,
DNS e inoltri, DHCP, rete, stampanti, tracce di Easyfatt/Firebird.
