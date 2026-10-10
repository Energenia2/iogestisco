# Danea Easyfatt (Danea Soft / gruppo TeamSystem): prodotto di riferimento da clonare (fatture attive, fatture passive, prima nota; senza magazzino)

> **Come sono state raccolte queste note (10/10/2026).** Il proxy di uscita di questa sessione ha bloccato danea.it, help.danea.it, teamsystem.com, capterra.it, trustpilot.com e centrofiscale.com (CONNECT 403 / DNS non risolto). Quasi tutti i fatti su Danea vengono quindi dagli **estratti del motore di ricerca** delle pagine ufficiali citate, non da una lettura integrale. I dettagli sulla struttura del database vengono da un progetto open source di terzi scaricato da PyPI/GitHub. Il budget di ricerca web si è esaurito prima di coprire i permessi utente (lato documentazione), i forum e la corruzione degli archivi: quei punti sono segnalati come Gap. Gli URL sono quelli delle pagine indicizzate.

## 1. Edizioni, prezzi, soglie di fatture elettroniche e costi extra (stato 2025-2026)

### Takeaway
Nel 2026 Easyfatt si vende come **licenza annuale (12 mesi) con Support Plan e servizio di fatturazione elettronica inclusi**. Le edizioni attive sono **Professional, Enterprise One ed Enterprise**; la **Standard** sopravvive solo come licenza "vecchia" con soglia di 80 fatture elettroniche. Dal 2025-2026 ogni edizione monoutente ha un **tetto annuo di fatture elettroniche (inviate + ricevute)**: 80 Standard, 400 Professional, 800 Enterprise One, nessun limite Enterprise. Superato il tetto si è spinti all'upgrade, ed è la principale fonte di malcontento. I prezzi indicativi sono ~15 €/mese (180 €/anno) per Professional, ~25 €/mese per Enterprise One e ~35-40 €/mese per Enterprise, IVA esclusa. Easyfatt Cloud è un canone aggiuntivo.

