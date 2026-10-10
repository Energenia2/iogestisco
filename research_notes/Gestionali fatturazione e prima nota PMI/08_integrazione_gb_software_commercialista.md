# Integrazione del gestionale custom di Energenia con GB Software (GBsoftware S.p.A.) del commercialista

> **Nota metodologica (onestà sulle fonti).** Il 10/10/2026 il proxy di rete ha **bloccato il fetch diretto** di tutti i domini rilevanti: guidegbsoftware.it, gbsoftware.it, softwaregb.it, softwareintegrato.it, softwarecontabile.com, fatturegb.it, fiscoetasse.com e help.danea.it (errore 403 CONNECT o ENOTFOUND). **Ogni dato qui sotto viene dagli snippet dei motori di ricerca** sulle pagine citate, non dalla lettura integrale delle pagine. Le date delle pagine GB sono spesso incerte: le segnalo quando note o stimate. "Inferenza" indica un mio ragionamento, non una fonte.
>
> I domini GB sono: **softwaregb.it** (sito commerciale attuale), **guidegbsoftware.it** (guida online), softwareintegrato.it e softwarecontabile.com (siti di prodotto), gbsoftware.it (vecchi PDF di manuale in /pdfcreati/).

## 1. Linea prodotti GB (2026) e modulo che usa il commercialista

### Takeaway
Il commercialista usa quasi certamente la suite per studi **INTEGRATO GB**, con il modulo **Contabilità GB**. L'import automatico dei dati del cliente passa da tre moduli, spesso venduti come "Plus":
- **Import Fatture e Corrispettivi**;
- **Riconcilia GB Studio** (import estratto conto) e **Riconcilia GB PRO**;
- **Console Fatturazione**, più **GB inWeb** lato cliente.

Non esistono prodotti chiamati "GB Hub", "GB Studio" o "GB Azienda" con questi nomi: non ho trovato alcuna fonte che li citi.

