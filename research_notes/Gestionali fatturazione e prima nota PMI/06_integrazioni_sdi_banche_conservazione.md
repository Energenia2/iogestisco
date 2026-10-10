# Integrazioni per un gestionale custom (Energenia Srl): SdI, fatture passive/cassetto fiscale, conservazione a norma, banche, firma. Stato a ottobre 2026

> **Nota metodologica (importante per chi scrive il report):** in questa sessione WebFetch non funzionava (errore DNS / egress bloccato dal proxy per fatturapa.gov.it, invoicetronic.com, enablebanking.com, gocardless.com, console.openapi.com). Dopo circa 35 query si è esaurito anche il budget di WebSearch. **Tutti i dati qui sotto vengono quindi da sintesi di WebSearch delle pagine citate, non dalla lettura integrale delle pagine.** I prezzi vanno riverificati sulle pagine indicate prima di una decisione d'acquisto. Le affermazioni che vengono solo dalla conoscenza pregressa del ricercatore stanno nelle sezioni "Inferences" o "Gaps", marcate *[da verificare]*.

## 1. Canali SdI per un software autoprodotto: canali diretti (PEC, SDICoop, SDIFTP) e API di intermediari

### Takeaway
Per una singola Srl con 500-3.000 fatture l'anno i canali diretti realistici sono due: **un intermediario via API REST a consumo** (Invoicetronic, Openapi, fattura-elettronica-api.it, A-Cube; costo indicativo 50-600 €/anno) oppure **il canale PEC diretto** (nessun accreditamento, costo SdI zero, automazione fragile via IMAP/SMTP). SDICoop e SDIFTP sono tecnicamente fattibili ma pensati per operatori ad alta maturità IT e alti volumi: richiedono certificati, endpoint SOAP esposti su Internet e test di interoperabilità, un onere sproporzionato per un'azienda sola. Fatture in Cloud e Aruba sono poco adatti come "trasporto" per un software custom: Fatture in Cloud non accetta XML esterni e ad Aruba le API servono il pacchetto Premium.

### Cited Findings

#### 1a. Canali diretti