### Cited Findings
- **Gerarchia delle edizioni** secondo la pagina ufficiale "Caratteristiche":
  - **Professional** aggiunge a Standard la stampa di registri e liquidazione IVA, l'analisi vendite/acquisti, il magazzino, le etichette barcode, l'invio documenti via email e l'agenda. Fatturazione elettronica inclusa fino a **400** fatture.
  - **Enterprise One** aggiunge vendita al banco con registratore di cassa/touch/fidelity, taglie e colori, lotti/seriali, e-commerce, agenti e provvigioni, multi-magazzino, distinta base. Include **800** fatture.
  - **Enterprise** aggiunge la **multiutenza fino a 5 postazioni** in LAN con diritti utente configurabili e **nessuna soglia** di fatture.

  Fonti: [danea.it/caratteristiche](https://www.danea.it/software/easyfatt/caratteristiche/), [danea.it/acquista](https://www.danea.it/software/easyfatt/acquista/), [danea.it/enterprise-multiutente](https://www.danea.it/software/easyfatt/enterprise-multiutente/)
- **Come si contano le soglie:** fatture **inviate + ricevute**, sommate per anno solare (01/01-31/12) indipendentemente dalla data di rinnovo. Per Professional ed Enterprise One la soglia scatta dal primo rinnovo successivo all'1/12/2025 — [FAQ id=585](https://www.danea.it/software/easyfatt/supporto/faq/?id=585); [FAQ id=583, contatore](https://www.danea.it/software/easyfatt/supporto/faq/?id=583)
- **Licenza Standard:** soglia di **80 fatture elettroniche** totali (inviate + ricevute) introdotta dall'1/1/2025, contatore azzerato all'1/1/2026. Chi supera la soglia deve passare a un'edizione superiore. Il contatore è visibile in fondo alla sezione Start — [FAQ id=598](https://www.danea.it/software/easyfatt/supporto/faq/?id=598). L'estratto la definisce "vecchia licenza Standard": la Standard sembra non più in vendita (inferenza, vedi sotto).
- **Prezzi ufficiali:** l'estratto della pagina prezzi Danea riporta **15 €/mese Professional** e **25 €/mese Enterprise One** — [danea.it/prezzi?tab=prezzi](https://www.danea.it/software/easyfatt/prezzi/?tab=prezzi). Una seconda ricerca ha invece visto solo segnaposto ("Da € _ al mese + IVA") sulla pagina di confronto: il dato ufficiale non è confermato da lettura diretta.
- **Prezzi da rivenditore (Gestionale Ideale):** Professional 15 €/mese (180 € fatturati annualmente), Enterprise One 25 €/mese (300 €/anno), Enterprise 40 €/mese (480 €/anno), licenza 12 mesi con Support Plan e fatturazione elettronica inclusi — [gestionaleideale.it](https://gestionaleideale.it/)
- **Confronto di terze parti 2026 (centrofiscale.com):** Professional ~180 € + IVA/anno, Enterprise One ~288 € + IVA, Enterprise ~420 € + IVA con fatture illimitate. Professional ed Enterprise One sono indicate come "2 PC senza rete" — [centrofiscale.com](https://centrofiscale.com/teamsystem-fatture-cloud-vs-danea-easyfatt-2026/). Non coincide del tutto con il listino Danea.
- **Dato storico (articolo ~2022):** Standard 8 €/mese con licenza 12 mesi, Enterprise 26 €/mese fino a 5 utenti. Tutte le versioni includevano fatturazione elettronica, POS digitale integrato, assistenza e aggiornamenti — [pagamentidigitali.it](https://www.pagamentidigitali.it/ecommerce/danea-easyfatt-il-software-gestionale-per-ecommerce/)
- **Prezzi retail (IVA inclusa, box/licenza elettronica):** Standard da 90 €, Professional ~199-213 €, Enterprise ~398-568 €, Enterprise One ~291 € + IVA presso un rivenditore. Le schede parlano di licenza con "Danea Support Plan incluso per 12 mesi" e rinnovo annuale — [trovaprezzi Standard](https://www.trovaprezzi.it/Fprezzo_software_danea_easyfatt_standard.aspx), [trovaprezzi Professional](https://www.trovaprezzi.it/Fprezzo_software_danea_easyfatt_professional.aspx), [trovaprezzi Enterprise](https://www.trovaprezzi.it/software/prezzi-scheda-prodotto/danea_easyfatt_enterprise), [omnitekstore Enterprise One](https://www.omnitekstore.it/easyfatt-invio-telematico/1850-danea-easyfatt-enterprise-one-software-gestionale-9682201379447.html)
- **Conservazione a norma:** **tutte** le fatture inviate e ricevute con Easyfatt vanno in conservazione per **10 anni** tramite **TS Digital (ex Agyo)**, anche se si smette di pagare il rinnovo. Invio e ricezione sono descritti come illimitati: dal 2025 valgono però le soglie per edizione viste sopra — [danea.it/fattura-elettronica](https://www.danea.it/software/easyfatt/fattura-elettronica/), [omnitekstore](https://www.omnitekstore.it/content/58-fatturazione-elettronica-danea-easyfatt)
- **Versione dimostrativa gratuita:** massimo 10 documenti, 10 articoli e 10 anagrafiche, senza fatturazione elettronica — [danea.it/professional](https://www.danea.it/software/easyfatt/professional/)
- **Easyfatt Cloud:** "prezzo fisso per licenza, da aggiungere al prezzo della tua licenza Easyfatt" — [danea.it/cloud](https://www.danea.it/software/easyfatt/cloud/). Un concorrente (Software Semplice) indica Professional Cloud a **420 € + IVA/anno (35 €/mese)** monoutente; il dato non è verificato sul listino Danea — [softwaresemplice.it](https://www.softwaresemplice.it/blog/alternativa-a-easyfatt/1213)
- **Contabilità in Cloud (partita doppia, add-on opzionale):** prezzo oggi non leggibile ("€ _ /mese"). Una scheda di circa 6 anni fa indicava **19 €/mese fino a 50.000 transazioni**, contate come righe del libro giornale in un anno (in media 4 per fattura di vendita) — [danea.it/contabilita](https://www.danea.it/software/easyfatt/contabilita/)
- **Pagamenti con TS Pay:** integrazione "inclusa in tutte le licenze Easyfatt"; il canone TS Pay è a parte e il suo importo non è stato trovato — [danea.it/ts-pay](https://www.danea.it/software/easyfatt/ts-pay/)

### Inferences
- Il modello commerciale è passato da "licenza perpetua + Support Plan annuale" (box retail) a un **abbonamento annuale de facto**. Per ottenere ricavi in più si usano le **soglie di volume** sulle fatture elettroniche e gli add-on: Cloud, Contabilità in Cloud, TS Pay.
- La soglia conta anche le fatture **ricevute**. Una PMI con molti acquisti supera presto 400, quindi il "prezzo reale" dipende dal volume passivo. Un clone può differenziarsi con fatture illimitate o con soglie solo sulle emesse.
- I segnali che la Standard non sia più vendibile ai nuovi clienti sono tre: definita "vecchia", assente dalle tabelle 2026 di terze parti, ultimo prezzo 8 €/mese nel 2022. Non è confermato.

### Gaps
- Il listino ufficiale 2026 non è stato letto direttamente (danea.it bloccato). Restano incerti: prezzo esatto di Enterprise (35, 40 o 420/480 €/anno?), prezzo di rinnovo vs primo acquisto, eventuale costo del pacchetto soglia aggiuntiva.
- Non trovati: prezzo ufficiale di Easyfatt Cloud per edizione, canone TS Pay, prezzo attuale di Contabilità in Cloud.
- Non verificato se esista ancora una vera licenza perpetua (ultimo box retail) senza abbonamento.
- Non chiaro cosa succeda esattamente al superamento della soglia (blocco invio o solo richiesta di upgrade). Un estratto Danea dice che "il software continuerà a rimanere installato e utilizzabile in versione dimostrativa", ma il contesto (scadenza licenza o soglia?) è ambiguo.

## 2. Fatture attive (ciclo vendite)

### Takeaway
Easyfatt copre il ciclo attivo tipico italiano: preventivo, ordine, DDT, fattura (immediata o differita/accompagnatoria), proforma, nota di credito/debito, parcella e parcella d'acconto, autofattura. I documenti si "includono" in cascata. Ci sono numerazioni con sezionali, ritenuta d'acconto, Enasarco e una cassa previdenziale per archivio, bollo, invio allo SdI tramite intermediario TS Digital (codice M5UXCR1) e conservazione decennale inclusa. Il tipo documento elettronico (TD01/TD24 ecc.) viene dedotto in automatico ma si può forzare.

### Cited Findings
- **Tipi di documento:**
  - fatture e fatture accompagnatorie (con dati di trasporto);
  - proforma (non fiscali);
  - note di credito e di debito;
  - preventivi;
  - DDT (anche generato da un preventivo);
  - parcelle e parcelle d'acconto, anche come documenti elettronici.

  Fonti: [help.danea.it Term_Documento](https://help.danea.it/easyfatt/html/Term_Documento.htm), [danea.it/fatture/tipologie](https://www.danea.it/fatture/tipologie/), [danea.it/ddt](https://www.danea.it/software/easyfatt/ddt-documento-trasporto/), [blog codici FE](https://www.danea.it/blog/easyfatt-codici-fattura-elettronica/)
- **Inclusioni in cascata:** "un preventivo viene incluso in un ddt che a sua volta viene incluso in fattura" — [help.danea.it Term_Documento](https://help.danea.it/easyfatt/html/Term_Documento.htm)
- **Tipo documento SdI automatico:** di default la fattura parte come **TD24 (differita)** se include DDT, scontrini/ricevute di giorni precedenti o rapporti d'intervento, altrimenti come **TD01**. Si può forzare in "Proprietà fattura elettr." — [blog Danea codici FE](https://www.danea.it/blog/easyfatt-codici-fattura-elettronica/)
- **Numerazione e sezionali:**
  - campo "Numeraz." per scegliere la serie;
  - note di credito sulla stessa numerazione delle fatture (consigliato) o su una serie separata;
  - per le autofatture Danea consiglia un sezionale dedicato (es. "/AF").

  Fonti: [help.danea.it nota di credito](https://help.danea.it/easyfatt/Creare_una_nota_d_accredito.htm), [help.danea.it autofatture](https://help.danea.it/easyfatt/Autofatture_ed_integrazioni.htm)
- **Ritenute:**
  - **ritenuta d'acconto**;
  - **Enasarco**, gestita come "altra ritenuta" da attivare in Opzioni con aliquota e **massimale annuo**; per gli agenti nel regime dei minimi è l'unica ritenuta;
  - **cassa previdenziale** (avvocati, commercialisti…) configurata nel campo "Tipo cassa previdenziale" della FE, **una sola cassa per archivio**;
  - se contributo previdenziale e ritenuta d'acconto sono attivi, non si può disattivarne uno solo sulla singola riga.

  Fonti: [help.danea.it ritenute e contributi](https://help.danea.it/easyfatt/Ritenute_fiscali_e_contributi_previdenziali.htm), [help.danea.it Enasarco](https://help.danea.it/easyfatt/html/La_gestione_ENASARCO_per_gli_agenti_di_commercio.htm), [blog Danea ritenute/Enasarco](https://www.danea.it/blog/ritenuta-dacconto-ritenuta-enasarco-e-contributi-previdenziali-dalla-configurazione-allelaborazione-della-fattura-elettronica/)
- **Bollo:**
  - Easyfatt propone di inserire il bollo in fase di invio, stampa o chiusura del documento; soglia e importo si impostano in **Opzioni > Varie**;
  - in alternativa si aggiunge come riga di spesa o con il flag nella scheda FE;
  - sulle FE il bollo è "virtuale", versato periodicamente con F24 cumulativo.

  Fonti: [help.danea.it Bollo in fattura](https://help.danea.it/easyfatt/Bollo_in_fattura.htm), [help.danea.it creazione fattura](https://help.danea.it/easyfatt/Creazione_della_fattura.htm), [blog bollo forfettario](https://www.danea.it/blog/imposta-bollo-fattura-forfettario/)
- **Split payment, IVA per cassa, reverse charge, bollo nel DB:** lo schema del database Easyfatt ricostruito da terzi contiene in testata documento i campi:
  - `TotIvaSplitPaym`, `RevCharge`;
  - `IvaPerCassa` / `DescIvaPerCassa`;
  - `FE_Bollo`, `FE_TipoDoc`, `FE_Causale`;
  - `FE_Src_*` (fino a 3 documenti collegati con CIG/CUP/commessa) per i riferimenti PA;
  - `TotRitAcconto`, `PercRitAcconto`, `PercRitAcconto2`, `TotRitVarie`, `AnnoCompetenzaRitVarie`;
  - `ContrPrev_*` (cassa previdenziale).

  In anagrafica ci sono `FE_CodUfficio` (codice destinatario), `Pec`, `DichIntentoDefault` (dichiarazioni d'intento) — [easyfatt-db-connector, models.py (GitHub)](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **Invio allo SdI:** dalla sezione "Fatture Elettr.". Le inviate e ricevute si consultano in "Fatture Elettr. > Inviate/Ricevute"; i file XML ricevuti da PEC o altri canali in "Visualizza file fatture elettroniche e notifiche" — [danea.it supporto FE](https://www.danea.it/software/easyfatt/supporto/fatturazione-elettronica/). Il database ha una tabella `TAgyo` con stato del flusso: `Inviata`, `Stato`, `DescStato`, `DataOraStato`, `NumNotifiche`, `UltimaNotifica`, `IDSdi`, `DataArchiviazione` — [models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **Conservazione:** 10 anni inclusa tramite TS Digital; accesso gratuito del commercialista — [danea.it/fattura-elettronica](https://www.danea.it/software/easyfatt/fattura-elettronica/)
- **Clienti esteri e TD26:** il readme di febbraio 2026 cita la fatturazione verso clienti esteri con stabile organizzazione o rappresentante fiscale in Italia, un nuovo codice IVA e il tipo TD26 — [readme Easyfatt](https://www.danea.it/assistenza/readme.asp?codart=ef09). L'estratto associa TD26 alle "parcelle": è incoerente con le specifiche AdE (TD26 = cessione beni ammortizzabili/passaggi interni). Probabile errore di sintesi, da verificare.
- **Email e solleciti:** invio documenti via email da Professional in su — [danea.it/caratteristiche](https://www.danea.it/software/easyfatt/caratteristiche/). Il DB contiene `TEmailTemplate` e il flag anagrafico `DocViaEmail` — [models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **Layout e stampa:** il DB contiene `TReport` e, per tipo documento, `ReportTipoDoc`, `TitoloReport`, `NoteReport`, `NascondiTracciabilitaInStampa` — [models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **Tipi documento configurabili:** la tabella `TTipiDoc` ha flag che fanno da modello di "tipo documento" generico:
  - `Acq`, `Registraz`, `RegistroIva`, `UsaPagamento`, `UsaScadenzePagamento`, `UsaRitenute`;
  - `FattAcconto`, `NotaVariaz`, `UsaFattElettr`, `TipoDocComFatt`;
  - `IncludibileIn`, `CodNumeraz` / `ElencoNumeraz`, `BloccaModifiche`.

  I permessi utente sono per tipo documento, lettere A…W — [models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)

### Inferences
- Il modello dati è "documento unico": testata `TDocTestate`, righe `TDocRighe`, riepilogo IVA `TDocIva`, con il tipo in `TTipiDoc` guidato da flag. Vendite, acquisti, ordini e preventivi stanno nella stessa tabella e si distinguono per flag. È un pattern semplice da replicare.
- I campi `FE_Src_*` in testata (massimo 3 riferimenti) mostrano un limite strutturale: i DatiOrdineAcquisto/Contratto/Convenzione sono denormalizzati. Un clone dovrebbe usare una tabella figlia.
- Una sola cassa previdenziale per archivio è un limite per gli studi multi-professionali.

### Gaps
- Non verificati dalla documentazione: modalità esatta dello **split payment** (esistenza dedotta dal campo DB `TotIvaSplitPaym`), personalizzazione del layout PDF (editor report? template?), ricevuta/scontrino non fiscale, gestione dell'**ordine cliente** (esiste `StatoOrdine` nel DB), autofattura **TD27** (autoconsumo/omaggi).
- Non trovato: come Easyfatt mostra le notifiche SdI (RC/NS/MC/DT) e gestisce gli scarti (reinvio con stesso numero?), salvo l'esistenza dei campi stato/notifiche.
- Non trovata una release note Danea sul recepimento delle **specifiche FatturaPA 1.9** (in vigore dall'1/4/2025: TD29, RF20) — [Aruba](https://www.aruba.it/magazine/fatturazione-elettronica/1-aprile-2025-nuove-specifiche-tecniche-per-la-fattura-elettronica.aspx). Un blog terzo cita un "tracciato 1.9.1 obbligatorio dal 15/5/2026", non verificato.

## 3. Fatture passive (ciclo acquisti)

### Takeaway
Le fatture passive arrivano dallo SdI direttamente in Easyfatt tramite TS Digital (codice destinatario **M5UXCR1**). Si scaricano con un clic in tutte le edizioni. La **registrazione negli acquisti** (funzione "Registra": crea/aggiorna fornitore, imponibili per aliquota, IVA, ritenute, scadenze) richiede però **Professional o superiore**. Le integrazioni reverse charge **TD16/TD17/TD18** si generano da una registrazione fornitore e si inviano allo SdI, sempre da Professional in su.

### Cited Findings
- **Ricezione:** si comunica ai fornitori il codice destinatario **M5UXCR1** e lo si registra come recapito predefinito nell'area riservata/cassetto fiscale dell'AdE; le FE "si scaricano direttamente in Easyfatt evitando la PEC". TS Digital gestisce la ricezione — [danea.it/fattura-elettronica](https://www.danea.it/software/easyfatt/fattura-elettronica/)
- **Scaricare vs registrare:** "con un clic dal software scarichi le fatture (qualsiasi versione di Easyfatt); con un altro clic le registri negli acquisti (solo Easyfatt versione Professional e superiori)" — [help.danea.it importazione FE d'acquisto](https://help.danea.it/easyfatt/Importazione_fatture_elettroniche_d_acquisto.htm)
- **Funzione "Registra":** dall'elenco ricevute crea o aggiorna l'anagrafica fornitore, registra imponibili per aliquota IVA, imposta e ritenute e genera le scadenze di pagamento. La registrazione si ritrova in **Documenti > Reg. fatture / Note accr. fornitori** — [help.danea.it registrare fatture fornitori](https://help.danea.it/easyfatt/html/Registrare_fatture_e_note_d_accredito_fornitori.htm), [help.danea.it importazione FE d'acquisto](https://help.danea.it/easyfatt/Importazione_fatture_elettroniche_d_acquisto.htm)
- **Registrazione contabile separata dal carico merce:** il carico di magazzino richiede un documento "Arrivo merce" a parte (fuori perimetro). I nomi prodotto delle fatture d'acquisto spesso non corrispondono all'anagrafica articoli — [blog Danea carico magazzino](https://www.danea.it/blog/carico-magazzino-documento-easyfatt/)
- **XML ricevuti fuori da Easyfatt** (PEC o altri canali): si visualizzano da "Fatture Elettr. > Visualizza file fatture elettroniche e notifiche" — [danea.it supporto FE](https://www.danea.it/software/easyfatt/supporto/fatturazione-elettronica/)
- **Reverse charge:**
  - con Professional, Enterprise One o Enterprise si inviano allo SdI **TD16, TD17, TD18**;
  - la fattura italiana in reverse charge (arrivata via SdI) si registra con "Registra" da Fatture elettroniche > Ricevute;
  - la fattura **estera** si registra a mano in "Documenti > Reg. fatture fornitore"; nella linguetta "Proprietà integrazione/autofattura elettr." si imposta TD17/TD18/TD19 (consentiti solo con fornitore estero o extra-UE senza P.IVA);
  - nel documento generato viene inserito automaticamente **DatiFattureCollegate (2.1.6)**, con numero e data o Id SdI;
  - le integrazioni si consultano in "Fatture elettroniche > Integrazioni e autofatture acquisti".

  Fonte: [help.danea.it integrazioni/autofatture](https://help.danea.it/easyfatt/Integrazioni_autofatture_elettroniche_per_acquisti_esteri_e_reverse_charge.htm)
- **Autofatture generiche:** tipo "Autofattura" da abilitare in Opzioni > Documento. L'"Autofattura ex art. 6 d.Lgs. 471/97" va usata solo per mancata o errata emissione del fornitore, non per le integrazioni — [help.danea.it Autofatture ed integrazioni](https://help.danea.it/easyfatt/Autofatture_ed_integrazioni.htm)
- **Ciclo passivo dal 2022:** articolo Danea dedicato ai cambiamenti — [blog Danea FE 2022 ciclo passivo](https://www.danea.it/blog/fattura-elettronica-2022-come-cambia-la-gestione-del-ciclo-passivo/)
- **Nel database:** la configurazione ha `DocT_Numeraz_AcqRevCharge` (numerazione dedicata agli acquisti in reverse charge). `TIva` ha `PercIvaIndetr` (IVA indetraibile) e `TDocIva.IvaDetr` — [models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **Data ricezione FE:** il readme del 14/04/2025 (ver. 2025.58d) aggiunge una colonna "data ricezione" per le FE — [readme Easyfatt](https://www.danea.it/assistenza/readme.asp?codart=ef09)

### Inferences
- La **registrazione automatica** dell'acquisto si ferma al livello "fornitore + castelletto IVA + scadenze". Non risulta un abbinamento automatico righe-articoli né una categorizzazione per conto di costo. Un clone potrebbe aggiungere mappatura automatica fornitore→conto/categoria e regole apprese.
- Il percorso per l'acquisto estero (registrazione manuale, poi integrazione TD17) è macchinoso: va semplificato.

### Gaps
- Non verificati:
  - import massivo di XML/P7M da cartella o ZIP, ad esempio dal cassetto fiscale (gli estratti parlano solo di visualizzazione);
  - integrazione diretta col **cassetto fiscale** per scaricare le fatture ricevute su altri canali;
  - supporto **TD19**: l'estratto la cita come impostabile, ma la lista delle edizioni dice "TD16-TD18";
  - supporto **TD29**.
- Non trovato come vengono gestite le note di credito ricevute (TD04) nello scadenzario.

## 4. Prima nota, scadenzario, banca, IVA ed export al commercialista

### Takeaway
La "Prima nota" di Easyfatt è un **registro di cassa e banca in partita semplice per "risorsa"** (cassa, banca, carta…), **non contabilità in partita doppia**. È alimentato in automatico dagli incassi e pagamenti dei documenti, con movimenti manuali e giroconti. La stessa tabella fa da **scadenzario**, con solleciti via email, WhatsApp o lettera e distinte RiBa (CBI), SDD e bonifici (SEPA XML). Da Professional in su ci sono **registri IVA, liquidazione e file LIPE**. La partita doppia si ottiene solo con l'add-on web **Contabilità in Cloud** (ex Reviso) o esportando al commercialista in formato **TeamSystem GeCom Multi / Lynfa Studio**.

### Cited Findings
- **Prima nota per risorsa:** "Con Easyfatt è possibile tenere la prima nota per ciascuna risorsa aziendale gestita e consultarne il saldo alla data interessata" — [danea.it blog news](https://www.danea.it/blog/danea-news/page/11), [blog compilare la prima nota](https://www.danea.it/blog/compilare-la-prima-nota/)
- **Alimentazione automatica e manuale:**
  - ogni movimento riporta risorsa (cassa, banca…), soggetto, documento che l'ha generato e modalità di pagamento;
  - movimenti manuali con **"Nuovo pagam."** (bolli, versamenti IVA, stipendi);
  - **giroconti** tra risorse con **"Nuovo giroc."**;
  - filtri per periodo, stato pagamento, risorsa e soggetto.

  Fonte: [danea.it/prima-nota](https://www.danea.it/software/easyfatt/prima-nota/)
- **"Riconciliazione" manuale:** "Filtrando i movimenti saldati per la risorsa 'Banca' è possibile confrontare l'estratto conto mensile o trimestrale… con l'elenco dei movimenti registrati" — [danea.it/prima-nota](https://www.danea.it/software/easyfatt/prima-nota/)
- **Struttura dati della prima nota (schema di terzi):**
  - la tabella `TPrimaNota` ha `IDPrimaNota`, `IDGiroconto`, `IDDoc` (FK documento), `IDDocPrev`, `IsAcconto`, `NomePagamDoc`, **`DataScad`**, **`DataPagam`**, `Risorsa` (FK `TRisorse`), **`CategPagamento`**, `Importo`, `IDAnagr`, `Desc`, `RifPagam`, **`Saldato`**, **`DataSollecito`**, `DescSollecito`, `ImportoIvaPerCassa`;
  - `TRisorse` ha `Risorsa`, `TipoRisorsa`, `SaldoIniziale`, `CoordBancarie`, `Sia`, `Cuc`, `CreditorId`, `TS_Conto`;
  - `TConti` ha `Conto`, `Predef`, `Rev_Conto` (mappatura verso il piano dei conti Reviso / Contabilità in Cloud);
  - `TPagamenti` (condizioni di pagamento) ha `Rate`, `SaldaSubito`, `NumGiorniDopoFineMese`, `SpostaFineAgostoDicembre`, `UsaTSPay`, `UsaPaypal`.

  Fonte: [easyfatt-db-connector models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **Solo fatturazione e prima nota:** Garda Informatica scrive che Easyfatt è "solamente un software di fatturazione e prima nota", senza vera contabilità — [gardainformatica.it pro e contro](https://www.gardainformatica.it/blog/consulenza/danea-easyfatt-pro-e-contro), [Garda Informatica fatture/DDT/contabilità](https://www.gardainformatica.it/blog/consulenza/fatture-ddt-contabilita-piccola-impresa-libero-professionista)
- **Scadenzario e solleciti:** scadenze evidenziate a colori; solleciti via **email, WhatsApp o lettera** con modelli predefiniti o personalizzati — [danea.it/gestione-pagamenti](https://www.danea.it/software/easyfatt/gestione-pagamenti/). TeamSystem lo presenta come "Prima nota, scadenzario e solleciti di pagamento. Grazie all'integrazione con TS Pay, incassi dai clienti ed emetti ordini di bonifico ai fornitori" — [teamsystem.com Easyfatt](https://www.teamsystem.com/easyfatt-artigiano-microimpresa/)
- **Distinte bancarie:**
  - **RiBa in formato CBI** (serve il codice SIA);
  - **SDD e bonifici in formato SEPA** (servono CUC e, per SDD, il Creditor Identifier);
  - si configurano in Pagamenti > Impostazione banche e risorse;
  - si esportano con "Emetti RiBa/SDD" o "Distinta bonifici".

  Fonte: [help.danea.it Emissione RiBa, SDD e bonifici](https://help.danea.it/easyfatt/html/Emissione_pagamenti.htm). Il readme del 20/08/2026 (ver. 2026.59) ha adeguato l'export di bonifici e SDD ai **nuovi tracciati in vigore dal 15/11/2026**; il CID dell'SDD non viene più calcolato da P.IVA/CF e va impostato a mano — [readme Easyfatt](https://www.danea.it/assistenza/readme.asp?codart=ef09)
- **TS Pay (open banking TeamSystem):**
  - integrazione "prevista per tutte le versioni di Easyfatt": **riconciliazione bancaria**, incasso digitale delle rate, ordini di pagamento dal gestionale — [danea.it/ts-pay](https://www.danea.it/software/easyfatt/ts-pay/);
  - readme 14/04/2025 (2025.58d): pagamenti con bonifico tramite TeamSystem Pay — [readme](https://www.danea.it/assistenza/readme.asp?codart=ef09);
  - in TS Pay la riconciliazione confronta le righe dell'estratto conto con i movimenti per importo, data e descrizione, marca "riconciliato automaticamente" e segnala le eccezioni (es. interessi) — [teamsystem magazine](https://www.teamsystem.com/magazine/gestione-dello-studio/riconciliazione-estratti-conto-bancari/);
  - sul prodotto gemello Fatture in Cloud, i documenti pagati via TS Pay si riconciliano e generano la prima nota in automatico, con 60 giorni gratuiti — [fattureincloud.it riconciliazione](https://www.fattureincloud.it/software-fatturazione/riconciliazione/).
- **Registri IVA e liquidazione** (Professional, Enterprise One, Enterprise):
  - percorso **Strumenti > Registri e liquidazione Iva**;
  - liquidazione mensile o trimestrale, riepilogo annuale;
  - registri **per sezionale**;
  - numerazione pagine con prima pagina impostabile;
  - generazione dell'**XML della Comunicazione liquidazioni periodiche (LIPE)**;
  - **non gestisce** regime del margine né IVA non esposta (N5).

  Fonti: [help.danea.it Registri e liquidazione Iva](https://help.danea.it/easyfatt/html/Registri_e_Liquidazione_Iva.htm), [help.danea.it Comunicazione liquidazioni](https://help.danea.it/easyfatt/Comunicazione_liquidazioni_Iva.htm), [blog Danea registri/LIPE](https://www.danea.it/blog/registri-liquidazioni-iva-easyfatt/)
- **Export al commercialista:**
  - formato **TeamSystem GeCom Multi / LYNFA Studio** oppure **PDF**, via email o file;
  - menu Strumenti > Invio fatture a commercialista (GeCom/Pdf) > Configura (email del commercialista, **codice ditta GeCom**, tabelle di conversione dei conti di vendita), da abilitare in Opzioni > Moduli;
  - richiede Professional o superiore;
  - per le FE il commercialista accede **gratis a TS Digital** o le riceve per email.

  Fonti: [help.danea.it Esportazione fatture su TeamSystem Multi o Pdf](https://help.danea.it/easyfatt/Esportare_dati_vs_Commercialisti.htm), [danea.it invia fatture commercialista](https://www.danea.it/software/easyfatt/invia-fatture-commercialista/), [help Invio dati formato TeamSystem](https://www.danea.it/software/easyfatt/help/Invio_dati_formato_TeamSystem_Gecom_Multi.htm). Il DB ha i parametri `TS_CodDitta`, `TS_ContabSemplific`, `TS_ExportPagamImmediati`, `TS_ExportScadenzePagam`, `ExportComm_Email`, `ExportComm_EmailIsPec`, `ExportCommPdf_Enabled` — [models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **Contabilità in Cloud (TeamSystem, ex Reviso):**
  - modulo web opzionale per Professional, Enterprise One ed Enterprise;
  - riceve da Easyfatt le registrazioni delle fatture di vendita e acquisto e lo scadenzario;
  - offre contabilità generale in **partita doppia**, mastrini, **riconciliazione bancaria da CSV**, situazione economica e patrimoniale, cespiti, collegamento col commercialista.

  Fonti: [danea.it/contabilita](https://www.danea.it/software/easyfatt/contabilita/), [blog 4 step](https://www.danea.it/blog/integrazione-easyfatt-contabilita-in-cloud-come-iniziare/), [help.danea.it "Reviso.htm"](https://help.danea.it/easyfatt/Reviso.htm), [help export verso Contabilità in Cloud](https://help.danea.it/easyfatt/Esportare_i_dati_da_Easyfatt_a_Reviso.htm)
- **Import nei software dei commercialisti:**
  - **GBsoftware** importa i file **.eft** di Danea nella propria prima nota — [guidegbsoftware.it](https://guidegbsoftware.it/contabilita/prima-nota/importazione-danea-easyfatt/);
  - **Atlantis Evo** ha un plug-in che legge da XML le fatture e note di credito Easyfatt e le registra — [atlantisevo.com](https://www.atlantisevo.com/contabilizzazione-automatica-fatture-vendita-da-danea/);
  - H2 Software ha una procedura di importazione — [h2software](https://h2softwaresrl.freshdesk.com/support/solutions/articles/5000617402-importazione-fatture-danea-easyfatt).

### Inferences
- **Non è partita doppia.** La prima nota è di fatto la tabella delle rate e scadenze (`TPrimaNota`) con data di pagamento, flag "saldato" e risorsa: scadenzario e prima nota sono **la stessa entità**, una rata saldata diventa un movimento. Le "categorie" (`CategPagamento`, `TConti`) sono etichette, non conti di un piano con dare/avere. Per un clone conviene lo stesso modello semplice per l'utente, con sotto un vero journal a doppia entrata opzionale: è ciò che gli utenti cercano e oggi pagano a parte con Contabilità in Cloud.
- La riconciliazione nativa è un **confronto visivo**. La vera riconciliazione automatica passa dal servizio a pagamento TS Pay (PSD2) o da Contabilità in Cloud (CSV). Non risulta un import nativo di CBI/CAMT/CSV dell'estratto conto nella prima nota: è un punto di miglioramento ovvio.
- L'export al commercialista è legato all'ecosistema TeamSystem (GeCom Multi / Lynfa, TS Digital). Per commercialisti con altri software (Zucchetti, Profis, GB…) restano XML FatturaPA, PDF o import di terzi del file .eft.

### Gaps
- Non trovati da fonte primaria: report "bilancino" o statistiche di prima nota (entrate/uscite per categoria/conto), export prima nota in CSV/Excel, import estratto conto (CBI/CAMT/CSV) nella prima nota nativa, versamenti F24 o calcolo dell'IVA da versare oltre la stampa della liquidazione.
- Non verificato se i movimenti TS Pay generino **automaticamente** movimenti nella prima nota di Easyfatt (lo fa Fatture in Cloud; per Easyfatt nessuna fonte esplicita).

## 5. Architettura, database, multiutenza, cloud, Mac, backup e sicurezza

### Takeaway
Easyfatt è un'applicazione **desktop Windows** con un **database Firebird** (file **.eft**, motore embedded 2.5.x secondo terzi), che dalla versione **2017.36** ha sostituito Access. La multiutenza è solo nell'edizione **Enterprise**: fino a 5 utenti in **LAN Windows**, con l'archivio su un disco **locale** del PC "server". Non sono ammessi percorsi di rete o NAS; per le sedi remote serve il desktop remoto. Danea **vieta di tenere l'archivio di lavoro in Dropbox, OneDrive o Google Drive**; ammette lì solo le copie di sicurezza. Da inizio 2026 esiste **Easyfatt Cloud**, versione via browser con canone aggiuntivo e limiti di dimensione. Mac solo tramite virtualizzazione o Easyfatt Cloud.

### Cited Findings
- **Da Access a Firebird:** con la versione ~**2017.36** "Easyfatt passa da un sistema con accesso diretto al file (database in formato Access) ad un sistema con accesso SQL (database in formato Firebird)". Obiettivi dichiarati: più velocità in multiutenza e meno rischio di corruzione su reti instabili. Lo stesso post indica i **NAS** come OK in monoutenza ma **non** in multiutenza — [blog Danea novità DB](https://www.danea.it/blog/danea-easyfatt-novita-db/)
- **Dettagli tecnici del file (fonte di terzi, PyPI v0.3.2, 13/09/2023):**
  - per collegarsi al DB serve il driver **Firebird embedded 2.5.8 o 2.5.9**;
  - l'archivio è un file `NOME.eft` apribile con `isql ... -u sysdba -p masterkey`;
  - il connettore copia il DB in una cartella temporanea per poter leggere mentre Easyfatt è aperto;
  - i file di export documenti hanno estensione **`.DefXml`**.

  Fonte: [PyPI easyfatt-db-connector](https://pypi.org/project/easyfatt-db-connector/)
- **Tabelle principali (sqlacodegen su un archivio di test):** `TAnagrafica`, `TAnagraficaDest`, `TAnagraficaContatti`, `TDocTestate`, `TDocRighe`, `TDocIva`, `TTipiDoc`, `TIva`, `TPagamenti`, `TPrimaNota`, `TRisorse`, `TConti`, `TContiVend`, `TTrattenute`, `TSpese`, `TAgyo` (flussi SdI), `TUtenti`, `TLogUtenti`, `TLocks`, `TConfig`, `TEmailTemplate`, `TReport`, `TArticoli*`, `TMagazz`, `TMovMagazz`, `TListini`, `TAgenti`, `TEcommUpload`, `TEcrConfig` — [models.py su GitHub](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **Accesso esterno in multiutenza:** un forum riporta che per collegarsi a un .eft condiviso serve la stringa `<IP del server>/31976:<percorso>`; con Easyfatt chiuso funziona `localhost` — [iprogrammatori.it](https://www.iprogrammatori.it/forum-programmazione/vbnet/connessione-in-multiutenza-database-firebird-in-vbdotnet-t54032.html). Il dato è aneddotico: porta Firebird non standard **31976** (inferenza).
- **Regole della multiutenza** (help ufficiale):
  - "Easyfatt in versione Enterprise può lavorare in rete locale Windows (LAN), dando a più utenti la possibilità di accedere contemporaneamente allo stesso archivio";
  - il PC che condivide l'archivio deve averlo su "un disco fisso locale"; "non è quindi possibile condividere archivi posizionati in percorsi di rete";
  - per le sedi non in LAN serve il "desktop remoto".

  Fonti: [help.danea.it multiutenza](https://help.danea.it/easyfatt/html/Si_pu_usare_EasyFatt_in_rete_da_pi_computer_.htm), [blog lavorare da sede secondaria](https://www.danea.it/blog/lavorare-da-casa-con-easyfatt/)
- **Limite utenti:** fino a **5 postazioni** (Enterprise) — [danea.it/enterprise-multiutente](https://www.danea.it/software/easyfatt/enterprise-multiutente/)
- **Cloud sync e backup:**
  - "archivio su cartella sincronizzata in cloud > **Da non fare!** (si rischia il danneggiamento del file)";
  - consigliato invece salvare le **copie di sicurezza** in una cartella Dropbox, Google Drive o OneDrive (Gestione archivi > Copie di sicurezza > Impostazioni).

  Fonti: [help.danea.it copie di sicurezza](https://help.danea.it/easyfatt/html/Archivi_Copie_di_sicurezza.htm), [blog copie di sicurezza](https://www.danea.it/blog/copie-di-sicurezza-quali-sono-le-funzioni-utili-alla-corretta-salvaguardia-dei-dati-gestiti-in-easyfatt/). Il DB tiene contatori di manutenzione come `ManArc_DataUltimoBackup`, `ManArc_DataUltimaCompress`, `ManArc_NumAvviiDaUltimoBackup` — [models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **Easyfatt Cloud** (lanciato nei **primi giorni del 2026**):
  - versione online usabile da browser su qualsiasi PC, senza installazione e senza vincoli di sistema operativo; aggiornamenti automatici e backup inclusi;
  - i clienti desktop possono trasferire l'archivio; si acquista da Area Cliente o in fase di rinnovo;
  - **non si possono usare insieme** Cloud e installazione locale (copie disallineate);
  - **limitazioni:** niente stampanti per etichette, niente integrazioni non ufficiali, archivi con **più di 20.000 prodotti o 40.000 documenti** esclusi; Enterprise fino a 5 utenti.

  Fonti: [blog "arriva Easyfatt Cloud"](https://www.danea.it/blog/arriva-easyfatt-cloud/), [danea.it/cloud](https://www.danea.it/software/easyfatt/cloud/), [help.danea.it Easyfatt Cloud](https://help.danea.it/easyfatt/Easyfatt_Cloud.htm), [help trasferire archivio in Cloud](https://help.danea.it/easyfatt/Trasferire_l_archivio_aziendale_in_Easyfatt_Cloud.htm). Il readme 2026.59 (20/08/2026) ha "semplificato il caricamento di file dal proprio PC" in Cloud, ora tramite la finestra standard del browser — [readme](https://www.danea.it/assistenza/readme.asp?codart=ef09)
- **Hosting di terze parti:** esistono servizi come CloudRemote (danearemote.it) e CloudDanea, con costo per utente concorrente e attivazione; alcuni pacchetti Windows Server richiedono Enterprise — [danearemote.it](https://danearemote.it/), [mondo-informatica.it/clouddanea](https://www.mondo-informatica.it/clouddanea), [lospotdigitale.net](https://www.lospotdigitale.net/en/danea-easyfatt-in-cloud/)
- **Mac:** nessuna versione nativa. La pagina Danea, a proposito dei registratori di cassa, rimanda a emulatori come Parallels o VMware — [danea.it/easyfatt](https://www.danea.it/software/easyfatt/). CodeWeavers elenca Easyfatt 2014.29c per CrossOver, senza rating — [codeweavers.com](https://www.codeweavers.com/compatibility/crossover/easyfatt-201429c). Easyfatt Cloud si usa da browser su qualsiasi OS — [danea.it/cloud](https://www.danea.it/software/easyfatt/cloud/)
- **Utenti e permessi:** Enterprise ha "diritti utente configurabili" — [danea.it/caratteristiche](https://www.danea.it/software/easyfatt/caratteristiche/). Nello schema DB:
  - `TUtenti` ha `Login`, `Password`, `DataCambioPassword`, `Sospeso`, `Amministratore`, restrizioni per agente/magazzino, flag `AccessoPrezziAcq`, `AccessoExport`, `AccessoClienti(Write)`, `AccessoForn(Write)`, `AccessoElencoPagam`, `AccessoAnalisi`, `AccessoStrRegistriIva`, `AccessoTblConti`… e permessi **lettura/scrittura per ciascun tipo documento** (`AccessoDocA..W`, `AccessoDocWriteA..W`);
  - `TConfig` ha `GestAcc_MesiCambioPassword`, `GestAcc_MesiSospensUtente`, `GestAcc_PasswordSicure`, `GestAcc_LogSeed`, oltre a `ManArc_Password` (password archivio);
  - esistono `TLogUtenti` (log accessi) e `TLocks` (lock applicativi).

  Fonte: [models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **Aggiornamenti:** dal programma con "Controlla aggiornamenti"; numerazione versioni "anno.build", es. 2017.36, 2025.58c, 2025.58d, 2026.59 — [danea.it aggiornamenti](https://www.danea.it/software/easyfatt/supporto/aggiornamenti/), [readme](https://www.danea.it/assistenza/readme.asp?codart=ef09)

### Inferences
- **Sicurezza debole by design.** Il file .eft è un Firebird standard apribile con le credenziali di default (SYSDBA/masterkey) usate dal connettore di terzi, quindi verosimilmente **non cifrato a riposo**. La password d'archivio (`ManArc_Password`) e la gestione utenti sono controlli **applicativi**, aggirabili leggendo il file. Un clone può distinguersi con cifratura a riposo e autenticazione lato server.
- **Il "cloud" arriva tardi e con vincoli.** È un'aggiunta a pagamento con limiti di volume (20k prodotti / 40k documenti), incompatibile con l'uso locale. I limiti fanno pensare a un'infrastruttura di hosting dell'app esistente più che a un'app web nativa. È un'inferenza: la tecnologia non è dichiarata.
- La multiutenza è legata a LAN, PC server Windows sempre acceso, niente NAS e niente sync cloud. Per microimprese con titolare e commercialista/collaboratore remoti è l'attrito principale: un clone web-native multiutente risolve il problema alla radice.

### Gaps
- **Linguaggio di sviluppo** del client (Delphi? .NET?): nessuna fonte trovata. L'architettura client + Firebird embedded è compatibile con Delphi, ma non è verificata.
- Versione Firebird attuale (2.5 vs 3/4/5) nelle release 2025-2026: l'unica fonte (2023) indica 2.5.8/2.5.9.
- Tecnologia di Easyfatt Cloud (web app nativa o streaming dell'app desktop): non dichiarata nelle fonti trovate.
- Segnalazioni di corruzione degli archivi o problemi di multiutenza nei forum: non coperte, budget di ricerca esaurito. forum.danea.it non è stato consultato.
- Non trovata un'app mobile ufficiale Easyfatt per documenti e prima nota (vedi punto 6 per Danea Transfer).

## 6. Formati di import/export e integrazioni

### Takeaway
Easyfatt espone un formato proprietario documentato, **Easyfatt-Xml** (radice `EasyfattDocuments`, con XSD), usato soprattutto per e-commerce e integrazioni. Offre poi import/export **Excel/OpenOffice/LibreOffice** di clienti, fornitori e prodotti, l'export **TeamSystem GeCom Multi**, XML FatturaPA e distinte CBI/SEPA. L'ecosistema di connettori di terzi è ampio (Shopify, WebsiteX5, CRM, PMS, gestionali contabili).

### Cited Findings
- **Easyfatt-Xml:**
  - gerarchia `EasyfattDocuments` → `Document` → `Rows/Row` e `Payments/Payment`;
  - campi opzionali salvo diversa indicazione; decimali col punto; date ISO aaaa-mm-gg; UTF-8 con escape di &, <, >;
  - un tag assente prende il default (senza `Date` vale la data odierna, senza `Number` scatta la numerazione automatica); i totali calcolati sono ignorati in import;
  - `PaymentName` deve esistere già in Easyfatt;
  - esistono uno schema **XSD** ed esempi.

  Fonti: [danea.it/xml](https://www.danea.it/software/easyfatt/xml/), [tracciato documenti](https://www.danea.it/software/easyfatt/xml/documenti/), [note formato](https://www.danea.it/software/easyfatt/xml/formato/)
- **Import documenti:** da Documenti > Importa; il cliente si abbina per codice o "login web" e si può scegliere di ignorare i codici trasmessi — [help.danea.it Importazione dei documenti](https://help.danea.it/easyfatt/Importazione_dei_documenti.htm), [help trasferire documenti Easyfatt-Xml](https://help.danea.it/easyfatt/Trasferire_documenti_in_formato_Easyfatt-Xml.htm), [ricezione ordini e-commerce](https://www.danea.it/software/easyfatt/ecommerce/integrazione/ricezione-ordini/)
- **Export documenti:** file con estensione **.DefXml**; un parser Python legge ordini, vendite banco e preventivi esportati — [PyPI easyfatt-db-connector](https://pypi.org/project/easyfatt-db-connector/)
- **Excel / OpenOffice / LibreOffice:** import ed export di clienti, fornitori e prodotti — [danea.it funzionalità avanzate](https://www.danea.it/software/easyfatt/funzionalita-avanzate/). Guida alla migrazione da altri software — [help.danea.it Come passare a Easyfatt](https://help.danea.it/easyfatt/Come_passare_a_Danea_Easyfatt_da_un_altro_software.htm)
- **E-commerce:** sincronizzazione solo in **Enterprise One/Enterprise**. Connettori Shopify di terzi (GetSync, "Danea Easyfatt Import/Export") e integrazione WebsiteX5 — [apps.shopify.com GetSync](https://apps.shopify.com/getsync-per-easyfatt), [Shopify Import/Export](https://apps.shopify.com/danea-easyfatt-import-export), [helpcenter.websitex5.com](https://helpcenter.websitex5.com/en/post/34067)
- **Altre integrazioni:**
  - pagina ufficiale integrazioni — [danea.it/integrazioni](https://www.danea.it/software/easyfatt/integrazioni/);
  - CRM in Cloud — [help.crmincloud.it](https://help.crmincloud.it/it/article/come-configurare-lintegrazione-con-danea-easyfatt-lx2usc/);
  - PMS alberghiero Smartness — [smartness](https://pms-intool.smartness.com/integrations/danea-easyfatt);
  - Zotsell — [help.zotsell.com](https://help.zotsell.com/index.php/manuals/viewSections/743);
  - Magento (Shinesoftware) — [docs.easyfatt.shinesoftware.it](https://docs.easyfatt.shinesoftware.it/magento-1/errori-comuni);
  - visure camerali (readme 2025.58c) — [blog aggiornamento 2025.58c](https://www.danea.it/blog/aggiornamento-easyfatt-ver-2025-58/).

  Lo schema DB contiene flag per **Cerved** (controllo affidabilità), **PayPal** e "App Agenti" — [models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- **App "Danea Transfer" (solo iPhone):** fotografa documenti, anche multipagina, e li invia come PDF all'archivio Easyfatt come allegati; richiede il Support Plan attivo — [App Store Danea Transfer](https://apps.apple.com/mx/app/danea-transfer/id1183389551)
- **Fatture in Cloud:** Danea ha una FAQ sulla sincronizzazione tra Easyfatt e Fatture in Cloud (prodotto TeamSystem) per l'uso contemporaneo — [FAQ id=310](https://www.danea.it/software/easyfatt/supporto/faq/?id=310). La risposta esatta non è stata letta.

### Inferences
- Easyfatt-Xml è un buon riferimento per un formato di interscambio "documento + righe + rate". Un clone dovrebbe **importarlo**, per migrare clienti Danea, insieme al file .eft via Firebird (come già fanno GBsoftware e il connettore Python).
- Mancano API REST ufficiali (nessuna fonte ne cita): le integrazioni lavorano su file XML o leggendo direttamente il DB Firebird.

### Gaps
- Non trovati: un'API REST o webhook ufficiale, export CSV dei documenti o della prima nota, tracciato di import della prima nota.
- Non verificata la risposta della FAQ 310 (sync Easyfatt ↔ Fatture in Cloud).

## 7. Cosa apprezzano e cosa criticano gli utenti

### Takeaway
Gli utenti apprezzano **semplicità, completezza per la piccola impresa e affidabilità della fatturazione elettronica integrata**. Le critiche dominanti, soprattutto su Trustpilot, riguardano **aumenti di prezzo ripetuti**, **soglie di fatture che spingono all'upgrade** e un'**assistenza lenta e impersonale**. Si aggiungono, da fonti tecniche, l'assenza di vera contabilità e i vincoli di multiutenza e cloud.

### Cited Findings
- **Trustpilot (Danea Soft):** ~**440 recensioni**, in maggioranza negative. Temi ricorrenti: rincari ripetuti, limiti di volume delle fatture che spingono a piani più cari, assistenza lenta, impersonale e poco raggiungibile; pochi positivi sulla semplicità. Esempi: "200 € l'anno nel 2021, 250 € nel 2023"; costo della licenza "quasi decuplicato in 7 anni" — [it.trustpilot.com/review/danea.it](https://it.trustpilot.com/review/danea.it?page=2), [pag. 3](https://it.trustpilot.com/review/danea.it?page=3), [pag. 4](https://it.trustpilot.com/review/danea.it?page=4). Nota: i dati vengono dalla sintesi del motore di ricerca, senza date assolute delle recensioni.
- **Capterra:**
  - Italia: **3,7/5 su 60 recensioni**, assistenza clienti 3,4, rapporto qualità/prezzo 3,3 — [capterra.it confronto FiC vs Easyfatt](https://www.capterra.it/compare/199642/209315/fatture-in-cloud/vs/easyfatt);
  - scheda globale: 4,2, numero di recensioni riportato in modo non affidabile — [capterra.com](https://www.capterra.com/p/209315/Easyfatt/);
  - un recensore giudica "eccessivi" gli aumenti di costo — [capterra.com](https://www.capterra.com/p/209315/Easyfatt/).
- **Assenza di contabilità:** Easyfatt è "solamente" fatturazione e prima nota; la contabilità vera richiede altro software o il commercialista — [Garda Informatica pro e contro](https://www.gardainformatica.it/blog/consulenza/danea-easyfatt-pro-e-contro)
- **Base installata e posizionamento:** "il programma per fatture più usato dalle imprese italiane" (claim di un rivenditore) — [gestionaleideale.it](https://gestionaleideale.it/). All'acquisizione del 2012 Danea Soft aveva 23.000 clienti in abbonamento e oltre 72.000 licenze distribuite — [corrierecomunicazioni.it](https://www.corrierecomunicazioni.it/digital-economy/danea-soft-entra-nel-gruppo/)
- **Concorrenti che puntano sul confronto:** articoli "alternative a Easyfatt" di FidoCommercialista e Software Semplice sfruttano prezzo e cloud come leve — [fidocommercialista.it](https://fidocommercialista.it/migliori-alternative-a-danea-easyfatt), [softwaresemplice.it](https://www.softwaresemplice.it/blog/alternativa-a-easyfatt/1213), [centrofiscale.com](https://centrofiscale.com/software-fatturazione-alternative-teamsystem-danea/)

### Inferences
- Le critiche si concentrano sul **modello commerciale** dopo l'integrazione in TeamSystem (prezzi, soglie, add-on) più che sulla qualità funzionale del software. Un clone con prezzo trasparente, fatture illimitate o soglie solo sulle emesse e supporto reattivo attacca i punti dolenti principali.

### Gaps
- Non letti direttamente: forum.danea.it, Reddit e gruppi di commercialisti. Mancano testimonianze su corruzione degli archivi, lentezza su archivi grandi e problemi di multiutenza (budget di ricerca esaurito e siti bloccati).
- Non verificate date e versioni delle recensioni Trustpilot citate.

## 8. Storia societaria e novità recenti (2024-2026)

### Takeaway
Danea Soft (Padova, fondata nel ~1996) è nel gruppo **TeamSystem dal gennaio 2012**. Le novità 2025-2026 sono soprattutto **commerciali** (soglie di FE per edizione dal 2025-2026) e di **piattaforma**: Easyfatt Cloud a inizio 2026, integrazione con TS Pay per bonifici e riconciliazione dal 2025, visure camerali, adeguamenti normativi (tracciati SEPA 15/11/2026). **Nessuna funzione di IA** documentata.

### Cited Findings
- **Acquisizione da parte di TeamSystem (gennaio 2012):** Danea Soft era stata fondata a Padova 16 anni prima e aveva 23.000 clienti in abbonamento e oltre 72.000 licenze; prezzo non divulgato. Nel 2015 TeamSystem ha acquisito Madbit (Fatture in Cloud), oggi prodotto "fratello" — [corrierecomunicazioni.it](https://www.corrierecomunicazioni.it/digital-economy/danea-soft-entra-nel-gruppo/), [01net.it](https://www.01net.it/?p=145592), [teamsystem.com/acquisizioni](https://www.teamsystem.com/acquisizioni)
- **TeamSystem vende Easyfatt anche dal proprio sito** (segmento "artigiano / microimpresa") — [teamsystem.com Easyfatt](https://www.teamsystem.com/easyfatt-artigiano-microimpresa/)
- **Release recenti dal readme ufficiale:**
  - **2025.58c:** visure camerali — [blog](https://www.danea.it/blog/aggiornamento-easyfatt-ver-2025-58/);
  - **2025.58d (14/04/2025):** bonifici tramite TeamSystem Pay, colonna data ricezione FE;
  - **febbraio 2026:** aggiornamento elenco CAP, nuovi campi nella stampa pagamenti, nuovo codice IVA, clienti esteri con stabile organizzazione o rappresentante fiscale;
  - **2026.59 (20/08/2026):** fix di compatibilità con WPS Office, upload file in Easyfatt Cloud via finestra del browser, export bonifici/SDD per i tracciati in vigore dal 15/11/2026.

  Il readme mostra un'incongruenza: la voce di febbraio riporta anch'essa "2026.59". UpdateStar indica la 2026.59 come rilasciata il 21/05/2026 — [readme Easyfatt](https://www.danea.it/assistenza/readme.asp?codart=ef09), [updatestar](https://danea-easyfatt.updatestar.com/)
- **Easyfatt Cloud** lanciato "nei primi giorni del 2026", con webinar dedicato — [blog](https://www.danea.it/blog/arriva-easyfatt-cloud/), [webinar](https://www.danea.it/blog/webinar-easyfatt-cloud/), [pmi.it](https://www.pmi.it/impresa/business-e-project-management/494840/gestione-aziendale-easyfatt-software-semplice-completo-cloud.html)
- **Soglie FE:** Standard dall'1/1/2025; Professional ed Enterprise One dal primo rinnovo dopo l'1/12/2025 — [FAQ 598](https://www.danea.it/software/easyfatt/supporto/faq/?id=598), [FAQ 585](https://www.danea.it/software/easyfatt/supporto/faq/?id=585)
- **IA:** nessuna fonte attribuisce a Easyfatt funzioni di intelligenza artificiale (OCR, categorizzazione, assistente); le pagine trovate sono articoli generici di settore — [fattutto.com](https://www.fattutto.com/2026/01/07/intelligenza-artificiale-e-gestione-di-fatture-prima-nota-e-scadenziario-come-cambiera-nel-2026/), [blog Danea news Easyfatt](https://www.danea.it/blog/danea-news/easyfatt/)
- **Storico aggiornamenti** — [readme vecchie versioni](https://www.danea.it/assistenza/readme/old_ef.asp), [fabiobernini.it lista aggiornamenti](https://www.fabiobernini.it/lista-aggiornamenti-danea-easyfatt/)

### Inferences
- La roadmap di TeamSystem per Easyfatt punta a portare i clienti desktop dentro i servizi del gruppo (TS Digital, TS Pay, Contabilità in Cloud, Easyfatt Cloud) e a far pagare il volume, non a funzioni di IA. Lo spazio per un clone "AI-first" (OCR passive, categorizzazione automatica della prima nota, riconciliazione intelligente) è aperto.

### Gaps
- Non trovata una release note Danea esplicita sul supporto FatturaPA **1.9** (TD29, RF20; obbligatoria dall'1/4/2025) né su eventuali specifiche "1.9.1" del 2026.
- Non trovati annunci 2024-2026 su PSD2/open banking nativo diverso da TS Pay, né su un'app mobile Easyfatt per Android/iOS oltre a Danea Transfer.