### Cited Findings
- **Suite per studi.** INTEGRATO GB è la suite per commercialisti. Nel 2026 GB la promuove con funzioni di IA ("Prova gratis la potenza dell'IA nel software INTEGRATO GB") — [softwaregb.it INTEGRATO GB](https://www.softwaregb.it/software-integrato-commercialisti/); [landing IA 2026](https://www.softwaregb.it/landing-integrato-software-commercialisti-ia-2026-l-int-29/)
- **Contabilità GB per studi.** La pagina dichiara che "fatture, corrispettivi, saldi, cespiti ed estratti conto possono essere importati da qualsiasi software tramite tracciati automatizzati": fatture e corrispettivi in **XML**; saldi, anagrafiche ed estratti conto in **TXT/CSV/Excel** — [softwaregb.it Contabilità Commercialisti](https://www.softwaregb.it/software-contabilita-commercialisti/)
- **Contabilità GB per aziende.** Versioni ENTRY, BASE e PRO **da 329, 349 e 499 €/anno + IVA**. PRO ("il più venduto") include Corrispettivi, Magazzino e Scadenzario. Promette "Importazione automatica in Prima Nota di fatture elettroniche, corrispettivi ed estratti conto" — [softwaregb.it Contabilità per Aziende](https://www.softwaregb.it/software-contabilita-aziende/)
- **Gestione Società GB per Aziende.** Versioni ENTRY, BASE e PRO a **80, 104 e 116 €/mese**, con Riconcilia GB PRO incluso e "Import Fatture e Corrispettivi" citato. Non è chiaro se i prezzi siano IVA esclusa — [softwaregb.it Gestione Società](https://www.softwaregb.it/software-gestione-societa-aziende/)
- **Moduli per studi:**
  - "Import Fatture e Corrispettivi": importa in automatico dai **Servizi Massivi AdE** e dai file presenti in **Fatture e Corrispettivi** — [softwaregb.it Import Fatture Corrispettivi Studi](https://www.softwaregb.it/software-contabilita-commercialisti/software-import-fatture-corrispettivi-studi/);
  - "Servizi Massivi Agenzia delle Entrate": richieste massive di fatture, corrispettivi e bollo, con elaborazione da poche ore a qualche giorno; i file scaricati si importano poi in Contabilità GB — [softwaregb.it Servizi Massivi](https://www.softwaregb.it/software-contabilita-commercialisti/software-servizi-massivi-agenzia-entrate-studi/).
- **Riconcilia GB:**
  - **Riconcilia GB Studio** (import estratto conto) **da 110 €/anno + IVA** — [softwaregb.it Riconcilia GB Studio](https://www.softwaregb.it/software-contabilita-commercialisti/software-import-estratto-conto-studi/);
  - **Riconcilia GB PRO**: **50 €/anno + IVA** per chi ha già Riconcilia GB Studio, **150 €/anno + IVA** per gli altri — [softwaregb.it Riconcilia GB PRO](https://www.softwaregb.it/software-contabilita-commercialisti/riconcilia-gb-pro/);
  - "**GB Bank Studio**" sembra il nome precedente dello stesso import estratto conto — [softwareintegrato.it caso pratico GB Bank Studio](https://www.softwareintegrato.it/caso-pratico-importazione-estratto-conto-con-gb-bank-studio/); [softwarecontabile.com GB Bank Studio](https://www.softwarecontabile.com/gb-bank-studio-importazione-estratto-conto/).
- **Fatturazione elettronica:**
  - "Console Fatturazione" per studi — [softwaregb.it Console Fatturazione](https://www.softwaregb.it/software-fatturazione-elettronica-commercialisti/console-fatturazione/);
  - "Console GB inWeb" per aziende — [softwaregb.it Console GB inWeb](https://www.softwaregb.it/software-fatturazione-elettronica-aziende/console/);
  - **GB inWeb**, ambiente web del cliente: "fatturazione gratis fino a 25 fatture/anno, da 75 €/anno" oltre — [softwaregb.it GB inWeb](https://www.softwaregb.it/software-gb-in-web-studi/);
  - Conservazione e Documentale — [Conservazione](https://www.softwaregb.it/software-fatturazione-elettronica-commercialisti/conservazione/); [Documentale](https://www.softwaregb.it/software-fatturazione-elettronica-commercialisti/documentale/).
- **"Fatture GB"** (scheda rivenditore, **datata circa 2019**) aveva versioni WEB Entry, Base, Pro e Full con un'app "Importazione Fatture Elettroniche XML" che accetta XML prodotti da altri gestionali, per la registrazione automatica in Contabilità — [fiscoetasse.com Fatture GB WEB Full](https://www.fiscoetasse.com/BusinessCenter/scheda/38318-software-fatture-gb-versione-web-full.html)

### Inferences
- Lato studio, gli import utili a Energenia stanno tutti in **Contabilità GB > Prima nota**: "Importa fattura elettronica" e "Importa registrazioni" (Danea Easyfatt / File Xml GB / Estratto conto). Alcuni sono moduli **a pagamento**. Bisogna quindi chiedere al commercialista quali ha attivi.
- I prezzi aziende (329–499 €/anno) mostrano che GB vende anche un gestionale contabile per le imprese. Per Energenia è un'alternativa al custom solo per la parte contabile, non per fatturazione e commesse.

### Gaps
- Nessuna fonte su un'**API pubblica** (REST o webservice) di GB per ricevere dati da software terzi.
- I listini sono incoerenti tra le pagine, e la data di aggiornamento non è verificabile senza fetch.
- Non verificato se "Import Fatture e Corrispettivi" sia incluso in INTEGRATO GB o venduto a parte allo studio.

## 2. Import delle fatture elettroniche XML (attive e passive) e contabilizzazione automatica

### Takeaway
**Sì.** GB importa file **FatturaPA XML**, sia di vendita sia di acquisto, anche se **prodotti da altri gestionali**, e prepara la prima nota in automatico. Le fonti dei file sono tre:
- **file caricati manualmente**, anche a lotti di 500 dalla Console;
- **download dal portale Fatture e Corrispettivi** con delega all'intermediario ("Verifica fatture");
- **Servizi Massivi AdE**.

Ci sono controlli anti-duplicato. Le regole di attribuzione si basano su:
- **sezionali/numerazione**, per la causale contabile;
- **causali IVA e conti predefiniti per cliente/fornitore**.

Non ho trovato conferma di un "apprendimento" automatico della contropartita.

### Cited Findings
- **Percorso e ambito.** Il percorso è Contabilità > Prima nota > pulsante **"Importa fattura elettronica"**. Si importano una o più FE XML "indipendentemente che siano fatture di acquisto o di vendita", anche "xml elaborati con altri gestionali" — [guidegbsoftware Importa fatture elettroniche](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/)
- **Attribuzione dei dati.** Il software attribuisce causale, IVA e conti in base a tre elementi: il contenuto dell'XML, le **impostazioni di registrazione** e le **causali IVA e conti indicati dall'utente nel cliente/fornitore**. Le impostazioni per documenti **emessi e ricevuti sono separate** — [guidegbsoftware Importa fatture elettroniche](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/)
- **Causale contabile e causale IVA:**
  - la causale contabile è attribuita in automatico **solo se nelle impostazioni sono indicati i sezionali**, in base alla numerazione dei documenti (Documenti emessi / Registro IVA / Sezionali);
  - per ogni cliente o fornitore si possono indicare **causali IVA predefinite**: il software imposta allora causale IVA e totale documento IVA inclusa;
  - se la numerazione automatica delle anagrafiche è disattivata, i dati cliente/fornitore dell'XML vengono riportati nell'anagrafica GB.

  Fonte: [guidegbsoftware Importa fatture elettroniche](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/)
- **Prima nota predisposta.** "Utilizzando le impostazioni di registrazione e i causali e conti predefiniti di clienti e fornitori, la prima nota è automaticamente predisposta". Il file "viene importato solo se effettivamente idoneo all'elaborazione" — [softwaregb.it Import Fatture Corrispettivi Studi](https://www.softwaregb.it/software-contabilita-commercialisti/software-import-fatture-corrispettivi-studi/)
- **Anti-duplicato e tracciabilità.** Ci sono controlli "al fine di impedire l'importazione di uno stesso file più di una volta". In prima nota la colonna **"Provenienza"** marca le registrazioni importate come **"import FE"** — [guidegbsoftware Importa fatture elettroniche](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/); [guidegbsoftware Prima Nota](https://guidegbsoftware.it/contabilita/prima-nota/7-2-0-la-gestione-della-prima-nota/)
- **Incassi e pagamenti contestuali.** Una sezione **"Incassi/Pagamenti"** decide se registrare anche l'incasso o il pagamento, tramite banca o cassa e con il relativo conto. Per le vendite "propone la registrazione dell'incasso indicato dal cliente nell'**area web** o in **console fatturazione**". Nella Console, la maschera Incassi/Pagamenti alimenta l'utility "ImportaFattureElettroniche" — [guidegbsoftware Importa fatture elettroniche](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/); [guidegbsoftware Console Fatturazione](https://guidegbsoftware.it/console/console-fatturazione/)
- **Caso pratico (2019, datato):**
  - al primo accesso si sceglie il **criterio della data di registrazione**;
  - la procedura divide i file tra emessi e ricevuti e poi **per mese**;
  - si registra dal pulsante in colonna **"Registra doc."**;
  - un file **non si importa** se l'anno del documento è diverso dall'anno selezionato, o se manca un dato obbligatorio (es. CF del cessionario).

  Fonte: [softwaregb.it caso pratico FE prodotte con altri software](https://www.softwaregb.it/caso-pratico-registrazione-fatture-elettroniche-prodotte-con-altri-software-archivio/)
- **Console Fatturazione per studi.** "**Importa Storico Fatture**" accetta documenti emessi e ricevuti in altri software, **fino a 500 file alla volta**, anche dell'anno precedente. "**Registra fatture multiple**" registra tutto in prima nota in un colpo — [softwaregb.it Console Fatturazione](https://www.softwaregb.it/software-fatturazione-elettronica-commercialisti/console-fatturazione/)
- **Download dal cassetto fiscale.** Se l'intermediario abbinato alla ditta ha la **delega** alla consultazione e acquisizione delle FE, GB confronta i file presenti con quelli dell'AdE ("Verifica fatture" / "Verifica file" in Prima nota > Importazione fatture elettroniche) e **scarica quelli mancanti**, pronti per la registrazione (pagina stimata a circa un anno fa) — [softwaregb.it Download massivo](https://www.softwaregb.it/download-massivo-fatture-elettroniche-da-fatture-e-corrispettivi-n-2/)
- **Limite per elaborazione.** Una pagina "Dal 20 marzo…" indica **100 file per elaborazione**. L'anno non è verificato e il dato potrebbe essere superato — [softwaregb.it novità 20 marzo](https://www.softwaregb.it/dal-20-marzo-novita-su-consultazione-fatture-e-registrazione-dellindirizzo-telematico-n-2/)
- **Reverse charge.** GB ha una pagina dedicata all'import di **fatture di acquisto in reverse charge**. Il contenuto non è stato letto — [softwaregb.it Importazione FE acquisto reverse charge](https://www.softwaregb.it/importazione-fatture-elettroniche-acquisto-in-reverse-charge-n-2/)
- **Invio tramite Console.** La Console può ricevere XML **prodotti esternamente** per controllo, firma e **invio allo SdI**, poi scaricare gli esiti e registrare in automatico in contabilità (fonte 2019) — [softwaregb.it Console: invio file prodotti esternamente](https://www.softwaregb.it/console-fatturazione-invio-file-prodotti-esternamente-archivio/); [caso pratico](https://www.softwaregb.it/caso-pratico-registrazione-fatture-elettroniche-prodotte-con-altri-software-archivio/)
- **Corrispettivi.** Esiste anche l'import XML dei corrispettivi telematici. Per Energenia è poco rilevante — [guidegbsoftware Importa corrispettivi](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-corrispettivi/)

### Inferences
- **Energenia non deve "spedire" le FE perché il commercialista le registri.** Con la delega al cassetto fiscale, lo studio scarica attive e passive direttamente dall'AdE. L'XML è quindi già il canale standard, e il gestionale custom deve solo produrre **XML FatturaPA corretti e ricchi**. Lo ZIP di XML resta utile come canale di riserva o di storico (Console, 500 file per lotto).
- **La qualità dell'XML attivo determina quanto lavoro manuale resta allo studio:**
  - **numerazione/sezionali stabili** e concordati, perché la causale automatica dipende dai sezionali;
  - **P.IVA/CF completi**;
  - blocco **DatiPagamento** con ModalitaPagamento (es. MP05), IBAN e DataScadenzaPagamento: utile allo scadenzario e alle partite;
  - **Natura** corrette per reverse charge (N6.x) e split payment.
- **La parte "intelligente" sta in GB, non nell'XML.** È la configurazione per fornitore (causale IVA e conto predefiniti) a ridurre il lavoro sulle passive. Il gestionale custom non può influire sulla contropartita GB tramite l'XML ricevuto dal fornitore.

### Gaps
- **.p7m**: nessuno snippet conferma che l'import FE di GB legga direttamente i file firmati CAdES. È probabile, ma **non verificato**.
- **Apprendimento della contropartita**: non verificato se GB memorizzi in automatico l'ultima contropartita usata per fornitore. Le fonti parlano solo di **valori predefiniti in anagrafica** impostati dall'utente.
- Non verificata la gestione delle **righe multi-aliquota o multi-conto** (ripartizione per riga o per aliquota) né la mappatura delle **Natura N1–N7** sulle causali IVA GB.
- Contenuto della pagina reverse charge non letto. È rilevante per un installatore di impianti (art. 17 c.6 DPR 633/72).

## 3. Import di prima nota e movimenti da gestionali esterni: tracciati

### Takeaway
GB ha un **tracciato proprietario XML: "File Xml GB"**. Si trova in Prima Nota > Importa registrazioni e importa:
- **anagrafiche clienti/fornitori**;
- **prime note di fatture di vendita, acquisto e non IVA**;
- **relativi pagamenti**.

Le specifiche (istruzioni, linee guida, XML di esempio) sono in uno **.zip dentro la procedura**: **non sono pubbliche online**. È di gran lunga il formato più adatto al gestionale custom.

Per TeamSystem ho trovato import di anagrafiche ditte, cespiti, fabbricati e saldi, ma **nessuna prova di import della prima nota da TRAF2000 / GeCom**.

### Cited Findings
- **File Xml GB.** Permette di importare da file XML "oltre alle anagrafiche clienti/fornitori, le prime note di fatture di vendita/acquisto/non iva e relativi pagamenti (se presenti)":
  - percorso: Prima Nota > **Importa Registrazioni** > "File Xml GB";
  - "all'interno della procedura è presente un file **.zip** con al suo interno **istruzioni, linee guida ed un esempio in formato xml**";
  - dopo i controlli formali, le anagrafiche vengono confrontate con quelle GB: se esistono sono **abbinate in automatico**, altrimenti l'utente indica un nuovo codice;
  - occorre "**raccordare le aliquote IVA**" del file con quelle GB;
  - flusso: import file e anagrafiche → abbinamento dati → registrazione prime note.

  Data della nota di rilascio **incerta** (lo strumento di ricerca la indica a circa 10 mesi fa, ma l'URL "-archivio" fa pensare a una nota più vecchia) — [softwaregb.it Importazione Prima Nota da file XML](https://www.softwaregb.it/importazione-nota-file-xml-rilascio-utility-archivio/); [softwareintegrato.it stessa nota](https://www.softwareintegrato.it/importazione-nota-file-xml-rilascio-utility/)
- **Tracciati automatizzati.** "Fatture, corrispettivi, saldi, cespiti ed estratti conto possono essere importati da qualsiasi software tramite tracciati automatizzati". La pagina non riporta i campi — [softwaregb.it Contabilità Commercialisti](https://www.softwaregb.it/software-contabilita-commercialisti/)
- **Importa registrazioni.** Il pulsante "Importa registrazioni" (sezione Utility della prima nota) è il punto d'ingresso degli import da altri software. L'opzione "**Escludi prime note già importate**" è attiva di default — [guidegbsoftware Importazione Danea Easyfatt](https://guidegbsoftware.it/contabilita/prima-nota/importazione-danea-easyfatt/)
- **Export/Import Dati Prima Nota.** Esiste una funzione con re-import tramite "**Recupera Dati Import**": i record già presenti con date di registrazione diverse vanno risolti dall'utente — [guidegbsoftware Export-Import Dati Prima Nota](https://guidegbsoftware.it/non-abbinate/export-import-dati-prima-nota/)
- **TeamSystem:**
  - import di anagrafiche ditte, anagrafiche clienti/fornitori/percipienti, schede terreni/fabbricati, saldi e testi di bilancio (XBRL/Excel/TXT/CSV) e archivi paghe — [softwareintegrato.it Passaggio da TeamSystem](https://www.softwareintegrato.it/importazioni-altri-software/passaggio-software-teamsystem/);
  - guide su file .TXT generati da TeamSystem — [anagrafiche ditte Multi](https://guidegbsoftware.it/funzioni-comuni/importazioni/guida-importazione-anagrafiche-ditte-da-file-txt-generato-dal-software-teamsystem-multi/); [cespiti](https://guidegbsoftware.it/funzioni-comuni/importazioni/guida-importazione-cespiti-da-file-txt-generato-dal-software-teamsystem/); [fabbricati](https://guidegbsoftware.it/funzioni-comuni/importazioni/guida-importazione-fabbricati-da-file-txt-generato-dal-software-teamsystem/); [anagrafiche e dati ditte](https://guidegbsoftware.it/funzioni-comuni/importazioni/guida-importazione-anagrafiche-e-dati-delle-ditte/).
- **Archivi di altri gestionali per studi.** GB dichiara di importarli da Zucchetti, TeamSystem, Sistemi Data, Ranocchi, Blustring, Passepartout, Datev Koinos, Osra, Ipsoa e Buffetti. Contesto: migrazione dello studio, non flusso periodico del cliente — [softwareintegrato.it FAQ](https://www.softwareintegrato.it/domande-frequenti-software-commercialisti/); [Passaggio da TeamSystem](https://www.softwareintegrato.it/importazioni-altri-software/passaggio-software-teamsystem/)
- **Prima nota manuale.** I vecchi manuali PDF descrivono due modalità: inserimento manuale o "**registrazioni tipo**" (aziende, professionisti, minimi) — [gbsoftware.it manuale PDF](https://www.gbsoftware.it/pdfcreati\pdf6610.pdf)

### Inferences
- **File Xml GB è il formato ideale per il gestionale custom.** Copre esattamente fatture attive, passive, movimenti non IVA e pagamenti. Le mappature (aliquote, anagrafiche) **restano memorizzate** dopo il primo import. Il commercialista ha la specifica nello zip della procedura: **va chiesta a lui**, o al supporto GB tramite lui.
- **Gli import TeamSystem documentati servono alla migrazione dello studio da TS a GB.** Non sono un canale cliente → studio. Produrre un TRAF2000 o un tracciato GeCom "sperando" che GB lo legga è **sconsigliato** finché lo studio non lo conferma.
- **L'export nativo di Danea "al commercialista" non aiuta.** Produce GeCom Multi / Lynfa (TeamSystem) o PDF (vedi [01_easyfatt.md](./01_easyfatt.md); [help.danea.it](https://help.danea.it/easyfatt/Esportare_dati_vs_Commercialisti.htm)), e GB non risulta importarlo. Per questo GB ha scritto un **lettore diretto del file .eft** (§6).

### Gaps
- **Schema XSD e campi del File Xml GB non reperibili online.** Restano non verificati: nomi dei tag, codifica di conti e causali (codici GB o liberi), gestione partite e scadenze, centri di costo, multi-aliquota, ritenute, reverse charge.
- Non trovato alcun import di prima nota da **CSV/Excel generico** (diverso dall'estratto conto) né da **TRAF2000**.
- Non chiaro se "Export-Import Dati Prima Nota" sia solo GB → GB (es. tra studio e installazione GB del cliente) o accetti file esterni. È probabile solo GB → GB, ma non verificato.

## 4. Import dei movimenti bancari e abbinamento di incassi e pagamenti

### Takeaway
**Riconcilia GB** (ex GB Bank Studio) importa estratti conto **.xls, .xlsx, .csv e .txt** con **modelli per banca** (mappatura colonne configurabile) e **regole** per descrizione o causale bancaria. Le regole associano causale contabile e contropartita, poi si registra in prima nota.

Non ho trovato prove di supporto **CBI/CAMT** nativo. Non è verificato neanche un **abbinamento automatico alle partite aperte** (chiusura fatture per importo o riferimento).

### Cited Findings
- **Importa estratto conto (guida).** Importa file "prodotti dalle banche/poste/istituti di credito in formato **.xls, .xlsx e .csv**", con pulsante "**Registra in prima nota**" — [guidegbsoftware Importa estratto conto - Riconcilia GB](https://guidegbsoftware.it/contabilita/prima-nota/importazione-estratto-conto/)
- **Riconcilia GB Studio (pagina commerciale):**
  - formati **Excel, CSV, TXT**;
  - **modelli personalizzati per ciascun istituto bancario**;
  - regole costruite da **testi della descrizione** o **causali contabili della banca**, riutilizzabili negli import successivi;
  - "Associa **causale contabile e contropartita** al movimento di conto corrente per una predisposizione automatica della prima nota";
  - modulo "Plus" da 110 €/anno + IVA.

  Fonte: [softwaregb.it Riconcilia GB Studio](https://www.softwaregb.it/software-contabilita-commercialisti/software-import-estratto-conto-studi/)
- **Procedura.** Contabilità > Prima nota > "Importa registrazioni" > "Estratto Conto". Passi:
  1. selezione del file;
  2. creazione o scelta del modello banca;
  3. definizione delle intestazioni di colonna;
  4. creazione delle regole;
  5. predisposizione delle prime note;
  6. registrazione.

  Fonte: [softwaregb.it Importazione prima nota tramite estratto conto](https://www.softwaregb.it/importazione-nota-tramite-estratto-conto-ora-possibile-archivio/); [softwarecontabile.com Importazione estratto conto](https://www.softwarecontabile.com/software-contabilita-studi-aziende/importazione-estratto-conto-bancario/)
- **Riconcilia GB PRO.** È un modulo aggiuntivo (50/150 €/anno + IVA). Le sue funzioni in più non risultano dagli snippet — [softwaregb.it Riconcilia GB PRO](https://www.softwaregb.it/software-contabilita-commercialisti/riconcilia-gb-pro/)
- **Partite aperte e chiuse.** GB ha una gestione partite aperte/chiuse in prima nota (esistenza della funzione) — [guidegbsoftware Gestione partite](https://guidegbsoftware.it/contabilita/prima-nota/la-gestione-delle-partite-aperte-e-chiuse/)
- **CBI.** Gli snippet sulle pagine GB non citano mai CBI. Il riconoscimento delle causali CBI (es. "16") appare solo in documentazione di **un altro vendor** (B.Point), non di GB — [Tandem Servizi, Note Importatore Estratto Conto (B.Point, 2019)](https://www.tandemservizi.it/wp-content/uploads/2019/11/Note-Operative-Importatore-Estratto-Conto.pdf)

### Inferences
- **Il modello banca mappa colonne arbitrarie.** Un CSV stabile prodotto dal gestionale custom diventa quindi leggibile da GB con un modello creato **una volta**. Conviene inserire nella colonna descrizione **testo utile alle regole GB**, tipo "INC FT 2026/123 ROSSI SRL". Le regole lavorano su descrizione e causale banca, quindi più il testo è standard, più la contropartita si assegna da sola.
- **Due strade possibili:**
  - (a) lo studio importa **l'estratto conto originale della banca**: è la più neutra e auditabile, e il gestionale custom non c'entra;
  - (b) il gestionale custom esporta i movimenti **già riconciliati** con il riferimento fattura.

  La (b) ha senso solo se GB sa poi chiudere la partita della fattura giusta, e questo **non è verificato**. Altrimenti le stesse informazioni vanno nel **File Xml GB** come pagamenti collegati alle fatture.
- **Il gestionale custom dovrebbe comunque importare lui stesso CBI/CAMT/CSV** per la propria riconciliazione interna (vedi [06_integrazioni_sdi_banche_conservazione.md](./06_integrazioni_sdi_banche_conservazione.md)). Verso GB basta passare o il file originale della banca o un CSV normalizzato.

### Gaps
- Non verificati: chiusura automatica delle partite o scadenze cliente/fornitore da Riconcilia GB (match per importo, nome o numero fattura); supporto a CBI (RH/62-63-64), CAMT.053 o PSD2; funzioni di Riconcilia GB PRO.
- Non verificato se il modello banca gestisca colonne separate Dare/Avere o importi con segno.

## 5. Collaborazione studio–azienda in GB (per evitare la doppia digitazione)

### Takeaway
GB offre un ambiente web del cliente (**GB inWeb** / **Console GB inWeb**) che lo studio attiva con l'email del cliente. Il cliente conferma allo studio i documenti emessi e ricevuti, inserisce **incassi e pagamenti**, e lo studio registra con un clic ("Registra fatture multiple"). Se il cliente usa GB in locale, c'è anche un **Collegamento Studio/Cliente** con codice di abbinamento.

Per Energenia, che userà un gestionale proprio, questo canale implica una **seconda digitazione** (incassi in GB inWeb). È utile solo come ripiego.

### Cited Findings
- **GB inWeb.** È una piattaforma online di collaborazione studio–cliente: lo studio la attiva con l'email del cliente, che riceve le credenziali. Fatturazione "gratis fino a 25 fatture/anno, da 75 €/anno" — [softwaregb.it GB inWeb](https://www.softwaregb.it/software-gb-in-web-studi/); [softwaregb.it Condivisione e Collaborazione Studio-Cliente](https://www.softwaregb.it/condivisione-collaborazione-studio-cliente/)
- **Console GB inWeb (aziende).** Il cliente **conferma i documenti emessi e ricevuti** allo studio collegato. Lo studio li riceve raggruppati per ditta e data e li registra in modo semi-automatico, anche in blocco con "Registra fatture multiple" — [softwaregb.it Console GB inWeb](https://www.softwaregb.it/software-fatturazione-elettronica-aziende/console/); [softwaregb.it GB inWeb panoramica](https://www.softwaregb.it/gb-inweb-panoramica-della-gestione-n-2/); [softwaregb.it Console Fatturazione](https://www.softwaregb.it/software-fatturazione-elettronica-commercialisti/console-fatturazione/)
- **Incassi in Console.** In fase di import FE, GB "propone la registrazione dell'incasso indicato dal cliente nell'area web o in console fatturazione" — [guidegbsoftware Importa fatture elettroniche](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/)
- **Clienti senza obbligo FE.** Possono creare l'XML senza inviarlo allo SdI; lo studio lo importa dalla Console — [softwaregb.it FE per commercialisti](https://www.softwaregb.it/software-fatturazione-elettronica-commercialisti/)
- **Collegamento Studio/Cliente:**
  - sincronizzazione delle anagrafiche clienti/fornitori da Multiditta ("Sincr.Cli/For");
  - modifiche ed eliminazioni vanno fatte **in entrambe le utenze**;
  - in registrazione dalla Console, se il soggetto non esiste GB ne crea l'anagrafica, se è cambiato chiede se sovrascrivere.

  Fonte: [guidegbsoftware Collegamento Studio-Cliente](https://guidegbsoftware.it/multi-ditta/collegamento-studio-cliente/); [guidegbsoftware Collegamento Cliente-Studio](https://guidegbsoftware.it/non-abbinate/collegamento-cliente-studio/)
- **Cliente con GB in locale.** Il cliente genera un codice da Multiditta, lo studio lo inserisce, poi "Accetta e Conferma": le due Console sono collegate — [softwareintegrato.it Collegamento Studio/Cliente](https://www.softwareintegrato.it/collegamento-studio-cliente-rilascio-applicazione/); [softwaregb.it Fatturazione Web sincronizzazione anagrafiche](https://www.softwaregb.it/fatturazione-web-rilascio-e-sincronizzazione-anagrafiche-clienti-archivio/)

### Inferences
- La collaborazione nativa GB presuppone che il cliente **fatturi con GB** (inWeb o GB locale). Con un gestionale proprio, Energenia si "aggancia" all'ecosistema GB in due modi:
  - via cassetto fiscale (FE);
  - via file (File Xml GB / estratto conto).
- Un'opzione intermedia, da valutare solo se lo studio insiste: caricare gli XML prodotti dal custom nella Console GB inWeb del cliente, con incassi inseriti lì. **Rischio di doppia digitazione e di disallineamento**: sconsigliata come flusso principale.

### Gaps
- Nessuna fonte su import massivo di incassi/pagamenti da file nella Console GB inWeb lato cliente (sembra solo inserimento manuale).
- Nessuna API documentata di GB inWeb.

## 6. Connettore Danea Easyfatt → GB: cosa trasferisce e in che formato

### Takeaway
Non è un connettore Danea ma una **utility di GB** ("Importazione Danea Easyfatt"). **Legge direttamente il file archivio .eft** di Easyfatt, cioè il database Firebird, e importa:
- **anagrafiche clienti/fornitori**;
- **prime note di acquisto e vendita**;
- **pagamenti**.

Rivela che GB si aspetta dal cliente anagrafiche, documenti con castelletto IVA e movimenti di incasso/pagamento con conto banca: gli stessi contenuti del File Xml GB.

### Cited Findings
- **Contenuto e percorso.** "Tramite questa gestione è possibile importare da Danea Easyfatt, attraverso i file **.eft**, le anagrafiche clienti/fornitori, le prime note di acquisto/vendita e i pagamenti". Il percorso è: azienda > Contabilità > Prima nota > Utility "**Importa registrazioni**" > "Danea Easyfatt" > selezione del file .eft. Bisogna "controllare i dati riportati e compilare quelli mancanti" — [guidegbsoftware Importazione Danea Easyfatt](https://guidegbsoftware.it/contabilita/prima-nota/importazione-danea-easyfatt/) (pagina stimata **circa set. 2025** in base all'età di circa 387 giorni riportata dallo strumento di ricerca)
- **Dettagli operativi:**
  - percorso di default degli archivi: `C:\Users\<utente>\Documents\Danea Easyfatt\Archivi`;
  - i pagamenti sono abbinati a un conto banca, di default "**50100 Banca c/c ordinario**", modificabile con doppio clic;
  - il pulsante salva **abbinamenti e modifiche** anche senza importare;
  - "Escludi prime note già importate" è attivo di default.

  Fonte: [guidegbsoftware Importazione Danea Easyfatt](https://guidegbsoftware.it/contabilita/prima-nota/importazione-danea-easyfatt/)
- **Formato .eft.** .EFT è l'estensione degli archivi Easyfatt — [help.danea.it Importazione archivi EasyFatt 2006](https://help.danea.it/easyfatt/html/Importazione_degli_archivi_creati_con_EasyFatt_2006.htm). Il .eft è un DB **Firebird** e la "prima nota" di Easyfatt coincide con la tabella rate/scadenze (vedi [01_easyfatt.md](./01_easyfatt.md), [easyfatt-db-connector models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/))
- **Altri software per studi** hanno import analoghi da Easyfatt: Atlantis Evo (XML), H2 Software — [atlantisevo.com](https://www.atlantisevo.com/contabilizzazione-automatica-fatture-vendita-da-danea/); [h2software](https://h2softwaresrl.freshdesk.com/support/solutions/articles/5000617402-importazione-fatture-danea-easyfatt)

### Inferences
- **È probabile che oggi lo studio importi l'archivio .eft di Energenia.** Va verificato. Con il passaggio al gestionale custom **questo canale sparisce**. Va sostituito con il File Xml GB, che ha lo stesso perimetro: anagrafiche, prime note vendita/acquisto, pagamenti, più i movimenti non IVA.
- Riprodurre un .eft compatibile (DB Firebird con lo schema Danea) per "ingannare" l'import GB è **tecnicamente possibile ma fragile**: schema non documentato e soggetto a cambi di versione. Si sconsiglia, se non come ponte temporaneo durante la transizione. In quel periodo Easyfatt può restare in parallelo per lo storico.
- **Il default "50100 Banca c/c ordinario"** mostra che GB usa codici conto numerici del proprio piano dei conti. Nel File Xml GB servirà quindi una **tabella di raccordo** tra i conti/risorse del gestionale custom e i codici del piano dei conti dello studio.

### Gaps
- Non verificato **quali pagamenti** l'import .eft porti: solo rate saldate o anche scadenze aperte? Come tratta le note di credito, il reverse charge e i documenti non fiscali (DDT, preventivi)?
- Non trovata alcuna pagina Danea che parli di un "connettore GBsoftware". La relazione è unidirezionale: GB legge il file Danea.

## 7. Raccomandazione pratica: cosa esportare, con che frequenza, cosa chiedere al commercialista

### Takeaway
Si consiglia un'architettura "a strati", dal più automatico al più completo:
1. **FE XML via cassetto fiscale**: zero export, purché l'XML sia di qualità.
2. **Export mensile "File Xml GB"**: anagrafiche, fatture attive e passive con pagamenti, movimenti non IVA, generato dal gestionale custom una volta ottenuta la specifica dallo studio.
3. **Estratto conto originale della banca** (xls/csv) per Riconcilia GB, oppure un CSV normalizzato a layout fisso.

La frequenza va allineata alla liquidazione IVA, mensile o trimestrale secondo il regime di Energenia, con chiusura entro una data concordata.

### Cited Findings
- **XML FatturaPA:** GB importa XML di altri gestionali, attivi e passivi, e li scarica dal cassetto fiscale con delega — [guidegbsoftware Importa FE](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/); [softwaregb.it Download massivo](https://www.softwaregb.it/download-massivo-fatture-elettroniche-da-fatture-e-corrispettivi-n-2/)
- **Tracciato GB:** anagrafiche, prime note vendita/acquisto/non IVA e pagamenti, con specifica nello zip interno — [softwaregb.it File Xml GB](https://www.softwaregb.it/importazione-nota-file-xml-rilascio-utility-archivio/)
- **Banca:** xls/xlsx/csv/txt con modello per banca e regole — [guidegbsoftware Importa estratto conto](https://guidegbsoftware.it/contabilita/prima-nota/importazione-estratto-conto/); [softwaregb.it Riconcilia GB Studio](https://www.softwaregb.it/software-contabilita-commercialisti/software-import-estratto-conto-studi/)
- **Causale automatica:** dipende dai sezionali/numerazione configurati nello studio — [guidegbsoftware Importa FE](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/)

### Inferences (specifiche implementative per il gestionale custom)
- **A. Fatture elettroniche (obbligatorio, sempre):**
  - generare XML FatturaPA 1.2.x validi con:
    - **sezionali** concordati con lo studio, ad esempio un sezionale per fatture ordinarie, uno per reverse charge edile e uno per note di credito, se lo studio li distingue;
    - **DatiPagamento** completi (condizioni, modalità, scadenze, IBAN);
    - **Natura** IVA corrette (N6.x per reverse charge, N2/N3/N4 dove servono);
    - **riferimenti commessa** in `RiferimentoAmministrazione` o `AltriDatiGestionali`: non usati da GB, utili all'audit;
  - conservare per ogni FE il file SdI originale, nome file e IdSdI;
  - **per le passive** salvare sia il `.p7m` sia l'`.xml` estratto: il supporto .p7m in GB non è verificato;
  - funzione **"Export ZIP XML periodo"**, con attive e passive separate e nomi file originali, come canale di riserva per "Importa Storico Fatture" (fino a 500 per lotto) o per l'import FE da prima nota. Lato GB il duplicato è già bloccato.
- **B. File Xml GB (consigliato appena c'è la specifica):**
  - generatore che produce anagrafiche, fatture vendita/acquisto con castelletto IVA, **pagamenti/incassi legati alla fattura** e **movimenti non IVA**: F24, stipendi, commissioni bancarie, giroconti, rate di finanziamento;
  - **tabelle di raccordo** configurabili nel gestionale: aliquote/Natura → codici IVA GB; conti e risorse (banca, cassa) → codici del piano dei conti dello studio (es. 50100); categorie di spesa → conti di costo GB; causali;
  - **idempotenza**: ID univoci stabili per ogni registrazione, flag "esportato in data X", ri-export solo delle variazioni (concordando con lo studio come gestire le rettifiche).
  - **Attenzione**: se lo studio scarica già le FE dal cassetto fiscale **e** importa il File Xml GB con le stesse fatture, rischia il **doppio caricamento**. Va concordato **un solo canale per le fatture**. Esempio: FE da cassetto per la registrazione IVA, File Xml GB solo per pagamenti e non IVA, **se il tracciato lo permette** (da verificare).
- **C. Banca:**
  - default: lo studio importa l'**estratto conto originale** di ogni conto (xls/csv dall'home banking);
  - in alternativa il gestionale custom esporta un **CSV normalizzato a layout fisso** per conto e periodo, con colonne `data_operazione; data_valuta; importo (con segno); descrizione; causale_ABI/CBI; controparte; IBAN_controparte; rif_documento (n./data fattura); id_movimento`;
  - descrizione standardizzata (es. `INC FT 2026/123 ROSSI SRL`, `PAG FT 45/2026 FORNITORE X`) per sfruttare le **regole** di Riconcilia GB.
- **D. Frequenza:**
  - **mensile**, entro un giorno fisso (es. il 5 del mese successivo), o comunque allineata alla periodicità IVA di Energenia: da confermare con lo studio, non verificata qui;
  - ZIP XML ed estratto conto anche **trimestrale** se l'IVA è trimestrale;
  - **export di chiusura annuale**: scadenzario aperto al 31/12, saldi banca, ratei e risconti se gestiti.
- **E. Cose da evitare:** tracciati TeamSystem (TRAF2000/GeCom) o finti .eft Danea senza conferma esplicita dello studio. Nessuna fonte prova che GB li usi per i movimenti di un cliente esterno.

### Domande da fare al commercialista (per confermare il formato)
1. Quale prodotto e versione GB usate (INTEGRATO GB / Contabilità GB per studi, release attuale)? Quali moduli Plus sono attivi: "Import Fatture e Corrispettivi", "Servizi Massivi AdE", "Console Fatturazione", "Riconcilia GB Studio" e/o "PRO"?
2. Oggi come ricevete i dati di Energenia? Importate l'archivio **.eft di Danea** (Prima nota > Importa registrazioni > Danea Easyfatt)? Usate le FE dal cassetto fiscale, l'estratto conto o la digitazione manuale?
3. Avete la **delega** per consultare e acquisire le FE di Energenia? Scaricate già con "Verifica fatture" / download massivo? Con che frequenza?
4. Accettereste un file **"File Xml GB"** (Prima Nota > Importa registrazioni)? Potete inviarci lo **.zip con istruzioni, linee guida ed esempio XML** contenuto nella procedura, e dirci la versione?
5. In quel tracciato si possono importare **solo pagamenti e movimenti non IVA**, senza le fatture già acquisite dal cassetto? Oppure preferite che le fatture arrivino **solo** da lì? Come evitiamo i doppioni?
6. Per poter pre-mappare ci mandate il vostro **piano dei conti** per Energenia (codici conto banca, cassa, clienti, fornitori, costi e ricavi principali), i **codici IVA/causali IVA** e i **sezionali** che usate?
7. Come volete che numeriamo i **sezionali** (vendite ordinarie, reverse charge edile art. 17 c.6, note di credito, autofatture TD16–TD19) perché la causale si attribuisca in automatico?
8. Per le **fatture passive in reverse charge** (subappalti, materiali) e le integrazioni TD16, cosa vi serve da noi oltre all'XML?
9. Per le banche preferite l'**estratto conto originale** (quale formato: xls, csv o CBI) o un nostro CSV normalizzato? Usate già modelli e regole Riconcilia per i conti Energenia?
10. Riconcilia GB chiude in automatico le **partite aperte** delle fatture (match per importo o riferimento), o dobbiamo indicare noi il riferimento fattura per ogni incasso o pagamento?
11. Accettate **.p7m** o volete solo **.xml** in chiaro?
12. **Frequenza e scadenza** degli invii (mensile o trimestrale, entro il giorno X)? Canale: email/PEC, cartella condivisa o GB inWeb?
13. Avete interesse ad attivare **GB inWeb** per Energenia? Siamo consapevoli che duplicherebbe l'inserimento degli incassi.

### Gaps
- La raccomandazione B dipende **interamente** dalla specifica del File Xml GB, che non è pubblica. Senza lo zip dello studio non è possibile implementarla.
- Periodicità IVA di Energenia e prassi attuale dello studio sconosciute.
- Tutte le informazioni GB vengono da snippet di ricerca (fetch bloccato). Le pagine andrebbero rilette integralmente, o confermate dallo studio, prima di scrivere codice.
