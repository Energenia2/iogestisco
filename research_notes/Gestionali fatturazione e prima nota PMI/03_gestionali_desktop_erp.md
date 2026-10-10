# Gestionali desktop / on-premise / ibridi italiani per PMI: contabilità, prima nota, IVA, fatture attive e passive (stato ottobre 2026)

> Nota di metodo (10/10/2026): l'accesso diretto ai siti (WebFetch/curl) era bloccato dal proxy (DNS/CONNECT 403), quindi tutte le evidenze vengono da snippet e sintesi del motore di ricerca sulle pagine citate. Quando una ricerca ha restituito più URL insieme, l'attribuzione del singolo dato a un URL è "best effort" (lo segnalo con "fonti aggregate"). Il budget di ricerca è finito prima di coprire alcuni sotto-temi (vedi Gaps). La maggior parte delle fonti sono vendor o rivenditori, quindi materiale promozionale. Nessun prezzo di listino ufficiale è pubblico per gli ERP coperti.

## 1. Prodotti: nome attuale, target, deployment, database, requisiti (Windows 10) e prezzi 2026

### Takeaway
Gli ERP "storici" per PMI sono ancora client-server su Windows (SQL Server per Zucchetti Ad Hoc Revolution e Wolters Kluwer Arca Evolution; motore proprietario più MySQL via ODBC per alcuni moduli in Passepartout Mexal), ma tutti affiancano client web o browser e hosting cloud. Diversi nomi richiesti sono cambiati o non esistono: TeamSystem Gamma/Alyante sono oggi "TeamSystem Enterprise" e "ALYANTE Start"; AGO Infinity è Zucchetti ma per commercialisti; ESA Software è confluita in TeamSystem; PROFIS di Sistemi è per studi. Nessun vendor pubblica listini ERP; si trovano solo prezzi di singoli add-on o di prodotti cloud.