**Canale PEC**
- Con la PEC la fattura è un allegato del messaggio, e il messaggio non può superare i **30 MB**. La PEC non richiede il "codice destinatario" che serve agli altri canali (web service, FTP). — [Il Sole 24 Ore NT+ Fisco](https://ntplusfisco.ilsole24ore.com/art/gestione-fattura-elettronica-piu-canali-AEeFY5nE)
- Il **primo invio** va all'indirizzo PEC generico pubblicato su fatturapa.gov.it. SdI risponde poi comunicando **l'indirizzo PEC da usare per gli invii successivi**. — [Il Sole 24 Ore NT+](https://ntplusfisco.ilsole24ore.com/art/gestione-fattura-elettronica-piu-canali-AEeFY5nE); [InformazioneFiscale](https://www.informazionefiscale.it/invio-fattura-elettronica-tramite-pec-come-funziona-istruzioni)
- L'indirizzo SdI per il primo invio PEC, **sdi01@pec.fatturapa.it**, è riportato da guide di settore. Lo stesso indirizzo è indicato come destinatario PEC per inviare la richiesta di accreditamento SDICoop. — [SoftwareSemplice, PEC e fatturazione](https://www.softwaresemplice.it/blog/pec-fatturazione-elettronica/1151); [Medium, Morchio, accreditamento SDICoop](https://massimomorchio.medium.com/fattura-elettronica-accreditamento-canale-sdicoop-ef6afb65cacb). *Fonte primaria fatturapa.gov.it non raggiungibile in questa sessione.*
- Le notifiche arrivano via PEC. Le fatture ricevute via PEC possono richiedere di estrarre l'XML da un file .p7m prima del parsing. — [SoftwareSemplice](https://www.softwaresemplice.it/blog/pec-fatturazione-elettronica/1151)
- Esiti SdI, validi per ogni canale:
  - **ricevuta di consegna**, con data e ora;
  - **ricevuta di scarto** entro 5 giorni, *sullo stesso canale* dell'invio; la fattura corretta va reinviata entro 5 giorni con lo stesso numero e la stessa data;
  - **mancata consegna** se il destinatario non è raggiungibile (ad esempio PEC piena), dopo vari tentativi.
  — [Agenzia Entrate, "Cosa fa il SdI quando riceve una fattura"](https://www.agenziaentrate.gov.it/portale/aree-tematiche/fatturazione-elettronica/guida-fatturazione-elettronica/come-predisporre-inviare-ricevere-fe/cosa-fa-sistema-interscambio-fe); [Fiscomania](https://fiscomania.com/ricevute-fattura-elettronica/)
- L'accreditamento serve **solo** per trasmettere via Web Service o SFTP, quindi **la PEC non richiede accreditamento**. — [fatturapa.gov.it, Sistema di Accreditamento](https://www.fatturapa.gov.it/it/SistemaAccreditamento/cose-il-sistema-di-accreditamento/)

**SDICoop (web service SOAP) e SDIFTP**
- Il sito ufficiale indica che l'accreditamento WS/SFTP è rivolto a operatori con **alto grado di maturità informatica e alto volume di file**. — [fatturapa.gov.it, Sistema di Accreditamento](https://www.fatturapa.gov.it/it/SistemaAccreditamento/cose-il-sistema-di-accreditamento/)
- Procedura:
  - modulo online con dati del richiedente, del titolare dell'accordo e di un referente tecnico, gli endpoint e i nomi di **due CSR (client e server) con chiavi RSA distinte**, per i certificati di test e di produzione;
  - il sistema restituisce `RichiestaAccreditamento.zip`, da **non modificare**, firmare con **firma qualificata CAdES-BES** e inviare via PEC a sdi01@pec.fatturapa.it;
  - dopo l'approvazione si scarica `KitDiTest.zip` e si espongono i web service SOAP di ricezione dai WSDL forniti.
  — [Medium, Morchio](https://massimomorchio.medium.com/fattura-elettronica-accreditamento-canale-sdicoop-ef6afb65cacb); [Forum Italia, Accreditamento SDICoop](https://forum.italia.it/t/accreditamento-sdicoop-tramite-web-services/3218); [fatturapa.gov.it, Sistema di Accreditamento](https://www.fatturapa.gov.it/it/SistemaAccreditamento/cose-il-sistema-di-accreditamento/)
- Certificati e test:
  - il client SdI di test (SistemaInterscambioFatturaPATest) è firmato dalla CA di test dell'AdE, il server di test (testservizi.fatturapa.it) dalla CA di produzione;
  - i problemi di installazione delle catene di certificati sono frequenti sul forum, a volte risolti convertendo i .cer in .pem;
  - l'ambiente di test resta disponibile anche dopo l'accreditamento, senza valore legale.
  — [Forum Italia, problemi certificati SdiCoop_Ricezione](https://forum.italia.it/t/accreditamento-sdicoop-ricezione-problemi-con-i-certificati/44710); [Forum Italia, installazione certificati](https://forum.italia.it/t/installazione-certificati-canale-sdicoop/3382); [fatturapa.gov.it, FAQ accreditamento](https://www.fatturapa.gov.it/it/faq/faq-accreditamento-canale/); [fatturapa.gov.it, Test WS/SFTP](https://www.fatturapa.gov.it/it/sistemainterscambio/sperimentazione/)
- L'utente esegue **in autonomia** i test di connessione e poi chiede il passaggio in produzione. — [AdE, PDF "Accreditare un canale"](https://www.agenziaentrate.gov.it/portale/documents/20143/289347/Accreditamento+e+richiesta+codici+destinatario_Accreditamento+e+richiesta+codici+destinatario_v1.0.pdf/8333539f-f864-ac00-3ab0-74ce8a47db69); specifiche: [AdE, Istruzioni SDICoop-Ricezione v3.0](https://www.agenziaentrate.gov.it/portale/documents/20143/288192/ST+Fatturazione+elettronica+Istruzioni+servizio+SDICoop+ricezione+30_SDICoop_ricezione_v3.0.pdf/4d22610d-b15b-16b1-545d-b438e24f280d)
- Esistono implementazioni open source di server SDICoop, per esempio `taocomp/php-sdicoop-server`. — [GitHub](https://github.com/taocomp/php-sdicoop-server/blob/master/README.org)

#### 1b. API di intermediari: tabella comparativa (dati verificati via ricerca)

| Provider | Modello e prezzo pubblico | Funzioni | Auth / sandbox / SDK | Note / fonti |
|---|---|---|---|---|
| **Invoicetronic** (invoicetronic.com) | A **transazione** (invio, ricezione *o* validazione), scaglioni: **€0,10** a 1.000; **€0,055** a 5.000; **€0,040** a 20.000; €0,025 a 50.000; €0,020 a 100.000. Gli scaglioni **non scadono** e si rinnovano quando serve. Firma .p7m **€0,020** ciascuna. | REST, invio e ricezione SdI, validazione pre-invio, **webhook, storico webhook, event log e stato gratuiti**, cifratura at rest | API key; **sandbox gratuita e isolata da SdI**; SDK (es. PHP su Packagist da luglio 2025), CLI | [Pricing](https://invoicetronic.com/en/pricing/). In produzione servono: API key live, crediti, **registrazione del codice destinatario 7HD37X0 nel Cassetto fiscale** e **attivazione della conservazione a norma** — [Prerequisites](https://invoicetronic.com/en/docs/prerequisites/); [php-sdk](https://github.com/invoicetronic/php-sdk); [DEV, download fatture SdI con C#](https://dev.to/nicolaiarocci/how-to-download-sdi-fatturapa-invoices-with-c-fo9) |
| **Openapi.it / openapi.com** (SDI API) | Pay-per-use, **nessun costo di attivazione o canone**. Le cifre pubbliche **non sono coerenti**: "da €0,015" (pagina prodotto), "da €0,025 + IVA" (console), ma in tabella **POST /invoices €0,07** e **POST /invoices_legal_storage €0,105**. Endpoint di lista/download/configurazione quasi gratuiti entro soglie giornaliere ("FREE 1440 requests/day"). | Invio, ricezione, conservazione 10 anni (eIDAS) come endpoint a pagamento separato | Console con documentazione | [Prodotto](https://openapi.com/products/italian-electronic-invoicing); [Console info](https://console.openapi.com/apis/sdi/info); [Console pricing](https://console.openapi.com/apis/sdi/pricing); [Doc](https://console.openapi.com/apis/sdi/documentation). Codice destinatario **JKKZDGR** secondo la [FAQ SDI](https://console.openapi.com/apis/sdi/faq) e **PIC7CPS** secondo la [FAQ API Invoice](https://console.openapi.com/apis/invoice/faq): sono due prodotti distinti, va verificato. Per ricevere bisogna registrare il codice in Fatture e Corrispettivi — [blog Openapi](https://openapi.com/blog/register-recipient-code-italian-revenue-agency) |
| **fattura-elettronica-api.it** | Abbonamenti mensili da **€10/mese per 50 fatture** a €850/mese per 50.000 (costo unitario da ~€0,20 a ~€0,017); ricariche da €20/100 a €2.000/100.000. **Le fatture ricevute contano** come crediti; gli XML scartati per errori formali non si pagano. | REST 2.0: `POST /fatture` (XML completo o JSON minimale, compila i dati di trasmissione), `GET /fatture` per ricezione e stato | — | [Piani e prezzi](https://www.fattura-elettronica-api.it/piani-e-prezzi/); [Documentazione](https://www.fattura-elettronica-api.it/documentazione/); [FAQ](https://www.fattura-elettronica-api.it/faq/) |
| **fatturaelettronica-api.it** (dominio diverso) | **€0,09** a fattura inviata o ricevuta, "tutto incluso", senza canone né attivazione | — | — | [Sito](https://www.fatturaelettronica-api.it/) |
| **A-Cube API** (acubeapi.com) | **Nessun listino pubblico** per l'API: abbonamento annuale quotato su prodotti, volume e numero di P.IVA. Listino pubblico solo per l'app Stripe: €19,90 / 29,90 / 39,90 al mese con overage €0,45 / 0,35 / 0,25 a documento; i limiti di documenti per piano non coincidono tra pagina prodotto e blog (100 contro 50/100/200; piano free 10 documenti/mese). | API modulari: SdI, **Peppol (Access Point certificato)**, scontrini, archiviazione, **open banking**, **download cassetto fiscale** | **Sandbox gratuita** | [e-invoice.app, scheda vendor](https://www.e-invoice.app/vendors/a-cube-api); [Prodotto IT e-invoicing](https://www.acubeapi.com/en/products/api-e-invoicing-italy); [App Stripe](https://acubeapi.com/en/products/app-stripe-e-invoicing); [Blog app Stripe](https://www.acubeapi.com/en/blog/app-per-stripe-e-invoicing-di-a-cube-guida-pratica-dall-installazione-ai-payment-link). Round da €4M guidato da P101 (2026) — [AziendaBanca](https://www.aziendabanca.it/notizie/fintech-insurtech/a-cube-round-4-milioni-p101). Vivid Business usa A-Cube e offre e-invoicing gratuito e illimitato nei suoi piani — [Vivid help](https://help-business.vivid.money/en/articles/15934314-how-do-i-set-up-e-invoicing-for-my-italian-business-account) |
| **Aruba Fatturazione Elettronica** | Servizio web **€29,90 + IVA/anno** (rinnovo; primo trimestre a €1). Le **API REST richiedono il pacchetto Premium** (canone annuo più quota per P.IVA; il piano base offre solo l'interfaccia web). Cifre riportate: circa **€900/anno** (300+600) in un thread del ~2019; **€600/anno + €300 di setup** in un thread WHMCS; secondo un articolo 2026 le API sono solo nella versione "enterprise", su richiesta. | REST: invio a SdI, ricerca fatture inviate e ricevute, comunicazioni; documentazione con changelog fino alla **v1.21.1 del 21/05/2025** | API demo riservate ai Partner (thread WHMCS); pacchetto .NET di comunità su NuGet | [Listino](https://www.aruba.it/listino-fatturazione-elettronica.aspx); [API docs](https://fatturazioneelettronica.aruba.it/apidoc/docs_EN.html); [FoxPro group](https://groups.google.com/g/foxpro-italia/c/wn7VMzNuEyc); [Forum Italia](https://forum.italia.it/t/qualcuno-che-usa-il-web-service-di-aruba/6283); [WHMCS](https://whmcs.community/topic/321149-integrazione-fatturazione-elettronica-di-aruba/); [CentroFiscale 2026](https://centrofiscale.com/aruba-fattura-elettronica-costi-2026/); [NuGet](https://www.nuget.org/packages/ArubaFatturazioneElettronica.NET) |
| **Fatture in Cloud (TeamSystem)** | API **abilitate automaticamente** per tutti gli utenti, ma l'invio a SdI è possibile **solo con piano a pagamento** (non in trial). Prezzi 2026 riportati: piano forfettari €48 il primo anno e €96 dal secondo (100 documenti); Premium €252/anno. | API v2: creazione documenti, verifica XML, invio SdI, motivi di scarto, parametro dry-run. **"You can't just send an XML to the SDI using our APIs"**: il documento va creato dentro FIC. | OAuth2 (Authorization Code, Device Code) o token manuale; limite **300 richieste ogni 5 minuti** (HTTP 429 con Retry-After) più limiti orari, mensili e per piano; SDK ufficiali (es. Java 2.1.8) | [E-invoice guide](https://developers.fattureincloud.it/docs/guides/e-invoice-management/); [Limits](https://developers.fattureincloud.it/docs/basics/limits-and-quotas/); [Auth](https://developers.fattureincloud.it/docs/authentication/); [Activation](https://developers.fattureincloud.it/docs/basics/activation/); [FAQ](https://developers.fattureincloud.it/docs/FAQs/); [Java SDK](https://github.com/fattureincloud/fattureincloud-java-sdk); [CentroFiscale](https://centrofiscale.com/alternative-fatture-in-cloud-2026/) |
| **InfoCert Legalinvoice** | Piani: **GO €24**, **START €50 (200 fatture)**, **BUSINESS €86 (400 fatture)**, pacchetti extra da 50 fatture a **€9,76**/anno. Per le grandi aziende integrazione via **API o FTP** con costi a volume. Una scheda di luglio 2026 dice "nessun costo per l'integrazione con i gestionali, si pagano le fatture consumate". | API/FTP, connettori ERP, caricamento massivo XML (piano PRO secondo un rivenditore) | — | [Legalinvoice enterprise](https://www.infocert.it/grandi-aziende/legalinvoice); [START](https://www.infocert.it/fatturazione/legalinvoice-start); [BUSINESS](https://www.infocert.it/fatturazione/legalinvoice-business); [GO](https://www.fatturazione.infocert.it/); [Scheda v2.2 luglio 2026 (visura.it)](https://www.visura.it/wp-content/uploads/2026/07/Fatturazione-Elettronica-Legalinvoice.pdf); [fatturazioneb2b.com PRO](https://www.fatturazioneb2b.com/fatturazione-b2b-pro.php) |
| **Altri intermediari SOAP "a scaglioni"** | In un forum si cita uno scaglione minimo di **1.000 fatture attive + 1.000 passive a €80/anno tutto compreso**. Il fornitore non è identificato nella sintesi. | — | — | [Forum Italia, alternative ad Aruba](https://forum.italia.it/t/alternative-ad-aruba-per-invio-fatture-tramite-webservice/8604?page=2) |

#### 1c. Ricezione: registrazione dell'indirizzo telematico (codice destinatario)
- La registrazione si fa nell'area riservata di **Fatture e Corrispettivi**: "Registrazione delle modalità di ricezione", indicando un codice destinatario o una PEC. — [Openapi blog](https://openapi.com/blog/register-recipient-code-italian-revenue-agency); [SoftwareSemplice](https://www.softwaresemplice.it/blog/registrazione-indirizzo-telematico-codice-destinatario/1118)
- **Effetto chiave:** SdI considera **sempre prevalente l'indirizzo registrato**, qualunque sia il CodiceDestinatario scritto dal fornitore nell'XML. Tutte le fatture intestate alla P.IVA vanno a quel canale. — [CDA Studio Legale Tributario](https://www.cdastudio.it/news/news-fiscalita/241-fattura-elettronica-e-codice-destinatario); [Arxivar](https://fatturazione-elettronica.arxivar.it/news-fatturazione-elettronica/28-codice-destinatario-facciamo-chiarezza)
- Senza registrazione SdI usa il CodiceDestinatario dell'XML; se il codice è inesistente la fattura viene scartata. Il codice "0000000" va usato solo con recapito PEC. — [Arxivar](https://fatturazione-elettronica.arxivar.it/news-fatturazione-elettronica/28-codice-destinatario-facciamo-chiarezza); [EasyFatturaElettronica](https://easyfatturaelettronica.it/blog/codice-destinatario-fattura-elettronica/)
- Anche con un canale registrato le fatture restano disponibili sul portale Fatture e Corrispettivi. — [Lucus Informa](https://www.lucusinforma.com/codicedestinatario/); [La posta del sindaco](https://www.lapostadelsindaco.it/servizi-pubblica-amministrazione/7611/risposte-a-domande-degli-utenti-riguardanti-la-fatturazione-elettronica-e-i-corrispettivi)
- Dall'8/12/2025 la "registrazione dell'indirizzo telematico" rientra tra i servizi delegabili con la **Delega Unica**. — [FiscoeTasse](https://www.fiscoetasse.com/new-rassegna-stampa/2660-delega-unica-agli-intermediari-nuove-modalita-dall8-dicembre-2025.html)

### Inferences
- **Stima di costo annuo del solo canale SdI** per 500 / 1.500 / 3.000 transazioni l'anno (attive + passive), calcolata sui listini sopra:

| Opzione | 500 | 1.500 | 3.000 | Ipotesi |
|---|---|---|---|---|
| PEC diretta | ~0 € di SdI + canone PEC | idem | idem | il canone PEC non è stato verificato in questa ricerca |
| Invoicetronic | €100 (pacchetto 1.000, dura ~2 anni) | €200 (2×1.000) oppure €275 (5.000 a €0,055, non scade) | €275 (5.000) | gli scaglioni sembrano crediti prepagati senza scadenza (["tiers have no expiration"](https://invoicetronic.com/en/pricing/)) |
| Openapi | €18-35 | €53-105 | €105-210 | €0,07 × solo le fatture attive (assunte metà del totale); la ricezione sembra quasi gratuita; +€0,035/fattura con legal storage |
| fatturaelettronica-api.it | €45 | €135 | €270 | €0,09 flat su invio e ricezione |
| fattura-elettronica-api.it | €120 (10 €/mese, fino a 600/anno) | ? | ? | i piani intermedi non sono noti |
| InfoCert Legalinvoice Business | ~€106 | ~€301 | ~€594 | €86 + €9,76 per 50 fatture extra; va verificato se l'API è inclusa in questo piano |
| Aruba Premium (API) | €600-900+ | idem | idem | dati 2019-2023, non aggiornati |

- Per 500-3.000 fatture l'anno i costi dei provider pay-per-use (Invoicetronic, Openapi, fatturaelettronica-api.it) sono **trascurabili** rispetto al costo di sviluppo e manutenzione di un canale diretto.
- **SDICoop non conviene** a una singola Srl. Richiede:
  - un server pubblico in HTTPS con mutual TLS e certificati AdE;
  - firma qualificata per la richiesta;
  - test di interoperabilità e gestione del rinnovo dei certificati.

  Il vantaggio (nessun terzo tra azienda e SdI) si ottiene anche con la PEC, senza accreditamento.
- **Rischi della PEC in automazione:**
  - parsing di buste PEC (daticert.xml, postacert.eml) e di allegati .p7m;
  - l'indirizzo SdI di risposta cambia dopo il primo invio;
  - mailbox piena = mancata consegna;
  - il polling IMAP non dà la reattività di un webhook.

  Va bene se l'IMAP/SMTP del provider PEC è affidabile e se si accetta di scrivere un modulo di parsing robusto.
- **Fatture in Cloud** è un'alternativa solo se si accetta di usarlo come *motore documentale*: il software custom dovrebbe creare i documenti nel modello dati di FIC e non generare un XML proprio. Va contro l'obiettivo di un gestionale custom.
- **Registrare il codice destinatario di un intermediario** convoglia *tutte* le fatture passive di Energenia verso quel fornitore:
  - lock-in, perché cambiare fornitore richiede di riregistrare l'indirizzo;
  - il fornitore tratta tutti i dati delle fatture passive;
  - è però il modo più semplice per avere la ricezione in tempo reale via webhook.

  L'alternativa privacy-first è registrare la **PEC aziendale** come indirizzo telematico.

### Gaps
- Le pagine ufficiali fatturapa.gov.it (canali, specifiche PEC, limiti per file: per esempio il limite ~5 MB per singolo file su WS e la dimensione massima dei lotti) **non sono state lette direttamente** (WebFetch bloccato). *[da verificare]*
- Non ho trovato fonti sui **limiti giornalieri di invio** delle PEC (Aruba PEC, Legalmail, Namirial) né sulla gestione IMAP via script. *[da verificare]*
- **Non verificati** per mancanza di budget di ricerca: Zucchetti Digital Hub, Namirial (API SdI), Credemtel, Doxee, Agyo (TeamSystem), Invopop. Edok risulta come conservatore iscritto al Marketplace AgID ([Edok](https://www.edok.it/azienda/conservatore-accreditato-agid/)), ma non è stata verificata un'API SdI. Invopop offre un'API FatturaPA ([Invopop](https://www.invopop.com/coverage/fatturapa)), prezzi non verificati.
- **GDPR, DPA, localizzazione dati (UE/Italia)**: nessuna informazione trovata per Invoicetronic, Openapi, A-Cube e fattura-elettronica-api.it. Va chiesto a ciascuno un DPA ex art. 28 GDPR e l'ubicazione dei datacenter.
- **Openapi**: non è chiaro quale prezzo valga (€0,015, €0,025 o €0,07) né se la ricezione delle passive costi. Le pagine potrebbero essere datate (una risultava di circa 1.500 giorni fa).
- **Invoicetronic**: il prerequisito "attivazione della conservazione a norma" non è chiaro. Non si sa se sia un servizio Invoicetronic a pagamento o se basti l'adesione al servizio gratuito AdE. Non è chiara nemmeno la natura degli scaglioni (pacchetti prepagati?). Ragione sociale e hosting non verificati.
- Il costo dell'accreditamento SDICoop (presumibilmente gratuito) non risulta da nessuna fonte. Il thread [Forum Italia "Quanto costa l'accreditamento"](https://forum.italia.it/t/quanto-costa-l-accreditamento-per-inviare-fatture-via-web-service/45685) è stato individuato ma non letto.

## 2. Download di fatture passive e dati da Fatture e Corrispettivi / cassetto fiscale

### Takeaway
L'AdE **non offre API ufficiali** per scaricare le fatture. Il download si fa a mano (SPID/CIE/CNS) dal portale, previa adesione al servizio di consultazione e acquisizione. L'automazione passa solo da intermediari delegati: dall'8/12/2025 si usa la **Delega Unica**, e i servizi di fatturazione elettronica e conservazione sono delegabili anche a soggetti non intermediari. A-Cube è il provider più documentato per lo scarico massivo via API. Se le passive arrivano già al software tramite il codice destinatario o la PEC, il download dal cassetto serve solo come **riconciliazione di controllo** (per esempio fatture recapitate altrove o con indirizzo errato).

### Cited Findings
- L'accordo di adesione al servizio di **consultazione e acquisizione** delle fatture (e dei duplicati informatici) rinvia al **Provvedimento n. 433608 del 24/11/2022**. — [AdE, Adesione.pdf](https://ivaservizi.agenziaentrate.gov.it/cons/cons-web/resources/pdf/Adesione.pdf)
- Le finestre di adesione storiche sono state prorogate più volte, fino al 31/12/2021. Chi aderisce oltre il termine vede solo le fatture dal giorno successivo all'adesione. — [FiscoeTasse](https://www.fiscoetasse.com/rassegna-stampa/28196-consultazione-e-fatture-ulteriore-proroga-del-termine-di-adesione-al-31-dicembre.html); [AteneoWeb](https://www.ateneoweb.com/news/consultazione-e-acquisizione-e-fatture-tempo-fino-al-31-dicembre-per-aderire-al-servizio/); [Agenda Digitale](https://www.agendadigitale.eu/documenti/fatturazione-elettronica/consultazione-fatture-elettroniche-come-funziona-il-servizio-dellagenzia-delle-entrate/)
- Uno studio professionale (settembre 2026) cita una scadenza di adesione al **30/09/2026**, senza indicare il provvedimento. **Non verificato.** — [Studio Azeta](https://www.studioaz.it/2026/09/adesione-al-servizio-di-acquisizione-e-consultazione-fatture-elettroniche/)
- **Delega Unica**:
  - Provvedimento **n. 321918 del 7/8/2025**: dall'**8/12/2025** nuove funzioni per conferire, rinnovare e revocare le deleghe;
  - quadro giuridico nel provv. n. 375356 del 2/10/2024, modificato il 20/5/2025;
  - servizi delegabili: cassetto fiscale, consultazione e acquisizione delle fatture e dei duplicati, dati IVA, registrazione dell'indirizzo telematico, accreditamento dispositivi;
  - **i servizi di fatturazione elettronica e conservazione sono delegabili anche a soggetti non intermediari**, con comunicazione del contribuente dalla propria area riservata;
  - l'intermediario comunica le deleghe con file XML firmato;
  - periodo transitorio per il cassetto fiscale fino al 30/4/2026.
  — [FiscoeTasse](https://www.fiscoetasse.com/new-rassegna-stampa/2660-delega-unica-agli-intermediari-nuove-modalita-dall8-dicembre-2025.html); [PwC blog](https://blog.pwc.it/delega-unica-dal-8-dicembre-2025-nuove-regole-per-la-gestione-delle-deleghe-agli-intermediari/); [Fisco7](https://www.fisco7.it/2025/12/delega-unica-al-via-dall8-dicembre-come-opera-lintermediario-delegato/); [Edotto](https://www.edotto.com/articolo/delega-unica-dall8-dicembre-2025-nuovo-sistema-telematico); [ECnews PDF](https://www.ecnews.it/wp-content/uploads/pdf/2025-11-13_la-delega-unica-in-vigore-dall8-dicembre-2025.pdf)
- Limite riportato (non confermato da tutte le fonti): **massimo 2 intermediari** delegati per contribuente. — [FiscoeTasse](https://www.fiscoetasse.com/new-rassegna-stampa/2660-delega-unica-agli-intermediari-nuove-modalita-dall8-dicembre-2025.html); [A-Cube blog](https://www.acubeapi.com/blog/scarico-massivo-dal-cassetto-fiscale-tramite-api-guida-tecnica)
- **A-Cube "API download cassetto fiscale"** (fonte promozionale):
  - prerequisito: la Delega Unica a favore di A-Cube, una volta per P.IVA, abilitata dal cliente sul portale Fatture e Corrispettivi;
  - scarico **giornaliero** automatico delle fatture attive e passive in XML, PDF, JSON o CSV;
  - "l'AdE non mette a disposizione API ufficiali o procedure automatiche per terzi";
  - secondo A-Cube le fatture restano nel cassetto per **massimo 15 mesi**, mentre A-Cube le conserva per **2 anni / 24 mesi** (cifra incoerente tra le sue pagine);
  - limite di **tre richieste al giorno** (sul portale AdE, secondo A-Cube).
  — [Prodotto A-Cube](https://www.acubeapi.com/prodotti/api-download-cassetto-fiscale); [Guida tecnica](https://www.acubeapi.com/blog/scarico-massivo-dal-cassetto-fiscale-tramite-api-guida-tecnica); [Blog download massivo](https://www.acubeapi.com/blog/download-massivo-fatture-elettroniche-dal-cassetto-fiscale); [Sincronizzazione](https://www.acubeapi.com/blog/sincronizzazione-automatica-del-cassetto-fiscale-come-integrarla-via-api)
- A-Cube: il prezzo varia in base al volume di fatture scaricate e al numero di P.IVA collegate; nessun listino pubblico. — [e-invoice.app](https://www.e-invoice.app/vendors/a-cube-api)

### Inferences
- **Base legale:** l'unica via lecita e documentata per far scaricare fatture "da un software" è la **Delega Unica** a un soggetto abilitato, che poi accede ai servizi AdE per conto del contribuente. Uno scraping del portale con credenziali SPID aziendali da parte del software custom non è previsto né documentato dall'AdE. Sarebbe fragile per via dell'MFA SPID e potenzialmente contrario alle condizioni d'uso. *[inferenza, condizioni d'uso non verificate]*
- **Rischi della delega a un terzo:**
  - il terzo vede l'intero cassetto (non solo le fatture), se la delega comprende il cassetto fiscale;
  - concentrazione di dati presso un fornitore privato;
  - la delega va rinnovata e monitorata;
  - il limite di 2 intermediari può confliggere con il commercialista già delegato.
- Per Energenia la strategia più semplice è ricevere le passive **direttamente** (codice destinatario del provider SdI scelto, oppure PEC registrata) e usare il portale AdE (download manuale periodico, o API di un delegato) solo per una **quadratura mensile o trimestrale** tra cassetto e fatture importate.
- Invoicetronic e Openapi offrono la ricezione via codice destinatario. Non ho trovato evidenza che offrano anche il download dal cassetto fiscale (vedi Gaps).

### Gaps
- Non ho verificato se Openapi, Invoicetronic o fattura-elettronica-api.it offrano il download dal cassetto fiscale con delega.
- Testo ufficiale delle condizioni del servizio di consultazione (periodo di disponibilità dei file nel portale; la cifra "15 mesi" è di A-Cube) e stato attuale delle scadenze di adesione 2026: non verificati sulle fonti AdE.
- Testo del provv. 321918/2025 e allegato tecnico: non letti direttamente.
- Prezzi del servizio A-Cube cassetto fiscale: non pubblici.

## 3. Conservazione digitale a norma

### Takeaway
L'opzione più economica per le fatture elettroniche è il **servizio gratuito AdE**. Si aderisce su Fatture e Corrispettivi e conserva automaticamente **le fatture transitate da SdI** (attive e passive) per 15 anni. Dalle adesioni del giugno 2021 non scade più triennalmente, ma non ha API: il recupero è manuale dal portale. Copre solo i file SdI: non registri, libro giornale, prima nota, contratti o DDT. Per questi serve un conservatore (Aruba, InfoCert, Namirial, Edok, ecc., verificabili sul Marketplace AgID) oppure la conservazione "in proprio", troppo onerosa per una Srl. Alcuni intermediari API vendono la conservazione come add-on, per esempio Openapi con `invoices_legal_storage` a €0,105 contro €0,07.

### Cited Findings
- Servizio gratuito AdE:
  - adesione all'accordo di servizio in Fatture e Corrispettivi (anche tramite intermediario);
  - conservazione **15 anni** delle fatture transitate da SdI, disponibili anche dopo recesso o decadenza (FAQ AdE aggiornate al 28/4/2021).
  — [FAQ AdE 2021 (PDF)](https://www.agenziaentrate.gov.it/portale/documents/20143/287582/14+Tutte+le+faq+(aggiornate+al+28+aprile+2021)+.pdf/948335b1-0f5f-eab4-a3d7-9c0525395af1?version=1.0); [Condizioni di utilizzo AdE](https://assistenzafe.agenziaentrate.gov.it/knowledgebases2/FattElettr/attach/ConservaFattura/Condizioni_Utilizzo.pdf); [iContenzioso](https://www.icontenzioso.com/guide/conservazione-fatture-elettroniche/)
- **Durata dell'accordo: fonti in conflitto.**
  - Adesioni **ante 4/6/2021**: triennali, da rinnovare; senza rinnovo le fatture successive non vengono conservate. — [Il Sole 24 Ore NT+](https://ntplusfisco.ilsole24ore.com/art/e-fattura-necessario-rinnovo-conservazione-le-adesioni-fine-2018-AEL3Qo4); [Studio Zanovello](https://www.studioassociatozanovello.it/notizie/rinnovo-delle-adesioni-alla-conservazione-delle-fatture-dellagenzia-delle-entrate/); [Soges](https://sogessoftware.eu/blog/713-rinnovo-conservazione)
  - Adesioni **dal 4/6/2021**: valide fino a recesso. — [Studio Zanovello](https://www.studioassociatozanovello.it/notizie/rinnovo-delle-adesioni-alla-conservazione-delle-fatture-dellagenzia-delle-entrate/); [Soges](https://sogessoftware.eu/blog/713-rinnovo-conservazione)
  - Le FAQ 2021 parlano invece di "3 anni con rinnovo tacito". — [FAQ AdE 2021](https://www.agenziaentrate.gov.it/portale/documents/20143/287582/14+Tutte+le+faq+(aggiornate+al+28+aprile+2021)+.pdf/948335b1-0f5f-eab4-a3d7-9c0525395af1?version=1.0)
- È possibile la **conservazione retroattiva** da una data indicata. — [Mem Informatica](https://www.meminformatica.it/index.php?option=com_k2&view=item&id=1336:fattura-elettronica-conservazione-retroattiva-novita-dell-agenzia-delle-entrate&Itemid=1016)
- Limiti del servizio AdE:
  - conserva **solo** i documenti transitati da SdI (e i corrispettivi telematici);
  - recupero manuale dal portale, **senza API né integrazione** con il gestionale;
  - i pacchetti sono scaricabili come XML + indice firmato + marca temporale (fonte: blog di un provider concorrente).
  — [FatturaPro.click](https://fatturapro.click/conservazione-automatica-fatture-elettroniche-rischi-e-soluzioni/); [Fatturah](https://www.fatturah.it/blog/conservazione-sostitutiva-fatture-gratis); [Studio Benedetti](https://www.studiobenedetti.eu/il-servizio-di-conservazione-gratuita-dellagenzia-delle-entrate/)
- Si conserva l'**XML** transitato da SdI, non il PDF di cortesia. — [TaxMan](https://www.taxmanapp.it/blog/2026/01/27/come-conservare-le-fatture-elettroniche/); [Sibill 2026](https://sibill.com/contabilita/fatturazione-elettronica-e-conservazione-guida-e-scadenze-2026/)
- L'obbligo di conservazione vale **sia per l'emittente sia per il ricevente** (art. 39 DPR 633/72); minimo 10 anni per documenti fiscali e contabili. — [Fattura24](https://www.fattura24.com/guide-pratiche/fatturazione-elettronica/conservazione-norma/)
- **Conservatori qualificati:**
  - dal DL 76/2020 (L. 120/2020) AgID gestisce il **Marketplace dei servizi di conservazione**;
  - per i privati l'iscrizione del conservatore non è obbligatoria;
  - requisiti nell'Allegato A del Regolamento AgID;
  - elenco pubblico su conservatoriqualificati.agid.gov.it;
  - InfoCert ed Edok sono iscritti.
  — [Agenda Digitale, Allegato A](https://www.agendadigitale.eu/documenti/fatturazione-elettronica/fornitori-servizi-di-conservazione-le-nuove-regole-agid-focus-allegato-a/); [AgID Allegato A (PDF)](https://www.agid.gov.it/sites/default/files/repository_files/allegato_a_.pdf); [InfoCert news](https://www.infocert.it/news-eventi/infocert-approda-sul-marketplace-dei-servizi-di-conservazione-di-agid); [Edok](https://www.edok.it/azienda/conservatore-accreditato-agid/); [Intesa (Kyndryl)](https://www.intesa.it/perche-e-bene-scegliere-un-conservatore-qualificato/); [Sinet](https://blog.sinetinformatica.it/2021/07/01/il-nuovo-regolamento-agid-sui-criteri-per-la-fornitura-dei-servizi-di-conservazione-dei-documenti-informatici/)
- Prezzi indicativi:
  - Aruba Fatturazione Elettronica base (circa €29,90/anno) **include la conservazione 10 anni** delle fatture del servizio; con i moduli extra si arriva a circa €134,60 + IVA/anno. — [CentroFiscale recensione 2026](https://centrofiscale.com/aruba-fatturazione-elettronica-recensione-2026/); [ProFattura](https://www.profattura.it/guide/aruba-fatturazione-elettronica-quando-cambiare)
  - Namirial "da €30/anno per P.IVA", con conservazione inclusa (fonte di circa 4 anni fa). — [Agenda Digitale](https://www.agendadigitale.eu/documenti/i-software-per-la-fatturazione-elettronica-b2b/)
  - Openapi: endpoint con legal storage a €0,105 contro €0,07 per l'invio semplice. — [Openapi](https://openapi.com/products/italian-electronic-invoicing)
  - Openapi dichiara conservazione 10 anni conforme eIDAS. — [Openapi console](https://console.openapi.com/apis/sdi/info)

### Inferences
- **Setup consigliato per Energenia:**
  1. aderire al **servizio gratuito AdE**, possibilmente con decorrenza retroattiva, per tutte le fatture SdI attive e passive;
  2. nel software custom, mantenere un **archivio applicativo** (XML originali, notifiche SdI, hash SHA-256, metadati: numero, data, P.IVA controparte, identificativo SdI) a fini operativi. Questo archivio *non* sostituisce la conservazione a norma;
  3. libri e registri contabili (libro giornale, registri IVA, prima nota se tenuta come libro), se tenuti in forma elettronica: affidarli a un conservatore qualificato oppure stamparli/gestirli secondo le regole vigenti. Verificare con il commercialista.
- **Conservazione in proprio** significa, secondo le Linee guida AgID:
  - manuale di conservazione e responsabile della conservazione;
  - pacchetti di versamento, archiviazione e distribuzione con indice (UNI SInCRO);
  - firma e marca temporale;
  - metadati minimi;
  - sicurezza e audit.

  È un onere organizzativo sproporzionato per una Srl piccola: meglio delegare (AdE gratis, o conservatore). *[inferenza basata sul quadro AgID; Linee guida non lette direttamente]*
- Conviene **non** pagare la conservazione nell'intermediario SdI se si usa il servizio AdE. Fa eccezione il caso in cui si voglia un recupero via API, che l'AdE non offre: in quel caso il legal storage di Openapi a ~€0,035/fattura in più è economico.

### Gaps
- Testo vigente dell'accordo di conservazione AdE (durata, recesso, formato dei pacchetti di distribuzione, eventuali limiti di volume): non verificato direttamente.
- Listini 2026 dei conservatori standalone (Aruba DocFly / Conservazione, InfoCert LegalDoc, Namirial) per volumi PMI: **non trovati**; vanno chiesti preventivi.
- Metadati obbligatori del pacchetto di versamento per le fatture (Allegato 5 Linee guida AgID) e trattamento di libro giornale e registri IVA: non coperti dalle fonti trovate.

## 4. Integrazione bancaria per prima nota e riconciliazione

### Takeaway
Per una Srl che vuole leggere **i propri** conti ci sono due strade.
- **(a) Open banking PSD2** tramite un AISP licenziato che fornisce il servizio all'azienda come utente finale. L'azienda non ha bisogno di licenza propria (vedi Inferences), ma deve avere un contratto con l'AISP.
  - GoCardless Bank Account Data (ex Nordigen) **non accetta nuove registrazioni dal 2025**.
  - Il piano gratuito "restricted" di Enable Banking è **riservato all'uso personale/valutazione** ed esclude espressamente l'uso business.
  - Tink, Salt Edge, Yapily, TrueLayer e Fabrick sono sales-led e non hanno prezzi PMI pubblici.
  - Consenso: la riautenticazione SCA è passata da **90 a 180 giorni** con l'emendamento EBA all'RTS.
- **(b) File bancari**: **CBI RH** (rendicontazione movimenti), **camt.053/054** (ISO 20022 in profilo CBI), MT940 o CSV dal corporate banking. Gratuiti o già inclusi nel canone, robusti e privati, ma con import manuale o semi-automatico.

Per i pagamenti, il software può generare **pain.001 in profilo CBI** (CBIPaymentRequest; versione corrente basata su pain.001.001.09, dal 17/3/2024) e **SDD pain.008**. Per le RiBa non ho trovato fonti.

### Cited Findings

#### 4a. Aggregatori open banking

| Aggregatore | Stato e accesso per un'azienda sui propri conti | Prezzo | Copertura IT / note | Fonti |
|---|---|---|---|---|
| **GoCardless Bank Account Data (ex Nordigen)** | **Nuove registrazioni chiuse da luglio 2025**; gli account esistenti continuano a funzionare. La data esatta varia tra le fonti ("metà 2025"). | Il free tier non è più ottenibile | — | [Actual Budget docs](https://actualbudget.org/docs/advanced/bank-sync/gocardless/); [DEV, signups disabled](https://dev.to/johnfrandsen/gocardless-bank-account-data-alternatives-what-to-use-when-signups-are-disabled-326d); [DEV, after Nordigen shutdown](https://dev.to/johnfrandsen/self-hosted-bank-account-aggregation-in-2026-after-the-nordigen-free-tier-shutdown-3mdo); [Invoice Ninja forum](https://forum.invoiceninja.com/t/gocardless-nordigen-service-no-longer-available-alternative-needed/22576) |
| **Enable Banking** (FI) | Modalità **restricted production** gratuita, limitata agli account collegati, "solely for evaluation purposes or for the personal use of private individuals". I ToS **escludono "any business or professional purpose, including accessing account information belonging to businesses"**. Una clausola successiva riconosce che i business user possono registrare app in produzione, ma il testo non è stato letto per intero. Per la produzione piena servono contratto e KYB. | Gratis in restricted; contratto senza listino pubblico | Doc Italia: copre i principali ASPSP (**Intesa Sanpaolo, UniCredit, BPER** e altri minori). Intesa usa redirect e SCA via app; UniCredit codice e PIN; per i clienti business sono ancora comuni OTP SMS e token hardware. Credem non confermato. | [ToS](https://enablebanking.com/terms/); [FAQ](https://enablebanking.com/docs/faq/); [Italia](https://enablebanking.com/docs/markets/it/); [Firefly III](https://docs.firefly-iii.org/tutorials/data-importer/eb/); [OpenBankingTracker free APIs](https://www.openbankingtracker.com/guides/free-open-banking-apis); [rfp.wiki](https://www.rfp.wiki/financial-services-banking-fintech/open-banking-platforms/enable-banking) |
| **Tink (Visa)** | Enterprise/sales-led; Tink non pubblica il listino | Fonti terze: Standard **€0,50/utente/mese** (transazioni) e €0,25 per verifica account; enterprise custom. Un blog stima un "floor" a quattro cifre mensili (non verificato, autore in conflitto d'interessi). | 18 mercati europei, 3.400+ istituti | [Finexer](https://blog.finexer.com/tink-pricing/); [MerchantMachine (datato)](https://merchantmachine.co.uk/open-banking-payments/tink/); [DEV, cheapest APIs](https://dev.to/johnfrandsen/the-cheapest-open-banking-apis-for-small-businesses-and-indie-builders-in-2026-5cab); [Yapily blog](https://www.yapily.com/blog/tink-alternatives-6-open-banking-platforms-compared) |
| **Salt Edge** | Sales-led / usage-based | Non pubblico | ~73 paesi | [OpenBankingTracker compare](https://www.openbankingtracker.com/api-aggregators/compare); [DEV](https://dev.to/johnfrandsen/the-cheapest-open-banking-apis-for-small-businesses-and-indie-builders-in-2026-5cab) |
| **Yapily** | Piani Starter, Growth ed Enterprise; le chiavi di produzione richiedono un contatto commerciale | Non pubblico | ~2.000 connessioni, 19 paesi (fonte vendor) | [Yapily blog](https://www.yapily.com/blog/tink-alternatives-6-open-banking-platforms-compared); [DEV](https://dev.to/johnfrandsen/the-cheapest-open-banking-apis-for-small-businesses-and-indie-builders-in-2026-5cab) |
| **TrueLayer** | Nessuna pagina prezzi; produzione su trattativa commerciale | Non pubblico | ">95% dei conti europei" (claim di un blog di confronto) | [DEV, beyond TrueLayer](https://dev.to/johnfrandsen/beyond-truelayer-choosing-the-right-open-banking-api-for-european-projects-2026-5coa) |
| **Fabrick** (Gruppo Sella) | Mette **la propria licenza AISP** e la tecnologia a disposizione anche di aziende non finanziarie; genera una copia "dati" dell'estratto conto per incrociarla con la contabilità. Caso Sistemi S.p.A. (gestionali con riconciliazione precompilata). | Su richiesta | "Oltre 60 banche italiane" (blog, non ufficiale) | [Fabrick AISP](https://www.fabrick.com/it-it/prodotti/aisp/); [Caso Sistemi](https://www.fabrick.com/it-it/industry/customer-stories/sistemi/); [Fintastico](https://www.fintastico.com/it/blog/api-fabrick-open-banking/); [MustWeb](https://www.mustweb.it/aziende/fabrick/fabrick-aggregazione-conti-aisp/) |
| **CBI Globe** | Gateway multi-banca **lato banche e TPP**: CBI distribuisce certificati eIDAS PSD2 e assiste nell'autorizzazione come terza parte. Servizi in "cost sharing". Non è un servizio per l'utente finale. | Nessun listino pubblico | 250+ banche (2021); usato dalle BCC (Iccrea) come interfaccia PSD2 per le TPP | [CBI Globe](https://www.cbi-org.eu/CBI-Globe-en); [Brochure CBI Globe](https://www.cbi-org.eu/Engine/RAServeFile.php/f/Documenti/CBIGlobe/Brochure_CBI_Globe_ITA.pdf); [Agenda Digitale](https://www.agendadigitale.eu/cittadinanza-digitale/cbi-globe-la-porta-daccesso-allopen-banking/); [Gruppo BCC Iccrea, Terze parti](https://www.gruppobcciccrea.it/Pagine/TerzeParti/Terze-parti.aspx); [BCC TPP](https://www.bccas.it/kwp/documenti/PSD2_TPP.htm) |
| **A-Cube** | Dichiara un modulo **open banking** accanto a SdI | Non pubblico | — | [e-invoice.app](https://www.e-invoice.app/vendors/a-cube-api) |

- Un blog di settore del 2021 stima il prezzo business degli aggregatori in **€2-15/mese per consenso** (fonte non autorevole). — [Brentasoft](https://brentasoft.com/blog/psd2-open-banking-pmi-italiane-2021/)
- **Durata del consenso / SCA:** l'EBA ha esteso la riautenticazione da **90 a 180 giorni** e ha reso **obbligatoria** l'esenzione SCA per gli accessi tramite AISP, a determinate condizioni. Applicazione prevista 7 mesi dopo la pubblicazione in GUUE. — [EBA press release](https://www.eba.europa.eu/publications-and-media/press-releases/eba-publishes-final-report-amendment-its-technical-standards); [Vixio](https://vixio.com/insights/pc-90-becomes-180-eba-makes-key-sca-change)

#### 4b. Formati file per movimenti (import nel software)
- **CBI RH** (rendicontazione saldi e movimenti): file .txt/.cbi esportato dall'home/corporate banking. Se non disponibile, c'è il fallback CSV/TXT. — [ProjectPP helpdesk](https://helpdesk.projectpp.it/kb/article/161/riconciliazione-bancaria---importazione-estratti-conto); [Edupass](https://www.edupass.it/Resources/Edupass-Manuali/Manuali/pdf/pillole/Riconciliazione%20bancaria.pdf); [Murtas](https://murtasinformatica.it/Resources/ImmaginiMurtas/News/riconciliazione-bancaria.pdf)
- **camt.053 in profilo CBI**: basato su **camt.053.001.02 BankToCustomerStatementV02**; contiene **solo movimenti contabilizzati**; la cadenza si fissa nel contratto con la banca (documento CBI del ~2013). — [CBI, Rendicontazioni standard tecnici (PDF)](https://babons.it/wp-content/uploads/CBI-RND.pdf)
- I gestionali italiani importano CAMT.053, CAMT.054, MT940, MT942, CBI-RH, BAI2 e Norma43 (Piteco). Mago importa camt.052/053 e "Rendicontazione XML giornaliera" CBI; Business Central (Memento) ha il formato CBISTATEMENT per CBI RH. — [Piteco](https://www.pitecolab.it/piteco-evo-5-evolution/suite-modulare/); [Memento BC](https://bcapps.mementoas.com/it-IT/apps/ItalianBankIntegration/import.html); [QuadraturaBanca](https://quadraturabanca.it/)

#### 4c. File di pagamento generabili dal software
- **SEPA Credit Transfer CBI**:
  - profilo CBI basato su pain.001: la versione 00.03.09 usa pain.001.001.03 (code list IT_CBIPaymentRequest000401);
  - **dal 17/3/2024** nuovi tracciati **pain.001.001.09 CBI v00.04.01** (CBIBdyPaymentRequest.00.04.01; cross-border CBIBdyCrossBorderPaymentRequest.00.01.01).
  — [EOS Solutions (BC)](https://docs.eos-solutions.it/it/docs/apps-func/bank-files-for-italy-cbi/fiscal-update-bnk.html); [Synaptica, formati distinta](https://synaptica-solution.com/knowledge/formati-distinta-bonifico-banche-italiane/); [Synaptica, guida XML SEPA CBI](https://synaptica-solution.com/knowledge/come-generare-xml-sepa-cbi/); [GitHub esempi pain.001/pain.008](https://github.com/SynapticaSolution/sepa-pain001-examples); [Odoo CBI](https://odoo-community.org/shop/banking-sepa-italian-credit-transfer-cbi-3613); [Infor](https://docs.infor.com/locally/2025.x/en-us/lclolh/lcllsppov/pwq1563185403576.html)
- **SDD**: pain.008.001.02 in profilo CBI, secondo fonti vendor; la versione corrente va verificata su cbi-org.eu. — [Ingenia](https://www.ingenia.cloud/blog/come-automatizzare-pagamento-stipendi-cbi-sepa-flussi-bancari)

### Inferences
- **Licenza:** un'azienda che accede ai **propri** conti tramite un AISP autorizzato è un normale *utente* (PSU) del servizio AIS e non ha bisogno di licenza AISP. La licenza serve a chi offre AIS **a terzi**. Il vincolo pratico è quindi **contrattuale** (ToS dell'aggregatore), non regolamentare. Per Energenia il free tier di Enable Banking è formalmente fuori dai ToS; serve un contratto business (KYB). *[inferenza su PSD2; non verificata su testo normativo in questa sessione]*
- **Consenso a 180 giorni:** ogni conto richiede comunque una riautenticazione SCA almeno ogni ~180 giorni, cioè 2 volte l'anno per banca. Per i conti business con token hardware o multi-firma l'esperienza può essere peggiore. Il software deve gestire scadenza, notifica e re-consent.
- **Banche pugliesi** (Banca Popolare di Puglia e Basilicata, BCC locali, Banca Popolare di Bari / Banca di Bari? *[nome e assetto attuale da verificare]*): non ho trovato verifiche di copertura specifiche. Le BCC del gruppo Iccrea espongono le API PSD2 via CBI Globe, quindi un aggregatore che integra CBI Globe dovrebbe raggiungerle. Va verificato caso per caso.
- **Strada file-based:** è la più robusta e privata per la prima nota. Si chiede alla banca il flusso **CBI RH o camt.053 giornaliero** (spesso tramite "CBI corporate banking" multi-banca) e si importa nel software, con deduplica su IBAN + data + importo + riferimento. Lo svantaggio è che di norma serve un download manuale dal portale della banca, salvo servizi CBI di consegna automatica (vedi Gaps).
- **Pagamenti:** generare pain.001 CBI (bonifici fornitori) e pain.008 (SDD) è realistico con librerie esistenti (moduli Odoo, esempi GitHub). La firma e l'invio avvengono comunque nel corporate banking della banca (upload della distinta), salvo PISP.

### Gaps
- **Plaid EU**: nessuna informazione raccolta.
- Prezzi reali Salt Edge, Yapily, TrueLayer, Fabrick, Enable Banking (contratto business), A-Cube open banking: **non pubblici**.
- Copertura verificata per **Banca Popolare di Puglia e Basilicata, BCC pugliesi, Credem, BNL, Poste (BancoPosta Impresa)**: non verificata. Budget di ricerca esaurito.
- **RiBa CBI** (tracciato "RIBA" a record fissi, flusso esiti "RA/RB"?) e il formato **MT940** sui portali Inbiz (Intesa) e UniWeb/Business Net (UniCredit): nessuna fonte trovata. Anche il tracciato SDD CBI attuale va verificato su cbi-org.eu. *[da verificare]*
- Data di applicazione del regolamento delegato EBA 180 giorni: non confermata dalle fonti trovate. *[Da conoscenza pregressa: Reg. Delegato (UE) 2022/2360, applicabile dal 25/7/2023, da verificare su EUR-Lex.]*
- Testo completo della clausola "business users" dei ToS di Enable Banking: non letto.

## 5. Firma digitale per le fatture verso la PA

### Takeaway
La firma qualificata (CAdES o XAdES) è **obbligatoria solo per le fatture verso la PA (FPA12)** ed è **facoltativa nel B2B/B2C**. Se la PA è un cliente occasionale, la soluzione più semplice è far firmare l'intermediario: Invoicetronic chiede €0,02 a firma. In alternativa si usa un dispositivo o una firma remota del legale rappresentante (circa €40 + IVA per 3 anni presso un fornitore) con firma manuale del .p7m prima del caricamento. Le API di firma remota con firma automatica (HSM/OTP) hanno un senso solo con volumi PA rilevanti.

### Cited Findings
- Le fatture verso la PA devono essere firmate digitalmente prima dell'invio, salvo quelle create sul portale AdE, che appone un sigillo elettronico. — [FatturaFacile FAQ](https://www.fatturafacile.com/fattura-elettronica-tracciato-xml-domande-e-risposte/)
- Nel B2B e B2C la firma **non è obbligatoria**. — [TaxMan 2026](https://www.taxmanapp.it/blog/2026/01/14/firma-digitale-come-crearla-e-firmare-le-fatture-elettroniche/); per Invoicetronic la firma è "mandatory only for the Italian Public Administration" — [Invoicetronic pricing](https://invoicetronic.com/en/pricing/)
- Formati: le fonti citano CAdES e XAdES "enveloped"; serve una **firma elettronica qualificata**. — [TaxMan](https://www.taxmanapp.it/blog/2026/01/14/firma-digitale-come-crearla-e-firmare-le-fatture-elettroniche/); [FtPA](https://www.ftpa.it/firmadigitale.php)
- Se un intermediario **emette** la fattura per conto del cedente (terzo emittente), **firma l'intermediario**, mentre la responsabilità fiscale resta al cedente. Se l'intermediario si limita a trasmettere, la firma resta a carico dell'emittente. — [fatturapa.gov.it FAQ file FatturaPA](https://www.fatturapa.gov.it/it/faq/FAQ_file_fatturapa.htm/)
- Costi:
  - Invoicetronic: firma .p7m **€0,020** ciascuna. — [Invoicetronic](https://invoicetronic.com/en/pricing/)
  - firma remota (OTP virtuale) **€40 + IVA per 3 anni**, con identificazione anche via SPID/CIE; alcuni fornitori offrono "pay per sign". — [FtPA firma digitale](https://www.ftpa.it/firmadigitale.php); [FtPA prezzi](https://www.ftpa.it/prezzifatturazioneelettronica.php); [LetteraSenzaBusta](https://www.letterasenzabusta.com/firma-digitale-per-fatture-elettroniche-pa.html)

### Inferences
- Per Energenia, che fattura raramente alla PA, la soluzione più semplice è un intermediario che firma per suo conto (Invoicetronic €0,02 a fattura PA), senza integrare API di firma remota. Il legale rappresentante probabilmente ha già una firma digitale (smart card o remota) per altri adempimenti, utilizzabile come fallback manuale. *[inferenza]*
- Con il canale **PEC diretto** la firma ricade su Energenia per ogni fattura PA. Si può firmare manualmente con il software del dispositivo, accettabile per pochi documenti l'anno.

### Gaps
- Prezzi e modalità delle **API di firma remota automatica** (Aruba Remote Sign, InfoCert, Namirial) per la firma massiva o automatica: non trovati.
- Specifica ufficiale corrente su CAdES-BES / XAdES-BES per FPA12: fatturapa.gov.it non letto direttamente.

## 6. Raccomandazioni: setup più economico e robusto vs setup più privato (500-3.000 fatture/anno)

### Takeaway
**Setup consigliato (economico e robusto):**
- SdI via un'**API REST pay-per-use** (Invoicetronic, oppure Openapi o fatturaelettronica-api.it come alternative), con codice destinatario del provider registrato e webhook: circa **€100-300/anno**;
- conservazione con il **servizio gratuito AdE**;
- quadratura periodica col cassetto fiscale (download manuale, o A-Cube con delega se serve automazione);
- **import di CBI RH o camt.053** dal corporate banking, più open banking solo se si trova un contratto AISP business conveniente (Enable Banking contratto, Fabrick, A-Cube).

**Setup più privato:**
- **PEC aziendale registrata come indirizzo telematico** e canale PEC verso SdI, con automazione via IMAP/SMTP;
- conservazione AdE;
- **solo file bancari**;
- firma PA con il dispositivo del legale rappresentante.

Nel setup privato gli unici terzi sono il gestore PEC e la banca, ma servono più sviluppo e più manutenzione.

### Cited Findings
- I prezzi unitari e le funzioni usati per il confronto sono nelle tabelle delle sezioni 1, 3 e 4. Riferimenti principali: [Invoicetronic pricing](https://invoicetronic.com/en/pricing/), [Openapi](https://openapi.com/products/italian-electronic-invoicing), [fatturaelettronica-api.it](https://www.fatturaelettronica-api.it/), [fattura-elettronica-api.it](https://www.fattura-elettronica-api.it/piani-e-prezzi/), [InfoCert Legalinvoice Business](https://www.infocert.it/fatturazione/legalinvoice-business), [Enable Banking ToS](https://enablebanking.com/terms/), [GoCardless status (Actual Budget)](https://actualbudget.org/docs/advanced/bank-sync/gocardless/)
- La PEC non richiede accreditamento; SDICoop/SDIFTP sono rivolti a operatori ad alta maturità IT e alti volumi. — [fatturapa.gov.it, Sistema di Accreditamento](https://www.fatturapa.gov.it/it/SistemaAccreditamento/cose-il-sistema-di-accreditamento/)
- Il servizio di conservazione AdE è gratuito ma senza API. — [FatturaPro.click](https://fatturapro.click/conservazione-automatica-fatture-elettroniche-rischi-e-soluzioni/)

### Inferences

**Matrice decisionale**

| Criterio | A. API intermediario (Invoicetronic, Openapi) | B. PEC diretta | C. SDICoop proprio | D. SaaS con API (Fatture in Cloud, Aruba Premium, Legalinvoice) |
|---|---|---|---|---|
| Costo annuo canale (500-3.000 transazioni) | ~€50-300 | ~0 + canone PEC | 0 di canone, alto in sviluppo e operatività | €100-900+ |
| Effort di sviluppo | Basso (REST + webhook + sandbox) | Medio-alto (MIME/PEC, p7m, polling IMAP, mapping notifiche) | Alto (SOAP, mTLS, certificati, accreditamento) | Medio (adattarsi al modello del SaaS; FIC non accetta XML esterni) |
| Ricezione passive | Codice destinatario del provider, webhook | PEC registrata come indirizzo telematico | Codice destinatario proprio | Codice del SaaS |
| Privacy / terzi | Il provider vede tutte le fatture attive e passive | Solo il gestore PEC (trasporto) | Nessun terzo | Il SaaS vede tutto, e il modello dati vive nel SaaS |
| Lock-in | Medio (cambio codice destinatario) | Basso | Nessuno | Alto |
| Robustezza | Alta (stato tracciato, retry, log) | Media | Alta se ben gestito | Alta |

**Proposta concreta a costo minimo e robusta**
1. **SdI**: Invoicetronic. Prezzo pubblico chiaro, sandbox gratis, webhook gratuiti, firma PA a €0,02, ricezione su codice 7HD37X0. A 1.500-3.000 transazioni l'anno costa ~€200-275 per pacchetti che non scadono. Alternativa: Openapi, potenzialmente più economica sull'attivo se la ricezione è davvero quasi gratuita (da verificare).
2. **Conservazione**: adesione gratuita AdE (retroattiva). Archivio interno del software con XML, notifiche e hash per l'operatività.
3. **Cassetto fiscale**: download manuale mensile o trimestrale per quadratura. Automazione con A-Cube e Delega Unica solo se il volume lo giustifica (prezzo da chiedere).
4. **Banche**: import CBI RH o camt.053, più CSV come fallback. L'open banking si valuta in seguito con un contratto business (Enable Banking, Fabrick o A-Cube), chiedendo prezzi per 2-4 conti e copertura su BPPB e BCC.
5. **Pagamenti**: export pain.001 CBI v00.04.01 (pain.001.001.09) per le distinte di bonifico, da caricare nel corporate banking.

**Proposta "massima privacy"**
- PEC aziendale come indirizzo telematico registrato e come canale di invio;
- conservazione AdE;
- file bancari;
- firma PA con il dispositivo del legale rappresentante.

Sono dati che l'AdE e la banca hanno comunque; si aggiunge solo il gestore PEC come terzo. Costo: sviluppo del modulo PEC, da stimare.

**Ibrido consigliabile:** partire con A per avere time-to-market e robustezza, progettando il software con un **adapter di canale** (interfaccia `SdiChannel`: invia, stato, ricevi) che permetta di passare a B, o a un altro provider, senza riscrivere il dominio.

### Gaps
- Prezzi PEC 2026 e limiti di invio giornalieri/IMAP dei gestori: non raccolti.
- DPA e localizzazione dei dati dei provider API: non raccolti. Sono essenziali per la valutazione "privacy" dell'opzione A.
- I costi effettivi del canale B (giornate di sviluppo) e la stabilità a lungo termine dell'interfaccia PEC SdI non sono stimabili dalle fonti trovate.
- Ricerca interrotta per budget di ricerca esaurito ed egress di WebFetch bloccato. Le verifiche prioritarie da completare in una sessione successiva sono:
  1. pagine ufficiali fatturapa.gov.it (canali, PEC, limiti);
  2. condizioni del servizio AdE di conservazione e consultazione;
  3. DPA e hosting di Invoicetronic, Openapi e A-Cube;
  4. copertura PSD2 delle banche di Energenia;
  5. tracciati RiBa e SDD CBI correnti.