### Cited Findings
**Passepartout Mexal / Passcom (Passepartout, San Marino)**
- Mexal è presentato come "il Gestionale Aziendale scelto da +25mila PMI" — [Passepartout](https://passepartout.net/software/gestionale-aziendale)
- Passcom è il software per commercialisti di Passepartout ("gestire in modo integrato l'intero processo amministrativo e gestionale dello studio"). Mexal è per le aziende, Passcom per gli studi — [Passepartout Passcom](https://www.passepartout.net/software/commercialisti); [Lineacomputer](https://www.lineacomputer.net/blog/approfondimento/software-passepartout-le-soluzioni-gestionali-per-aziende-e-professionisti)
- Mexal ha due versioni. "Contabile" copre prima nota, IVA, scadenzario, clienti/fornitori, ritenute, bilanci, ammortamenti, ratei e risconti, senza magazzino. "Solution" copre magazzino e ciclo documenti (preventivi, ordini, acquisti, vendite) — fonti aggregate: [Lineacomputer blog](https://www.lineacomputer.net/blog/approfondimento/mexal-passepartout-come-gestire-contabilita-e-magazzino); [Ingest](https://ingest.it/soluzioni-gestionali/passepartout-mexal/gestione-contabilita/)
- Architettura e requisiti (manuale EduPass):
  - La prima versione installabile su Windows Server 2025 è la 2025B.
  - Le componenti server sono solo a 64 bit.
  - Piattaforme server: Windows Server, Windows Workstation, Linux CentOS 7 e Rocky 9.
  - RAM: il doppio di quella consigliata per il sistema operativo, più circa 1 GB ogni 5-6 postazioni.
  - I supporti di installazione non devono stare su NFS o NAS.
  - Su Linux, i "moduli su database" (RDBMS) richiedono unixODBC e il connettore MySQL ODBC 8.0.33 o 8.4. L'upgrade dell'istanza MySQL non è supportato: serve una nuova installazione con migrazione dei dati.
  - Fonti: [EduPass Nozioni generali PDF](https://www.edupass.it/StreamFile/Resources/Documenti/Manuali/Mexal-Businesspass/NozioniGenerali.pdf); [EduPass requisiti Linux / RDBMS per moduli su database](https://www.edupass.it/manuali/manualistica-mexal/manuale-prodotto?a=manuale-prodotto/nozioni-generali/ambienti-operativi/rdbms-per-moduli-su-database/requisiti-minimi-sistemi-linux-ed-installazione)
- Client iDesk: Windows 10 o superiore. Accesso web da Mac, iPad e Android 9 o superiore. Server on-premise almeno dual core — [Passepartout](https://passepartout.net/software/gestionale-aziendale); [Lineacomputer iDesk](https://www.lineacomputer.net/blog/dettaglio-news/guida-allinstallazione-di-idesk-software-gestionale---passepartout-mexal)
- Prezzi Mexal:
  - Non esiste un listino fisso: il prezzo dipende da moduli, utenti e modalità (cloud privato del partner oppure on-premise) — [LINKWARE](https://linkware.it/software-gestionale/passepartout-mexal/)
  - Lineacomputer dice che non c'è licenza iniziale ma un canone annuo "all inclusive" — [Lineacomputer](https://www.lineacomputer.net/software-gestionale-passepartout/mexal)
  - Altri partner parlano di licenza perpetua più canone opzionale, e di un cloud più caro per il costo del server. Queste fonti sono discordanti — fonti aggregate: [gestionalepassepartout.it](https://gestionalepassepartout.it/); [Galagant](https://www.gruppogalagant.it/passepartout-mexal-come-funziona/)
  - Prezzi puntuali di add-on:
    - "Ricalcolo Prezzi Listino": €61/anno IVA inclusa. La scheda è di circa 3 anni fa, quindi probabilmente datata — [PassStore](https://passstore.passepartout.net/Apps/Detail/ricalcolo-prezzi-listino/667)
    - "Licenza annuale Mexal Mixer": €505,08 IVA inclusa (rilevato il 24/10/2025) — [Systemapp](https://www.systemapp.it/licenza-annuale-passepartout-mexal-mixer)
  - Capterra indica "$9/utente/mese", dato non verificabile — [Capterra](https://www.capterra.com/p/199649/Mexal/)

**Zucchetti Ad Hoc Revolution / Ad Hoc Revolution Web / Ad Hoc Infinity / Gestionale 1 / AGO Infinity**
- Ad Hoc Revolution:
  - Gestionale client-server per PMI su database Microsoft SQL — [Pentasoft](https://pentasoft.it/index.php?Itemid=1079&catid=22&id=74&option=com_content&view=article)
  - Oltre 40 moduli — fonti aggregate: [Altaquota](https://www.aquota.net/prodotti/ad-hoc-revolution/); [Datalite](https://datalite.it/soluzioni-software/software-zucchetti/ad-hoc-revolution/)
  - Esiste una versione "Ad Hoc Revolution Web": l'help ufficiale è nel percorso `ahrw_standard` — [Help Zucchetti](https://help.zucchetti.it/dms/ticpro/help/sam/ahrw_standard/gscg/gscg_acc.html); [gestionaleadhoc.it](https://www.gestionaleadhoc.it/); [Scheda funzionale AHR Web](https://www.adhocge.it/wp-content/uploads/2020/12/AHRWeb_scheda_funzionale.pdf)
  - Requisiti pubblici datati: le pagine dei rivenditori elencano ancora Windows Vista/7/8, Windows 2008/2012 (brochure 2018 e pagina vecchia). Non ho trovato requisiti 2025-26 — [Brochure AHR 8.0 (2018)](http://www.progettoedp.it/wp-content/uploads/2018/06/AHR-brochure_8.0.pdf); [Dataflow](http://www.dataflow.it/Zucchetti/ad_hoc_revolution.htm)
- SQL Server 2025 (17.x) richiede Windows 10 o superiore, solo x64, e .NET 4.7.2. Su client Windows 11 sono supportate le edizioni Standard ed Express, non Enterprise — [Microsoft Learn](https://learn.microsoft.com/it-it/sql/sql-server/install/hardware-and-software-requirements-for-installing-sql-server-2025?view=sql-server-ver17)
- Prezzo Ad Hoc Revolution: non pubblico, dipende da moduli e utenti — [BSInformatica](https://www.gestionaleadhoc.it/)
  - Un rivenditore indica "soluzioni Zucchetti da €990", cifra generica e non specifica di AHR — [ETS](https://www.etshg.it/gestionale-zucchetti/ad-hoc-revolution)
  - AHR Web è indicato come acquistabile con credito d'imposta (Legge di Bilancio 2020) — [Solution Informatica](https://www.solutioninformatica.com/concessionario-zucchetti-ferrara/adhoc-revolution-web/)
- Ad Hoc Infinity:
  - ERP web nativo, usabile da browser, in cloud o su infrastruttura aziendale. Zucchetti lo colloca nell'area "grandi aziende" — [Z-Lab](https://www.z-lab.it/soluzioni/soluzioni-software/ad-hoc-infinity/); [Zucchetti](https://www.zucchetti.it/it/cms/soluzioni/software-gestionali/dimensione-azienda/grandi-aziende/ad-hoc-infinity/programma-gestionale-web-descrizione.html)
  - Moduli: contabilità generale e IVA, cespiti, tesoreria e remote banking, ritenute, cash flow, gestione del credito — [Zucchetti funzionalità](https://www.zucchetti.it/it/cms/soluzioni/software-gestionali/dimensione-azienda/grandi-aziende/ad-hoc-infinity/programma-gestionale-web-funzionalita.html)
- Gestionale 1 (G1):
  - Per micro e piccole imprese, oltre 20 moduli, si installa da solo — fonti aggregate: [Arqen](https://www.arqen.it/software-e-servizi/gestionale-1/); [Infodati](https://infodati.it/g1/); [Delta Informatica](https://www.deltainformatica.eu/prodotti/gestonale-1-piccole-e-micro-imprese/)
  - Fatturazione elettronica: servono il modulo Vendite (G1VEN) e il servizio Digital Hub Zucchetti. Per ricevere le fatture fornitori in contabilità servono G1CON (contabilità completa) o G1STU (ridotta) più Digital Hub. La FAQ ha circa 4,5 anni — [Gestionale 1 FAQ FE](http://www.gestionale1.it/help/Content/G1FAQ/FatturazioneElettronica.htm)
  - Prezzi Digital Hub (listino Store del 10/01/2023, probabilmente datato): €66 per una voce "fatture fornitori" e €318 per "analisi XML" — [Listino Zucchetti Store PDF](https://www.zucchetti.it/website/dms/Store/Listino_Zucchetti_Store.pdf)
- AGO Infinity:
  - È di Zucchetti, web/cloud, per commercialisti e associazioni di categoria. Copre anagrafiche, F24, prima nota, fatture e corrispettivi elettronici, revisione legale e crisi d'impresa, con assistente AI — [Zucchetti Ago Infinity](https://www.zucchetti.it/it/cms/professionisti/contabilita-fisco-finanza/gestione-contabile-fiscale/ago-infinity/software-gestionale-per-commercialisti.html)
  - Zucchetti lo dichiara il primo gestionale contabile-fiscale conforme al Codice di Condotta privacy — [Zucchetti news](https://www.zucchetti.it/it/cms/news-e-eventi/news/ago-infinity-di-zucchetti-il-primo-software-gestionale-contabile-fiscale-in-italia-che-rispetta-il-codice-di-condotta-per-la-p.html)

**TeamSystem (Enterprise ex Gamma/Alyante, ALYANTE Start, Lynfa Azienda)**
- Catena dei nomi:
  - TeamSystem Enterprise era prima Gamma Enterprise, poi ALYANTE Enterprise.
  - ALYANTE Start era prima Gamma Sprint.
  - Entrambi sono basati sulla piattaforma POLYEDRO.
  - Fonte: [bindCommerce](https://www.bindcommerce.com/it/integrazioni/gestionali/alyante)
- POLYEDRO è la piattaforma web nativa uscita nel 2013, su cui girano Lynfa e Alyante (articolo 2014) — [PMI.it](https://www.pmi.it/tecnologia/prodotti-e-servizi-ict/news/87218/innovazioni-teamsystem-per-pmi-professionisti-smau.html)
- TS Enterprise è "modulare e scalabile, disponibile in Cloud, potenziato con AI". TeamSystem cita la scelta tra cloud e on-premise come criterio di selezione — [TeamSystem Enterprise](https://www.teamsystem.com/aziende/enterprise/)
- Gamma Enterprise 8.0: on-premise o cloud (server farm Telecom Italia, dato datato) — [Sigma Sistemi](https://www.sigmasistemi.com/catalogo/P_6315/erp-gamma-enterprise-gestionale-teamsystem.html)
- Il vecchio Gamma Enterprise usava un client Visual Basic 6 su SQL Server 2000. Il dato è obsoleto e serve solo come contesto storico — [Mandsons](https://www.mandsons.it/GAMMA_ENTERPRISE.htm)
- Lynfa Azienda: contabilizzazione automatica, F24, esportazione dei dati contabili verso gli studi. Può importare le registrazioni tenute dallo studio in TS Studio — [Sima Software](https://www.sima-software.it/software-gestionale-teamsystem-aziende/prodotto-lynfa-azienda-polyedro.html); [Brochure Lynfa Azienda (2018)](https://www.slware.it/inc/uploads/2018/07/lynfa_azienda.pdf)
- Gruppo TeamSystem 2025: ricavi €1,15 miliardi, di cui l'88% ricorrenti — [01net](https://www.01net.it/teamsystem-risultati-2025-ricavi-ai-internazionalizzazione/)
- Prezzi:
  - Nessun listino per Enterprise, ALYANTE o Lynfa.
  - Come riferimento ufficiale TeamSystem, "Contabilità in Cloud" (prodotto diverso, cloud): Enterprise Advanced €1.826 + IVA/anno (fino a 50.000 righe contabili/anno), Premium Advanced €1.346/anno — [TeamSystem Store](https://www.teamsystem.com/store/contabilita-in-cloud/prezzi/)
  - Un blog stima la piattaforma enterprise in "diverse migliaia di euro all'anno" — [srlonline](https://www.srlonline.com/software-gestionali-2026-fatture-in-cloud-vs-danea-teamsystem-confronto-prezzi-funzioni/)

**Wolters Kluwer (Arca Evolution, Arca EVOLUTION eGO, Genya)**
- Arca Evolution è sviluppato su Microsoft SQL Server ed è modulare (fonti aggregate) — [Wolters Kluwer insights](https://www.wolterskluwer.com/it-it/expert-insights/i-moduli-di-arca-evolution); [ItaliaOggi (contenuto sponsorizzato)](https://www.italiaoggi.it/native-content/arca-evolution-lerp-modulare-per-affrontare-ogni-sfida-aziendale-grn71877)
- È distribuito anche da Versya (gruppo SYS-DAT) — [SYS-DAT](https://www.sys-datgroup.com/versya/blog-versya/arca-evolution-cose-prezzo-e-assistenza/)
- Ha verticali di settore (moda, manutentori, metalmeccanico) e la connessione macchine Arca4Connection — [Wolters Kluwer](https://www.wolterskluwer.com/it-it/expert-insights/arca-evolution-sofware-per-pmi); [Economy](https://www.economymagazine.it/wolters-kluwer-presenta-le-nuove-capacita-dintegrazione-per-arca-evolution/)
- "Arca EVO" come prodotto distinto non risulta. I nomi ufficiali sono "Arca EVOLUTION" e la versione leggera "Arca EVOLUTION eGO", per artigiani, negozi e professionisti, che copre il ciclo dall'ordine alla fattura — [Wolters Kluwer Arca eGO](https://www.wolterskluwer.com/en/solutions/arca-evolution/arca-ego); [Software Line OSRA](https://www.softwarelineosra.it/prodotti/artel/gestionali/arca-ego.html)
- Il modulo Conservazione SMART richiede Arca EVOLUTION o Arca eGO e gestisce un'azienda alla volta — [scheda WK](https://assets.contenthub.wolterskluwer.com/api/public/content/d533e53f04ec406f841293fbff0724c3)
- Genya:
  - ERP cloud su Microsoft Azure per contabilità, ciclo attivo e passivo, fatturazione elettronica, bilanci e multi-azienda, condiviso con il commercialista.
  - Di recente si è aggiunto Genya Magazzino.
  - Fonti: [Tecnelab](https://www.tecnelab.it/news/tecnologie/wolters-kluwer-presenta-lerp-genya-dedicato-alle-pmi); [HWUpgrade](https://edge9.hwupgrade.it/news/innovazione/wolters-kluwer-tax-accounting-italia-rende-disponibile-l-erp-genya-anche-alle-pmi_135075.html); [Innovation Post](https://www.innovationpost.it/tecnologie/automazione/wolters-kluwer-amplia-la-suite-genya-con-un-nuovo-software-per-la-gestione-delle-scorte-dedicato-alle-pmi/)
- Prezzo Arca Evolution: non pubblico, dipende da moduli, utenti, on-premise o hosted e personalizzazioni. Il modello è licenza una tantum più canone annuo per aggiornamenti e assistenza — [Globalist 25/06/2026](https://www.globalist.it/media/2026/06/25/arca-evolution-guida-completa-al-gestionale-erp-per-pmi/); [gestionaleaziendale.info](https://gestionaleaziendale.info/arca-evolution-prezzo/)
  - Capterra indica "$55/utente/mese", dato non verificato — [Capterra](https://www.capterra.com/p/218317/ARCA-EVOLUTION/)

**Buffetti**
- La linea attuale è eBridge:
  - eBridge Azienda: suite modulare per PMI (magazzino, commerciale, contabilità ordinaria, semplificata e professionisti) con riconciliazione bancaria integrata nella linea Contabilità.
  - eBridge Commercialisti, per gli studi.
  - Fonti: [Il Centro FB – eBridge Azienda](https://www.ilcentrofb.it/scopri-il-software-gestionale-flessibile-per-la-crescita-della-tua-pmi/); [Soluzioni Ufficio](https://www.soluzioni-ufficio.it/software/aziende/ebridge)
- Altri prodotti:
  - "HUB Fatture e Corrispettivi" acquisisce le fatture dall'Agenzia delle Entrate via web service SDICoop — [Buffetti](https://buffetti.it/software/software-gestionale-per-aziende/gestionale-aziendale.html)
  - Nel gruppo ci sono anche Open Manager e Dylog — [Informatica Ufficio Buffetti](https://www.informaticaufficiobuffetti.it/software-gestionali/)
  - "Buffetti Easybusiness" è un prodotto più datato, da installare in locale — [Appvizer](https://www.appvizer.it/organizzazione/business-mgt/software-gestionale-buffetti)
- Non ho trovato prodotti chiamati "Buffetti GB" o "Easy Gestionale" nei risultati (vedi Gaps).

**ESA Software (Rimini)**
- Linee storiche: e/ready (PMI), e/impresa (aziende a commessa), e/studio (commercialisti) — [Bitservice](https://www.bitservicesrl.it/ita/blog/62/software-gestionale)
- Storia societaria:
  - 24 Ore Software, che includeva ESA, è stata ceduta a TeamSystem nel maggio 2014 per €112 milioni ed è diventata TSS S.p.A.
  - La sede di Rimini (ex ESA) ha chiuso a settembre 2016 e il personale è stato trasferito a Pesaro.
  - Fonti: [newsrimini 2016](https://www.newsrimini.it/2016/06/chiude-tss-ex-esa-software-gli-80-lavoratori-trasferiti-pesaro-sindacati-preoccupante/); [San Marino RTV](https://www.sanmarinortv.sm/news/comunicati-c9/tss-spa-ex-esa-software-si-trasferisce-pesaro-a161589)
- Un registro camerale indica ESA Software S.p.A. come "cessata" — [Ufficio Camerale](https://www.ufficiocamerale.it/4254/esa-software-spa)
- Nessuna evidenza di un prodotto "esa+".

**Sistemi S.p.A. (Torino)**
- Spring SQL è per le piccole imprese. La base copre contabilità, ciclo attivo e passivo, magazzino; gli add-on aggiungono analitica, cash flow e agenti — [Sistemi Forlì](https://www.sistemiforli.it/aziende/spring); [Sistemi Due Roma](https://www.sistemidueroma.it/prodotti/software-per-aziende/spring-sql)
- eSOLVER è l'ERP per medie aziende strutturate (amministrazione, tesoreria, analitica, logistica) — [Altsys](https://www.altsys.it/software-in-sardegna/spring-esolver/); [Sistemi Due Milano](https://www.sistemiduemilano.it/prodotti/erp-gestionali-per-aziende)
- PROFIS è per commercialisti e si integra con eSOLVER e Spring. "PROFIS per l'azienda" (medio-grandi) prende i dati contabili dall'ERP per bilancio, XBRL e dichiarativi — [Sistemi APG](https://www.sistemiapg.it/soluzioni/gestionali-sistemi/profis/)

**Open source (cenni; coperto da altro ricercatore)**
- La localizzazione italiana di Odoo è il repository OCA/l10n-italy: attivo, branch di default 19.0, aggiornato il 10/10/2026 — [GitHub OCA/l10n-italy](https://github.com/OCA/l10n-italy)
- Dolibarr: nessuna verifica effettuata.

**Windows 10 (contesto infrastrutturale)**
- Alcune testate riportano che Microsoft ha esteso l'ESU consumer di Windows 10 fino al 12/10/2027. Non ho trovato la conferma ufficiale Microsoft — [Volksstimme](https://www.volksstimme.de/leben/technik/windows-10-microsoft-schickt-nun-updates-bis-herbst-2027-4274790); [ProPakistani](https://propakistani.pk/?p=1039144)
- Windows 10 Enterprise LTSB 2016 e IoT LTSB 2016 terminano il supporto il 13/10/2026. L'ESU per aziende costa $61 per dispositivo il primo anno ($45 con Intune/Autopatch) — [Windows Central](https://www.windowscentral.com/microsoft/windows-11/microsoft-preps-esu-for-windows-10-ltsb-releases-retiring-in-2026)

### Inferences
- Per un'azienda di 10-30 persone su Windows 10/Windows Server, tutti i prodotti "di fascia" (Mexal, AHR, Arca Evolution) sono tecnicamente installabili in LAN.
- Windows 10 come client è ancora dichiarato da Passepartout (iDesk "Windows 10 o superiore"). Tuttavia ogni componente lato server legato a SQL Server 2025 impone x64 e Windows 10+, e il supporto di sicurezza di Windows 10 dipende ormai dall'ESU. Un prodotto custom dovrebbe puntare a Windows 11 / Windows Server 2022-2025 e a un client browser.
- Il pattern dominante degli incumbent è: DB relazionale server (SQL Server), client Windows "spesso", poi client web/browser (AHR Web, Ad Hoc Infinity, Mexal iDesk/WebDesk), e infine hosting gestito dal partner. Mexal vieta l'installazione su NAS/NFS: conferma che il modello "archivio su cartella condivisa" (tipo Access/file DB) è da evitare.
- Fascia prezzo (inferenza da frammenti): ERP on-premise per PMI tra qualche migliaio e qualche decina di migliaia di euro tra licenza, canone e implementazione. Una guida 2026 indica 3.500-25.000 € — [Lemio](https://lemio.it/blog/quanto-costa-gestionale-aziendale-2026). È un dato non verificato e generico.

### Gaps
- Nessun listino ufficiale 2026 per Mexal, AHR, Ad Hoc Infinity, Gestionale 1, TS Enterprise / ALYANTE / Lynfa, Arca Evolution / eGO, Genya, eBridge, Spring SQL / eSOLVER: i prezzi non sono pubblici.
- Requisiti aggiornati 2025-26 (versioni SQL Server e Windows certificate) non trovati per AHR, Arca Evolution, Gestionale 1, TS Enterprise, eBridge, Spring.
- Database di Gestionale 1 non verificato. Non ho potuto verificare quale pagina Zucchetti dichiari "client/server, web, on-premise / cloud SaaS" (una sintesi la attribuiva a una pagina intitolata "medie e grandi aziende").
- Non verificati: "Buffetti GB", "Easy Gestionale", "esa+", un prodotto "Sistemi Gestionale" distinto da Spring/eSOLVER, "Arca EVO" come prodotto distinto.
- Motore DB attuale di TeamSystem Enterprise / ALYANTE (POLYEDRO) non confermato da fonti recenti.

## 2. Prima nota: causali contabili, contabilizzazione automatica, piano dei conti, partitari, centri di costo/commesse, ratei/risconti, cespiti

### Takeaway
Tutti gli incumbent usano la partita doppia guidata da causali configurabili. La causale è l'oggetto chiave: decide registro IVA, sezionale, contropartita IVA, partite e scadenze. Prima nota e partite/scadenze si aggiornano in tempo reale. I documenti (fatture attive, passive, distinte, insoluti) vengono contabilizzati automaticamente in prima nota. Analitica e commesse sono una dimensione separata dal piano dei conti, valorizzabile direttamente in prima nota o sui documenti.

### Cited Findings
- **Causale come struttura del movimento (AHR).**
  - In AHR la contabilità generale, con o senza IVA, è "guidata da Causali che rappresentano la struttura dei movimenti contabili", con aggiornamento in tempo reale di partite e scadenze — [Brochure AHR 8.0](http://www.progettoedp.it/wp-content/uploads/2018/06/AHR-brochure_8.0.pdf); [Altaquota](https://www.aquota.net/prodotti/ad-hoc-revolution/)
  - Campi della causale contabile in AHR Web:
    - Tipo registro IVA: vendite, acquisti, corrispettivi (scorporo o ventilazione), oppure "no IVA" come default per le causali senza IVA.
    - Numero registro IVA: proposto ma modificabile.
    - Contropartita IVA: obbligatoria; lo zoom mostra solo conti di tipo IVA; è usata anche nella contabilizzazione dei documenti dei cicli vendite e acquisti.
    - Flag "note su registri IVA".
    - Flag di controllo coerenza righe IVA / dare-avere.
    - Fonte: [Help Zucchetti – Causale contabile](https://help.zucchetti.it/dms/ticpro/help/sam/ahrw_standard/gscg/gscg_acc.html)
- **Prima nota AHR.**
  - Raccoglie tutte le registrazioni, con o senza IVA. Da qui si producono giornale, registri IVA, liquidazioni e bilanci.
  - Riceve i dati dai documenti clienti e fornitori.
  - Ogni registrazione ha una data di competenza IVA separata dalla data di registrazione. È inizializzata alla data di registrazione ma modificabile, e viene usata per registri e liquidazione.
  - Fonte: [Help Zucchetti – Primanota](https://help.zucchetti.it/dms/ticpro/help/sam/ahrw_standard/gscg/gscg_mpn.html)
- **Contabilizzazione automatica AHR.** Contabilizza documenti attivi e passivi, distinte bancarie, insoluti e cespiti — [Altaquota](https://www.aquota.net/prodotti/ad-hoc-revolution/)
- **Mexal** (fonti aggregate di partner):
  - Piano dei conti preconfigurato e personalizzabile, per regime ordinario, semplificato e forfettario.
  - Contabilizza automaticamente le fatture emesse da magazzino e ammette causali personalizzate.
  - In registrazione si possono creare anagrafiche al volo, usare contropartite automatiche e ripartire su centri di costo/ricavo.
  - Il "saldaconto" velocizza incassi e pagamenti.
  - Include cespiti, ratei e risconti, flussi di cassa e bilancio.
  - Fonti: [Ingest](https://ingest.it/soluzioni-gestionali/passepartout-mexal/gestione-contabilita/); [Passepartout contabilità](https://www.passepartout.net/software/imprese/gestione-contabilita); [ECM Informatica](https://www.ecminformaticasrl.it/passepartout-mexal-bp-contabilita-bilanci-fiscalita/)
- **Analitica Mexal.**
  - Si basa su strutture separate: piano dei conti analitico, commesse, aree, articoli di magazzino. L'elemento "piano dei conti" è obbligatorio nella registrazione analitica; commessa, area e articolo sono opzionali.
  - Il piano dei conti analitico è distinto da quello di contabilità generale, con fino a 9 livelli e lunghezza del codice configurabile per livello.
  - Fonte: [EduPass – Controllo di gestione, introduzione](https://www.edupass.it/manuali/manualistica-mexal/manuale-prodotto?a=manuale-prodotto%2Fazienda%2Fcontrollo-di-gestione%2Fintroduzione)
  - Il modulo commesse e centri di costo traccia costi e ricavi durante l'avanzamento. Su tutti i documenti si possono indicare centro di costo, codice commessa e data di competenza operativa — [Softer – Guida controllo di gestione e commesse PDF](https://www.softer.it/download/guidacontrollogestione.pdf); [ImpresaCity](https://www.impresacity.it/calendario/4893/passepartout-il-controllo-di-gestione-integrato-al-software-di-contabilita-aziendale.html)
  - I centri di costo/ricavo si imputano direttamente in prima nota e alimentano l'analisi di bilancio per centro — [EduPass – Analisi di bilancio per centri](https://www.edupass.it/manuali/manualistica-mexal/manuale-prodotto?a=manuale-adp%2Fanalisi-di-bilancio%2Fanalisi-di-bilancio-con-dettaglio-analitico%2Fanalisi-di-bilancio-per-centri-di-costoricavo-)
- **Gestionale 1 (Zucchetti).** L'analitica si attiva dai parametri: prima gestione centri di costo, poi eventualmente commesse. Poi si creano centri di costo/ricavo, voci di costo/ricavo e commesse — [Help Gestionale 1 – Introduzione contabilità analitica](http://www.gestionale1.it/help/Content/AZIntroduzione_contabilit_analitic.htm)
- **AHR.** Ha contabilità analitica per il controllo di gestione (budget contro consuntivo), gestione commesse e "movimenti di commessa" — [Pipeline](https://www.pipeline.it/gestionali-e-crm/software-gestionale-erp/erp-zucchetti-ad-hoc/); [EDC](https://www.edc.it/gestionali-aziendali-erp-zucchetti/ad-hoc-revolution/); [Edigest brochure](https://www.edigest.it/infinity/dms/Sito%20edigest/allegati/AdHoc-Revolution.pdf)
- **Ad Hoc Infinity.** Area progetti e commesse con Gantt, milestone, timesheet, materiali e costi, e marginalità per commessa e cliente in tempo reale — fonti aggregate: [Zucchetti funzionalità](https://www.zucchetti.it/it/cms/soluzioni/software-gestionali/dimensione-azienda/grandi-aziende/ad-hoc-infinity/programma-gestionale-web-funzionalita.html); [Meazure](https://www.meazure.it/ad-hoc-infinity-zucchetti-cose-come-funziona-e-perche-e-lerp-scelto-dalle-aziende-che-crescono/)
- **Arca Evolution.** Il modulo contabilità copre prima nota, partite aperte clienti/fornitori, IVA, incassi/pagamenti, scadenzario e bilancio — [Azerouno](https://azerouno.it/arca-evolution); [Softwareline – Contabilità e adempimenti](https://softwarelinepl.it/index.php/arcaevolution/contabilita-e-adempimenti)
- **Spring SQL.** Analitica come modulo aggiuntivo — [Sistemi Forlì](https://www.sistemiforli.it/aziende/spring)
- **Lynfa Studio.** Usa un set di "causali contabili standard" documentato (lato studio, utile come riferimento di naming) — [Guida Multi-Causali Standard PDF](https://www.deltagroups.it/cms/wp-content/uploads/2019/05/Guida-Multi-Causali-Standard.pdf)
- **Pattern generico** (GBsoftware): una causale IVA più la contropartita precompilano imponibile e IVA in registrazione — [Guide GBsoftware](https://guidegbsoftware.it/contabilita/prima-nota/7-2-0-la-gestione-della-prima-nota/)

### Inferences
- Il cuore da copiare è una **tabella Causali contabili** con questi attributi:
  - tipo registro IVA (V/A/Corrispettivi/nessuno) e numero registro/sezionale;
  - contropartita IVA;
  - segno e conto cliente/fornitore;
  - flag "gestisce partite/scadenze";
  - flag "richiede analitica/commessa";
  - flag "doppio protocollo" (reverse charge);
  - causale collegata per la seconda registrazione;
  - descrizione standard.
- Le fatture attive e passive non vanno scritte "a mano" in prima nota: si generano registrazioni da documento, collegate al documento sorgente (ID documento / ID SdI). La cancellazione o rettifica avviene via documento.
- Data registrazione e data competenza IVA devono essere due campi distinti (pattern AHR). È indispensabile per le fatture passive ricevute a cavallo di mese o anno e per la detrazione.
- Per un installatore FV/elettrico la **commessa/cantiere** va gestita come dimensione analitica facoltativa su ogni riga di prima nota e su ogni riga di documento:
  - il piano dei conti resta snello;
  - la commessa porta margine, costi e ricavi;
  - la riga di costo di una fattura passiva può essere imputata a una commessa già in fase di import (vedi sezione 5).
- Piano dei conti: tutti offrono un piano preconfigurato e personalizzabile. Per un prodotto limitato basta un piano a 3 livelli (mastro/conto/sottoconto), con clienti e fornitori come sottoconti automatici o partitari collegati all'anagrafica. Questa è un'inferenza: non ho trovato la struttura esatta dei livelli di Mexal o AHR.
- Ratei/risconti e cespiti sono presenti in tutti, ma per un prodotto limitato a fatture e prima nota si possono lasciare al commercialista. Basta permettere registrazioni libere con causali dedicate.

### Gaps
- Struttura esatta dei livelli del piano dei conti di contabilità generale (gruppo/mastro/conto/sottoconto) di Mexal, AHR e Arca: non trovata.
- Non ho trovato documentazione su come gli incumbent gestiscono commesse "di cantiere" specifiche per impiantisti (SAL, ritenute a garanzia, ecc.). La ricerca mirata non è stata eseguita per esaurimento del budget.
- TeamSystem Enterprise / ALYANTE: nessun dettaglio funzionale su causali e prima nota trovato.

## 3. IVA: registri, protocollo, liquidazione, LIPE, reverse charge/integrazione, split payment, IVA per cassa, plafond

### Takeaway
Gli incumbent coprono registri IVA vendite, acquisti e corrispettivi (registri numerati e sezionali), liquidazione periodica, LIPE telematica e F24. Mexal li include "senza moduli aggiuntivi". Il reverse charge si gestisce in due modi: (a) due registrazioni con causali dedicate (AHR, intra-UE), oppure (b) una registrazione che genera automaticamente la doppia annotazione con un secondo protocollo (Accresco/Bluenext; protocollo secondario in Acut). Di conseguenza il documento d'integrazione TD16-19 inviato a SdI non va ricontabilizzato.

### Cited Findings
- **Mexal.** Senza moduli aggiuntivi stampa registri contabili e fiscali, liquida l'IVA e trasmette la LIPE, genera l'F24 e prepara il bilancio XBRL con invio tramite DIRE (fonti aggregate) — [Ingest](https://ingest.it/soluzioni-gestionali/passepartout-mexal/gestione-contabilita/); [Mainfo](https://www.mainfo.it/passepartout-mexal/)
- **Mexal "Integrazione elettronica".** Esiste una funzione nell'area "Operazioni con l'estero – Operazioni passive" per generare l'integrazione elettronica (contenuto non letto) — [EduPass pillola Integrazione elettronica](https://www.edupass.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=operazioni-con-lestero%2Foperazioni-passive%2Fintegrazione-elettronica)
- **AHR/Ad hoc.** Gli acquisti intra-UE richiedono due registrazioni: la prima sul registro acquisti, la seconda sul registro vendite con una causale propria (manuale Ad hoc, datato) — [Manuale Contabilità generale Ad hoc rel. 7.0](http://ftp2.uesse.com/Ad_hoc_Windows/Manuali/Contabilit%C3%A0%20generale.pdf); [Manuale Ad hoc 2006](https://www.erreciservice.com/Manuali/MANUALE%20AD-HOC.pdf)
  - Le FAQ dei rivenditori Ad hoc trattano anche reverse charge e split payment (contenuto non letto) — [Adhocenter FAQ](https://www.adhocenter.com/faq/)
- **Doppio protocollo (Acut).** Il secondo protocollo IVA vale solo per le registrazioni in inversione contabile (reverse charge, extra-UE). Il protocollo viene attribuito automaticamente in base al registro della causale — [Acut – Gestione prima nota](https://learning.acut.it/tutorial/gestione-prima-nota)
- **Doppia annotazione automatica (Bluenext/Accresco).**
  - Contabilizzare la fattura in reverse charge genera da sola la doppia annotazione su registro acquisti e vendite.
  - Quindi l'autofattura/integrazione TD16 inviata a SdI non va contabilizzata di nuovo.
  - Nel tracciato XML si compila il riferimento alla fattura d'acquisto, blocco 2.1.6.
  - Fonte: [Bluenext helpdesk – Autofattura TD16](https://helpdesk.bluenext.it/it/support/solutions/articles/32000032181-autofattura-td16)
- **Normativa (sintesi da guide 2026).**
  - TD16 = reverse charge interno; TD17 = servizi da fornitori esteri.
  - L'integrazione va annotata nei registri vendite e acquisti, entro il mese di ricevimento o entro 15 giorni con riferimento a quel mese.
  - Nelle fatture miste si integra solo la parte in reverse.
  - Invio a SdI del TD16: per alcune fonti facoltativo, per altre consigliato (fonti in conflitto). Il TD17 è obbligatorio.
  - Fonti: [Sibill](https://sibill.com/contabilita/td16-e-integrazione-iva-gestire-correttamente-il-reverse-charge-interno/); [Fiscomania](https://fiscomania.com/autofattura-guida-casi-emissione/); [Turbofattura](https://www.turbofattura.com/guide/autofattura); [Commercialista Telematico](https://www.commercialistatelematico.com/articoli/2022/06/td16-per-reverse-charge-interno-ed-emissione-note-credito.html)
- **Sistemi (eSOLVER / Spring SQL).** Hanno note operative sulla "gestione integrazioni e autofatture estere" in fatturazione elettronica e sull'avvio esercizio 2024 — [Sistemi Tre – integrazioni e autofatture](https://www.sistemitre.it/noteoperative/caso-risolto-gestione-integrazioni-e-autofatture-estere-e-solver-enologia-e-spring-sql/); [Sistemi Tre – avvio esercizio 2024](https://www.sistemitre.it/noteoperative/note-operative-di-avvio-esercizio-2024-e-solver-enologia-spring-sql/)
- **Arca Evolution.** Il modulo contabilità include la "gestione IVA" — [Azerouno](https://azerouno.it/arca-evolution)

### Inferences
- Per un installatore FV/elettrico il reverse charge interno (art. 17 c.6 DPR 633/72, che copre installazione di impianti negli edifici, subappalti edili e simili) è frequente sia in vendita sia in acquisto. Il pattern consigliato:
  - in acquisto, una sola registrazione della fattura passiva con causale "RC interno" che genera automaticamente l'annotazione sul registro vendite con secondo protocollo;
  - generazione opzionale del TD16 (e obbligatoria del TD17/18/19 per l'estero) collegato alla registrazione e non ricontabilizzato;
  - in vendita, fattura con natura N6.x senza IVA.
  - (Il riferimento normativo art. 17 c.6 è conoscenza generale, non verificata in questa sessione.)
- Split payment (scissione dei pagamenti verso PA), IVA per cassa e plafond: serve almeno un flag sulla causale/registro e il calcolo in liquidazione. Gli incumbent li coprono, ma non ho fonti puntuali (vedi Gaps).
- La liquidazione periodica e il file LIPE sono "standard" in tutti gli ERP. In un prodotto limitato conviene generare almeno il prospetto di liquidazione e l'export LIPE XML, oppure delegarli al commercialista tramite export dei registri.

### Gaps
- Nessuna fonte letta su split payment, IVA per cassa, plafond, dichiarazione IVA annuale per prodotto (Mexal, AHR, Arca, TS). Le ricerche erano pianificate ma non eseguite per esaurimento del budget.
- Contenuto della pillola Mexal "Integrazione elettronica" non letto: non so se Mexal fa la doppia annotazione con una o due registrazioni.
- Protocollo fatture passive: numerazione per registro/sezionale confermata solo in modo generico (AHR "numero registro IVA", Acut).

## 4. Scadenzario, incassi/pagamenti, RiBa/SDD/bonifici, file CBI/SEPA, import estratti conto, riconciliazione bancaria

### Takeaway
Lo scadenzario nasce dalle partite generate dalle registrazioni con condizioni di pagamento ed è aggiornato in tempo reale (AHR). Su di esso si costruiscono distinte RiBa e bonifici SEPA (CBI/XML), incassi e pagamenti veloci ("saldaconto" Mexal) e riconciliazione bancaria. Mexal ha introdotto la riconciliazione solo nella release 2022A: import CBI TXT "RH", aggancio al conto banca via IBAN, tabella causali CBI standard, download PSD2 opzionale a pagamento, matching assistito da AI. Arca la offre come modulo con abbinamento automatico e manuale.

### Cited Findings
- **Mexal, riconciliazione bancaria.**
  - Introdotta nella release 2022A per le aziende che gestiscono lo scadenzario.
  - Import solo da file CBI TXT di tipo "RH" esportato dall'home banking, con layout CBI non standard configurabili (importo e segno).
  - I movimenti si collegano al conto banca del piano dei conti tramite IBAN.
  - Fonti: [EduPass corso riconciliazione (27/02/2023) PDF](https://www.edupass.it/StreamFile/Resources/materialevideocorsiriservati/corso_riconciliazione.pdf); [EduPass pillola Riconciliazione PDF](https://www.edupass.it/Resources/Edupass-Manuali/Manuali/pdf/pillole/Riconciliazione%20bancaria.pdf); [EBS Informatica](https://blog.ebsinformatica.it/nuova-funzione-di-riconciliazione-bancaria/)
  - Le causali CBI sono standard e non modificabili dall'utente — [EduPass – Tabella causali CBI](https://www.edupass.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=riconciliazione-bancaria%2Ftabella-causali-cbi)
  - Il download automatico via PSD2 richiede un'attivazione e un contratto separati. "Mexal AI" migliora il matching. Il modulo è a pagamento — fonti aggregate: [BP Project – Mexal AI e riconciliazione](https://www.bpproject.it/riconciliazione-bancaria-con-ai-di-mexal/); [Ingest evento](https://ingest.it/eventi/passepartout-mexal-riconciliazione-bancaria/); [Pass Italia](https://www.passitalia.com/news/dettaglio-news/articolo/arricchimento-anagrafiche-e-riconciliazione-bancaria)
- **Mexal, RiBa e SEPA.**
  - Esiste una funzione "Emissione RiBa" tra le stampe contabili "effetti / MAV / CBI / bonifici / RID".
  - Il codice CUC CBI (8 caratteri) è obbligatorio per generare bonifici SEPA XML.
  - Fonte: [EduPass – Emissione RiBa](https://prova-edupass.passweb.it/manuali/manualistica-mexal/manuale-prodotto?a=manuale-prodotto/contabilita/stampe-contabili/effettimavccbonificirid/emissione-riba)
- **Mexal, saldaconto.** Registra incassi e pagamenti "in maniera più rapida e completa" — [Ingest](https://ingest.it/soluzioni-gestionali/passepartout-mexal/gestione-contabilita/)
- **AHR.**
  - Aggiorna in tempo reale partite e scadenze dalla prima nota — [Help Zucchetti – Primanota](https://help.zucchetti.it/dms/ticpro/help/sam/ahrw_standard/gscg/gscg_mpn.html)
  - Contabilizza in automatico distinte bancarie e insoluti — [Altaquota](https://www.aquota.net/prodotti/ad-hoc-revolution/)
  - Ad Hoc Infinity ha tesoreria, remote banking, cash flow e gestione del credito — [Zucchetti](https://www.zucchetti.it/it/cms/soluzioni/software-gestionali/dimensione-azienda/grandi-aziende/ad-hoc-infinity/programma-gestionale-web-funzionalita.html)
- **Arca Evolution.**
  - Tesoreria: flussi di cassa, fidi, RiBa, bonifici, linee di finanziamento, castelletti bancari — fonti aggregate: [Ribo](https://www.ribo.it/gestionali/gestione-finanziaria-aziendale-senza-pensieri-con-arca-evolution/); [Softwareline](https://softwarelinepl.it/index.php/arcaevolution/contabilita-e-adempimenti)
  - Il modulo riconciliazione confronta, banca per banca, i movimenti contabili con la rendicontazione dell'home banking. I non abbinati si riconciliano a mano, e il modulo richiede la Contabilità — fonti aggregate: [PmiSoftware](https://www.pmisoftware.it/software-gestionale-arca-evolution/); [Delta Sistemi](http://www.deltasistemi-al.it/prodotti-servizi/soluzioni-per-aziende/arca-evolution)
- **Buffetti eBridge.** Riconciliazione bancaria "totalmente integrata nella linea Contabilità" — [Il Centro FB](https://www.ilcentrofb.it/scopri-il-software-gestionale-flessibile-per-la-crescita-della-tua-pmi/)

### Inferences
- Pattern da copiare:
  1. Le condizioni di pagamento sull'anagrafica e sul documento generano N rate nello scadenzario alla contabilizzazione.
  2. Le rate RiBa e SDD si raggruppano in "distinte" che producono il file CBI (RiBa) o SEPA XML (pain.008 per SDD, pain.001 per bonifici). Il CUC aziendale va in configurazione banca.
  3. La presentazione della distinta genera la registrazione "effetti all'incasso / banca c/SBF".
  4. Gli insoluti riaprono la partita con una registrazione automatica.
  5. L'import dell'estratto conto produce movimenti banca, abbinati alle partite aperte per importo, data e controparte (IBAN, nome), più un abbinamento manuale. Dall'abbinamento si genera la registrazione d'incasso o pagamento.
- La tabella delle causali bancarie CBI standard, mappate a causali contabili, è un elemento a basso costo e alto valore.
- Gli incumbent supportano in modo documentato il **CBI "RH"** (Mexal). Un prodotto nuovo dovrebbe supportare anche **CAMT.053**, che sostituisce progressivamente il CBI TXT. Questa è un'inferenza: non ho trovato fonti sul supporto CAMT.053 di questi prodotti.

### Gaps
- Supporto CAMT.053, SDD (pain.008) e formato CBI "MAV/RID" per prodotto: non verificato.
- Prezzi dei moduli di riconciliazione e PSD2: non trovati ("a pagamento" in Mexal).
- TeamSystem: nessuna fonte su riconciliazione e tesoreria per Enterprise / Lynfa.

## 5. Fatture passive: ricezione da SdI/hub, import, abbinamento e registrazione

### Takeaway
Il modello maturo (Mexal Docuvision) è un **cruscotto delle fatture ricevute**. Le fatture arrivano dall'hub del vendor (codice destinatario dedicato) o da import di XML in cartella. Nel cruscotto sono in stato "Da esaminare". L'anteprima permette di modificare le singole righe prima della contabilizzazione. Ci sono due modalità: import sintetico (conto di costo automatico) oppure dettagliato per riga (contropartita per riga). Registrazione e XML restano collegati. Per reimportare occorre prima cancellare la registrazione.

### Cited Findings
- **Mexal, percorso di import.**
  - Percorso: Azienda → Docuvision → Fatture elettroniche PA/B2B → Fatture ricevute → Import fatture ricevute. La cartella XML resta memorizzata.
  - Prima di contabilizzare compare un'anteprima, modificabile per riga.
  - Fonte: [EduPass – Funzioni di import fatture](https://prova-edupass.passweb.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=import-fatture-elettroniche-ricevute/funzioni-di-import-fatture)
- **Mexal, due modalità di import.**
  - "Import primanota dettagliato riga articolo [F4]" permette di impostare la contropartita di costo per riga.
  - "Import primanota [F10]" usa il conto automatico, di solito "Merci c/acquisti".
  - Per rifare l'import va cancellata la registrazione contabile.
  - Fonte: [EduPass – Import fatture (con ritenuta)](https://prova-edupass.passweb.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=fatture-ricevute-con-ritenuta/registrazione-fattura-e-pagamento/import-fatture)
- **Mexal, controlli in import.** Se una fattura non compare, bisogna verificare nazione, CF e P.IVA dell'azienda e la nomenclatura del file. In pratica il filtro è sul cessionario = azienda — [EduPass – Funzioni di import fatture](https://prova-edupass.passweb.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=import-fatture-elettroniche-ricevute/funzioni-di-import-fatture)
- **Mexal, cruscotto fatture ricevute B2B.**
  - Le fatture arrivano se il fornitore indica il codice destinatario Passepartout 5RUO82D, oppure se questo è registrato presso l'Agenzia delle Entrate per la P.IVA, con il servizio FE attivo.
  - Le nuove fatture entrano nello stato "Da esaminare".
  - Il cruscotto permette di ricevere, verificare e importare fatture e note di credito, con registrazione automatica in prima nota e file XML collegato.
  - Fonte: [EduPass – Cruscotto fatture](https://prova-edupass.passweb.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=fatturazione-elettronica-con-servizio-invio-e-ricezione/cruscotto-fatture)
- **Mexal, fatture emesse con altri programmi.**
  - Si importano con il flag "Registrazione primanota".
  - Il flag "Documenti già inviati a SDI" va attivato se le fatture sono già state trasmesse con un altro software.
  - Per la conservazione "All Inclusive" servono anche le ricevute di consegna.
  - Fonti: [EduPass – Import fatture elettroniche emesse](https://www.edupass.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=import-fatture-elettroniche-emesse); [EduPass – Invio fatture importate](https://www.edupass.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=import-fatture-elettroniche-emesse%2Finvio-delle-fatture-importate)
- **AHR.** Contabilizza automaticamente i documenti passivi. La contropartita IVA della causale è usata nella contabilizzazione dei documenti del ciclo acquisti — [Altaquota](https://www.aquota.net/prodotti/ad-hoc-revolution/); [Help Zucchetti – Causale](https://help.zucchetti.it/dms/ticpro/help/sam/ahrw_standard/gscg/gscg_acc.html)
- **Gestionale 1.** Ricezione delle fatture fornitori in contabilità tramite Digital Hub, con modulo contabilità G1CON o G1STU — [Gestionale 1 FAQ FE](http://www.gestionale1.it/help/Content/G1FAQ/FatturazioneElettronica.htm)
- **Buffetti.** "HUB Fatture e Corrispettivi" scarica fatture e corrispettivi direttamente dall'Agenzia delle Entrate via SDICoop — [Buffetti](https://buffetti.it/software/software-gestionale-per-aziende/gestionale-aziendale.html)

### Inferences
- Workflow consigliato per il prodotto custom, ricalcato su Mexal ma migliorabile:
  1. **Acquisizione** da più canali: canale SdI/intermediario, download dal "Cassetto fiscale / Fatture e corrispettivi" dell'Agenzia delle Entrate, cartella o email PEC, upload manuale XML/P7M.
  2. **Cruscotto con stati**: Da esaminare → In verifica → Registrata → (Pagata). Dedup per IdentificativoSdI, oppure per hash del file / P.IVA cedente + numero + data.
  3. **Proposta di registrazione**:
     - il fornitore viene riconosciuto o creato da P.IVA;
     - causale e conto di costo default per fornitore (memoria dell'ultima registrazione);
     - modalità sintetica (un conto) o dettagliata per riga;
     - commessa/cantiere per riga, essenziale per un installatore;
     - riconoscimento automatico di reverse charge (Natura N6.x) e ritenuta d'acconto;
     - scadenze generate dal blocco DatiPagamento dell'XML.
  4. **Collegamento permanente XML ↔ registrazione ↔ partita**. Per rettificare si annulla la registrazione e si reimporta (pattern Mexal).
- "Matching automatico" con ordini o DDT d'acquisto: per un prodotto limitato a fatture e prima nota non serve. Basta il matching anagrafica fornitore + conto/commessa suggerito.

### Gaps
- Funzionalità di import fatture passive di TeamSystem Enterprise / Lynfa, Arca Evolution, eBridge, Spring/eSOLVER: non trovate nel dettaglio.
- Logiche di "apprendimento" del conto di costo per fornitore negli incumbent: non verificate.

## 6. Collaborazione con il commercialista (modelli studio-azienda, export)

### Takeaway
Esistono due modelli.
- **Piattaforma condivisa** dello stesso vendor: Passepartout Mexal↔Passcom, TeamSystem Lynfa Azienda↔TS Studio/Lynfa Studio, Wolters Kluwer Genya, Sistemi Spring/eSOLVER↔PROFIS, Zucchetti verso Ago. Studio e azienda lavorano sugli stessi dati senza export.
- **Export di file** con mappatura del piano dei conti, quando i vendor sono diversi.

Questo è un forte fattore di lock-in commerciale: spesso l'azienda sceglie il gestionale del proprio commercialista.

### Cited Findings
- **Passepartout.**
  - Il commercialista accede da Passcom ai dati contabili del cliente Mexal senza export/import. Il "lavoro sugli stessi dati in tempo reale" è una formulazione dei partner — fonti aggregate: [gestionalepassepartout.it – Passcom](https://gestionalepassepartout.it/passcom-2/); [Lineacomputer – Passcom](https://www.lineacomputer.net/software-gestionale-passepartout/passcom-commercialista)
  - Passcom è definito "il primo software gestionale per commercialisti nato in Cloud" — [Lineacomputer – Passcom](https://www.lineacomputer.net/software-gestionale-passepartout/passcom-commercialista)
  - L'articolo sulla "sinergia tra Mexal e Passcom" cita anche l'acquisizione di IF Technology (MES) — [Top Trade](https://www.toptrade.it/featured/passepartout-cresce-la-sinergia-tra-mexal-e-passcom/)
- **TeamSystem.**
  - Lynfa Azienda importa le registrazioni tenute dallo studio in TS Studio ed esporta i dati contabili verso gli studi — [Sima Software](https://www.sima-software.it/software-gestionale-teamsystem-aziende/prodotto-lynfa-azienda-polyedro.html)
  - Esistono modelli in cui l'azienda non tiene la contabilità interna e lo studio fa la tenuta — [Sima Software – Lynfa Studio](https://www.sima-software.it/software-gestionale-teamsystem-professionisti/lynfa-studio-polyedro.html)
  - Esempio di export tra vendor: Reviso esporta la contabilità verso TeamSystem Studio con mappatura dei codici — [Reviso](https://www.reviso.com/it/assistenza/articoli/inviare-la-contabilita-a-lynfa/)
- **Wolters Kluwer Genya.** Il punto di forza dichiarato è la condivisione con il commercialista sullo stesso strumento cloud (Azure) — [Digital World Italia](https://www.digitalworlditalia.it/applicazioni-enterprise/erp/wolters-kluwer-trasforma-le-piccole-imprese-con-il-nuovo-erp-genya-per-le-pmi-171759); [Osrasud](https://www.osrasud.com/genya-di-wolters-kluwer-gestionale-in-cloud-per-commercialisti-e-aziende/)
- **Sistemi.** PROFIS si integra con eSOLVER e Spring. "PROFIS per l'azienda" prende i dati dall'ERP per bilancio, XBRL e dichiarativi — [Sistemi APG](https://www.sistemiapg.it/soluzioni/gestionali-sistemi/profis/)
- **Zucchetti.** AGO Infinity è lo strumento lato studio (commercialisti, associazioni) — [Zucchetti Ago Infinity](https://www.zucchetti.it/it/cms/professionisti/contabilita-fisco-finanza/gestione-contabile-fiscale/ago-infinity/software-gestionale-per-commercialisti.html)
- **Buffetti.** eBridge Commercialisti, accanto a eBridge Azienda — [Il Centro FB](https://www.ilcentrofb.it/scopri-il-software-gestionale-che-semplifica-la-contabilita-e-fa-crescere-il-tuo-studio-professionale/)

### Inferences
- Un prodotto custom non può replicare il collegamento "nativo" studio-azienda. Deve quindi eccellere nell'**export verso lo studio**:
  1. pacchetto periodico (mese o trimestre) con tutti gli XML attivi e passivi più le ricevute SdI;
  2. registri IVA e prospetto di liquidazione (PDF + CSV);
  3. prima nota / giornale in CSV o Excel con il codice conto dello studio, tramite una tabella di mappatura piano dei conti aziendale → piano dei conti dello studio (pattern Reviso);
  4. scadenzario aperto e movimenti banca riconciliati.
- Prima di progettare il formato di export conviene chiedere al commercialista di Energenia quale software usa (Passcom, TS Studio/Lynfa, Ago, Profis, Genya, ecc.). Alcuni hanno tracciati di import documentati, che non ho verificato.

### Gaps
- Tracciati di import contabile pubblici (es. tracciato import prima nota TS Studio, Passcom, Ago, Profis): non ricercati per esaurimento del budget.

## 7. Sentiment degli utenti (lodi e critiche)

### Takeaway
I dati di recensione pubblici sono pochi e con campioni piccoli. Su Mexal (9 recensioni Capterra) le lodi riguardano completezza contabile, semplicità e assistenza; le critiche l'interfaccia datata, l'export in Excel limitato e la distanza tra demo e uso reale. Per gli altri prodotti non ho trovato recensioni utilizzabili.

### Cited Findings
- **Capterra, Mexal.** 4,6/5 su 9 recensioni: facilità d'uso 4,4, funzionalità 4,6, assistenza 4,5, rapporto qualità-prezzo 4,5. Alcune pagine di confronto mostrano anche "4,3 su 358 recensioni", dato di attribuzione incerta — [Capterra IT confronto Odoo vs Mexal](https://www.capterra.it/compare/135618/199649/odoo/vs/mexal); [Capterra IT SAP vs Mexal](https://www.capterra.it/compare/152293/199649/sap-s-4hana/vs/mexal)
  - Pro: uso semplice supportato dal manuale; gestione del flusso contabile dalla fattura al bilancio; assistenza "celere" — [Capterra](https://www.capterra.com/p/199649/Mexal/)
  - Contro: "grafica abbastanza datata"; "non esportabilità di molti documenti in Excel" — [Capterra](https://www.capterra.com/p/199649/Mexal/)
- **ERP Selection, Mexal.** Opinioni miste, inclusa una molto negativa: "Belle le demo, poi scopri che non è proprio così... Personalmente lo eviterei" — [ERP Selection](https://www.erpselection.it/software/passepartout-mexal/)
- **Esistono pagine Capterra** per TeamSystem Enterprise, TeamSystem Azienda e ARCA EVOLUTION, ma senza dati di rating estratti — [Capterra TS Enterprise](https://www.capterra.com/p/228606/TeamSystem-Enterprise/); [Capterra TeamSystem Azienda](https://www.capterra.com/p/218908/TeamSystem-Azienda/); [Capterra Arca](https://www.capterra.com/p/218317/ARCA-EVOLUTION/)
- **Prezzi SaaS in aumento.** Una guida riporta aumenti annui dei listini SaaS del 5-10% (fonte non primaria) — [nis2-italia](https://nis2-italia.it/software-gestionale)

### Inferences
- Le critiche ricorrenti agli ERP desktop italiani riguardano UI datata, complessità, export rigidi e costo crescente del canone. Questo crea spazio per un prodotto custom con:
  - UI moderna e veloce;
  - export Excel/CSV ovunque;
  - poche funzioni ma ben fatte (fatture, prima nota, IVA, scadenzario, banca).
- La base di evidenze è sottile (un solo prodotto con recensioni). Va trattata come indicativa.

### Gaps
- Recensioni o forum su AHR, Gestionale 1, TS Enterprise / ALYANTE / Lynfa, Arca Evolution, eBridge, Spring: non ricercati per esaurimento del budget (forum italiani, Reddit, G2 non consultati).

## 8. Architettura multiutente e pattern da copiare per una PMI impiantistica (10-30 addetti, Windows 10 / Windows Server)

### Takeaway
Gli incumbent convergono su DB relazionale centralizzato su server (SQL Server; Mexal con server proprietario 64 bit più MySQL per alcuni moduli). Il client è Windows o, sempre più spesso, browser (AHR Web, Ad Hoc Infinity, Mexal iDesk/WebDesk, TeamSystem POLYEDRO). L'accesso remoto avviene via hosting del vendor o del partner invece che via RDP. Per il prodotto custom il pattern più sensato è un'app web self-hosted sul Windows Server aziendale (DB PostgreSQL o SQL Server Express), con funzioni ricalcate sulle best practice delle sezioni 2-6.

### Cited Findings
- **Mexal.**
  - Server a 64 bit su Windows Server, Windows Workstation o Linux. Dimensionamento RAM per numero di postazioni. Non installabile su NAS/NFS. Moduli su RDBMS MySQL via ODBC — [EduPass Nozioni generali](https://www.edupass.it/StreamFile/Resources/Documenti/Manuali/Mexal-Businesspass/NozioniGenerali.pdf); [EduPass RDBMS](https://www.edupass.it/manuali/manualistica-mexal/manuale-prodotto?a=manuale-prodotto/nozioni-generali/ambienti-operativi/rdbms-per-moduli-su-database/requisiti-minimi-sistemi-linux-ed-installazione)
  - Client iDesk Windows 10 o superiore più accesso web — [Passepartout](https://passepartout.net/software/gestionale-aziendale)
  - Cloud privato gestito dal partner come alternativa all'on-premise — [LINKWARE](https://linkware.it/software-gestionale/passepartout-mexal/)
- **AHR.** Client-server su Microsoft SQL — [Pentasoft](https://pentasoft.it/index.php?Itemid=1079&catid=22&id=74&option=com_content&view=article)
  - Versione web AHR Web — [Solution Informatica](https://www.solutioninformatica.com/concessionario-zucchetti-ferrara/adhoc-revolution-web/)
  - Ad Hoc Infinity web nativo, cloud o on-premise — [Z-Lab](https://www.z-lab.it/soluzioni/soluzioni-software/ad-hoc-infinity/)
- **Arca Evolution.** Su SQL Server, on-premise o hosted — [Globalist](https://www.globalist.it/media/2026/06/25/arca-evolution-guida-completa-al-gestionale-erp-per-pmi/); [MyDC – Arca Evolution hosting](https://www.mydc.it/arca-evolution)
- **TeamSystem.** POLYEDRO, piattaforma web nativa del 2013. TS Enterprise in cloud o on-premise — [PMI.it](https://www.pmi.it/tecnologia/prodotti-e-servizi-ict/news/87218/innovazioni-teamsystem-per-pmi-professionisti-smau.html); [TeamSystem Enterprise](https://www.teamsystem.com/aziende/enterprise/)
- **SQL Server 2025.** Solo x64 e Windows 10+. Express e Standard supportati su Windows 11 — [Microsoft Learn](https://learn.microsoft.com/it-it/sql/sql-server/install/hardware-and-software-requirements-for-installing-sql-server-2025?view=sql-server-ver17)

### Inferences
**Pattern di prodotto da copiare (sintesi per il prodotto "Easyfatt-like" limitato a fatture attive, passive e prima nota):**
1. **Partita doppia vera** con causali configurabili, non un semplice "libro cassa". Gli incumbent sono tutti in partita doppia. Una vista "cassa/banca" semplificata può esistere come report.
2. **Causale = template di registrazione**:
   - registro IVA e sezionale;
   - contropartite di default;
   - gestione partite/scadenze;
   - obbligo analitica/commessa;
   - doppio protocollo con causale collegata per reverse charge e intra-UE.
3. **Contabilizzazione automatica dei documenti** (fatture attive e passive, note di credito, distinte, insoluti), con collegamento bidirezionale documento ↔ registrazione e blocco della modifica manuale delle registrazioni generate.
4. **Data registrazione ≠ data competenza IVA**, e protocollo IVA per registro/sezionale/anno.
5. **Registri IVA, liquidazione periodica, export LIPE e F24** come output standard. In alternativa, export completo per il commercialista.
6. **Reverse charge in un passaggio**: una registrazione genera la doppia annotazione e, se richiesto, il TD16-19 collegato e non ricontabilizzato.
7. **Cruscotto fatture passive** con stati, anteprima modificabile, import sintetico o per riga, commessa per riga, dedup, XML allegato.
8. **Scadenzario da condizioni di pagamento**, saldaconto rapido, distinte RiBa CBI e SEPA (CUC), insoluti.
9. **Riconciliazione bancaria**: import CBI RH e CAMT.053, aggancio via IBAN, tabella causali CBI, matching automatico più manuale, generazione delle registrazioni d'incasso e pagamento.
10. **Commessa/cantiere come dimensione analitica trasversale**, opzionale per riga, sul modello Mexal: piano dei conti analitico separato e commessa opzionale.
11. **Export per il commercialista** con mappatura del piano dei conti.
12. **Export Excel/CSV ovunque**: risponde a una critica esplicita degli utenti Mexal.

**Architettura per 10-30 utenti su rete Windows:**
- Server unico (Windows Server già presente) con DB relazionale vero, transazionale, con backup e point-in-time (PostgreSQL oppure SQL Server Express/Standard). Mai DB su share di rete (cfr. divieto NAS di Mexal).
- Client browser in LAN e via VPN, invece di RDP. È lo stesso percorso degli incumbent (AHR Web, Infinity, iDesk/WebDesk).
- Utenti con ruoli (amministrazione, ufficio tecnico/commesse, sola lettura) e audit log delle registrazioni.
- La possibilità di hosting cloud va tenuta come opzione futura, non come requisito.

### Gaps
- Non ho dati verificati su concorrenza e locking, numero massimo di utenti per licenza o prestazioni degli incumbent.
- Non ho dati sull'uso di RDP/Terminal Server come modalità consigliata dai vendor per l'accesso remoto: non ricercato.
- Non ho verificato se esistano verticali per impiantisti elettrici/FV sugli ERP citati. Arca Evolution cita un verticale "manutentori" — [Wolters Kluwer](https://www.wolterskluwer.com/it-it/expert-insights/arca-evolution-sofware-per-pmi).
