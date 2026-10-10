# Normativa IVA e contabile per gestionale fatturazione + prima nota — settore impianti FV / termici / elettrici / domotica / efficienza (Energenia Srl, Puglia) — stato al 10 ottobre 2026

**Legenda di affidabilità (da leggere prima di usare queste note).** Durante la sessione WebFetch non è riuscito a risolvere NESSUN dominio: agenziaentrate.gov.it, normattiva.it, ecnews.it, eutekne.info, fiscoetasse.com, informazionefiscale.it e ance.it hanno tutti restituito ENOTFOUND. Anche curl via proxy è stato rifiutato (403), e il budget WebSearch condiviso tra gli agenti si è esaurito dopo 8 ricerche. Ogni punto porta quindi una delle seguenti etichette:
- **[V]** = verificato in questa sessione tramite risultati di ricerca web, con la fonte (URL) indicata. Si tratta per lo più di fonti secondarie autorevoli, non del testo ufficiale.
- **[N]** = conoscenza normativa pregressa del modello (aggiornata a circa giugno 2026), con il riferimento alla fonte ufficiale (URN Normattiva o documento AdE), **non riletta in questa sessione**. Va confermata sul testo vigente prima di codificarla nel software.
- **[I]** = inferenza o proposta implementativa, non una regola di legge.

Le URN Normattiva usate come riferimento (formato standard, non aperte in sessione):
- DPR 633/72: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633
- DPR 600/73: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600
- Codice civile: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:regio.decreto:1942-03-16;262
- DPR 100/98: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1998-03-23;100
- DL 357/94: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:1994-06-10;357
- DL 78/2010: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:2010-05-31;78
- DL 83/2012: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:2012-06-22;83
- L. 488/1999: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:1999-12-23;488
- TUIR DPR 917/86: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1986-12-22;917
- D.Lgs. 231/2007: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2007-11-21;231
- L. 199/2025 (Bilancio 2026): https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2025-12-30;199
- L. 213/2023 (Bilancio 2024): https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2023-12-30;213
- L. 205/2017: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2017-12-27;205
- DPR 322/98: https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1998-07-22;322

Fuori perimetro (coperti da un altro ricercatore): formato tecnico SdI, notifiche, conservazione sostitutiva come processo tecnico, imposta di bollo sulle fatture.

---

## A1. Regime contabile di una SRL, libri obbligatori e ruolo della "prima nota"

### Takeaway
Una SRL è sempre in contabilità ordinaria, a prescindere dai ricavi. La contabilità semplificata e il regime "di cassa" (art. 18 DPR 600/73, art. 66 TUIR) valgono solo per persone fisiche e società di persone. Sono obbligatori libro giornale, libro inventari, registri IVA, scritture ausiliarie (mastri) e registro dei beni ammortizzabili (o annotazioni equivalenti); le scritture di magazzino servono solo sopra soglia. La "prima nota" non è un libro previsto dalla legge: è uno strumento interno di lavoro. Nel software va modellata come registrazione provvisoria che, una volta "consolidata", genera il libro giornale (numerato e non modificabile).

### Cited Findings
- [N] L'art. 13 c.1 lett. a) DPR 600/73 obbliga alle scritture contabili "le società soggette all'imposta sul reddito delle persone giuridiche" (quindi le SRL). L'art. 18 (contabilità semplificata) si applica solo a imprese individuali, società di persone ed enti non commerciali sotto le soglie di ricavi (€500.000 servizi / €800.000 altre attività dal 2023), quindi mai a una SRL — [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600)
- [N] Scritture obbligatorie per chi è in contabilità ordinaria (art. 14 DPR 600/73):
  - a) libro giornale e libro inventari;
  - b) registri IVA;
  - c) scritture ausiliarie (conti di mastro) con gli elementi patrimoniali e reddituali raggruppati per categorie omogenee;
  - d) scritture ausiliarie di magazzino, obbligatorie solo dal secondo esercizio successivo a quello in cui, per la seconda volta consecutiva, ricavi > €5.164.568,99 **e** rimanenze > €1.032.913,80 (DPR 695/1996);
  - e) registro dei beni ammortizzabili (art. 16) — [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600)
- [N] Codice civile:
  - art. 2214: l'imprenditore commerciale tiene libro giornale e libro inventari, più le altre scritture richieste dalla natura e dalle dimensioni dell'impresa;
  - art. 2216: il giornale indica "giorno per giorno" le operazioni;
  - art. 2219: "ordinata contabilità", senza spazi in bianco, interlinee o abrasioni; le cancellazioni devono restare leggibili;
  - art. 2215-bis: per i libri tenuti con strumenti informatici, numerazione e vidimazione si assolvono con marca temporale e firma digitale almeno una volta l'anno — [Normattiva Codice civile](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:regio.decreto:1942-03-16;262)
- [N] Libri sociali della SRL (art. 2478 c.c.): libro delle decisioni dei soci, libro delle decisioni degli amministratori, libro del collegio sindacale/revisore se nominato. Il libro soci delle SRL è stato abolito dal DL 185/2008. Sono fuori dal perimetro del gestionale contabile, ma vanno ricordati — [Normattiva Codice civile](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:regio.decreto:1942-03-16;262)
- [N] Bollatura e vidimazione di libro giornale e inventari sono abolite dal 2001 (L. 383/2001); resta la numerazione progressiva. Sui libri (giornale, inventari) resta dovuta l'imposta di bollo: per le società di capitali €16 ogni 100 pagine, per i libri informatici versata con F24 (cod. 2501) entro 120 giorni dalla chiusura dell'esercizio. La SRL paga anche la tassa annuale di concessione governativa per la numerazione dei libri sociali (€309,87, oppure €516,46 se il capitale supera €516.456,90). I registri IVA non sono soggetti a bollo — [Normattiva Codice civile](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:regio.decreto:1942-03-16;262) *(importi e codice non riverificati in sessione)*

### Inferences
- [I] Modello dati proposto:
  - `RegistrazionePrimaNota` (stato BOZZA / CONFERMATA);
  - `LibroGiornale` (righe numerate per esercizio, con numero di pagina e di riga, generato dalla stampa o chiusura definitiva del periodo).
- [I] Dopo la "stampa definitiva" del giornale nessuna modifica o cancellazione: solo scritture di storno/rettifica. Questo traduce l'art. 2219 c.c. nel software.
- [I] I mastri (art. 14 lett. c) coincidono con il piano dei conti del software: ogni registrazione deve alimentare in doppia partita giornale e mastri.
- [I] Il registro beni ammortizzabili può essere una vista del modulo cespiti, purché contenga per ogni bene (o categoria omogenea per anno) costo, coefficiente, quota annua e fondo. L'art. 16 DPR 600/73 ammette anche l'annotazione nel libro inventari.
- [I] Le scritture di magazzino fiscali per Energenia sono quasi certamente non obbligatorie (soglie alte). Resta utile una gestione magazzino per la valutazione delle rimanenze e dei lavori in corso a fine esercizio.

### Gaps
- Non ho potuto rileggere il testo vigente degli artt. 13, 14, 16, 18 DPR 600/73 né gli importi della tassa di concessione governativa o dell'imposta di bollo sui libri.
- Non è verificato se nel 2026 ci siano state modifiche alle soglie della semplificata (non pertinenti per una SRL, ma pertinenti per le soglie della liquidazione trimestrale: vedi A4).

---

## A2. Tempistiche di registrazione: libro giornale, registri IVA, cespiti, inventario

### Takeaway
- Libro giornale e mastri: registrazione entro 60 giorni dall'operazione.
- Fatture emesse: annotazione nel registro IVA entro il 15 del mese successivo, con riferimento al mese di effettuazione.
- Fatture d'acquisto: annotazione prima della liquidazione in cui si detrae e comunque entro il termine della dichiarazione IVA dell'anno di ricezione.
- Inventario e registro cespiti: entro i termini della dichiarazione dei redditi (inventario sottoscritto entro 3 mesi da quel termine).

### Cited Findings
- [N] Art. 22 c.1 DPR 600/73: le registrazioni nelle scritture cronologiche (giornale) e nei conti di mastro vanno eseguite "non oltre sessanta giorni" — [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600)
- [N] Art. 23 DPR 633/72 (testo modificato dal DL 119/2018): le fatture emesse si annotano "nell'ordine della loro numerazione, entro il giorno 15 del mese successivo a quello di effettuazione delle operazioni e con riferimento allo stesso mese di effettuazione". Dati da annotare: numero, data, ammontare imponibile, aliquota, imposta, ditta o denominazione del cliente; per le operazioni non imponibili o esenti, il titolo e la norma — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)
- [N] Art. 25 DPR 633/72: le fatture d'acquisto si annotano "anteriormente alla liquidazione periodica nella quale è esercitato il diritto alla detrazione… e comunque entro il termine di presentazione della dichiarazione annuale relativa all'anno di ricezione della fattura e con riferimento al medesimo anno" — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)
- [N] Libro inventari (art. 15 DPR 600/73): redatto e sottoscritto dal legale rappresentante entro 3 mesi dal termine di presentazione della dichiarazione dei redditi. Per una SRL con esercizio solare e Redditi SC al 31 ottobre, il termine cade a fine gennaio di N+2 — [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600)
- [N] Registro beni ammortizzabili (art. 16 DPR 600/73): annotazioni entro il termine di presentazione della dichiarazione dei redditi — [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600)

### Inferences
- [I] Controlli bloccanti o warning da implementare:
  - (1) data registrazione − data operazione > 60 gg → warning "art. 22 DPR 600/73";
  - (2) fattura emessa con mese di effettuazione M non annotata entro il 15/M+1 → errore;
  - (3) fattura passiva non registrata oltre il 30/4 di N+1 (ricevuta nell'anno N) → detrazione persa → warning bloccante.
- [I] Per la fattura differita (DDT del mese M, fattura emessa entro il 15/M+1) il software deve imputare l'operazione al mese M per il registro e la liquidazione, anche se la data documento è di M+1.

### Gaps
- Per Redditi SC il termine resta al 31 ottobre secondo le mie conoscenze. Non ho verificato eventuali spostamenti introdotti dai decreti attuativi della riforma fiscale (D.Lgs. 1/2024 e successivi).

---

## A3. Registri IVA: contenuto, protocollo delle passive, tenuta elettronica, obbligo di stampa

### Takeaway
I registri IVA (vendite, acquisti, eventuali sezionali) possono essere tenuti solo in forma elettronica, senza stampa: sono regolari se aggiornati e stampati su richiesta dei verificatori. Se non stampati, vanno messi in conservazione digitale entro 3 mesi dal termine della dichiarazione dei redditi. Il protocollo progressivo delle fatture passive non è più strettamente obbligatorio dopo il DL 119/2018 (l'identificativo SdI identifica la fattura), ma resta consigliato. Le fatture in reverse charge ricevute vanno integrate e annotate in entrambi i registri.

### Cited Findings
- [N] Art. 7 c.4-quater DL 357/1994, esteso a "qualsiasi registro contabile" dal DL 34/2019 (art. 12-octies): la tenuta con sistemi elettronici su qualsiasi supporto "è, in ogni caso, considerata regolare in difetto di trascrizione su supporti cartacei… se in sede di accesso, ispezione o verifica gli stessi risultano aggiornati sui predetti sistemi elettronici e vengono stampati a seguito della richiesta avanzata dagli organi procedenti ed in loro presenza" — [Normattiva DL 357/94](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:1994-06-10;357)
- [N] Art. 7 c.4-ter DL 357/1994: i registri meccanografici sono regolari se stampati (o conservati digitalmente) entro 3 mesi dal termine di presentazione delle dichiarazioni annuali. Esempio: esercizio 2025 → Redditi 31/10/2026 → entro 31/1/2027 — [Normattiva DL 357/94](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:1994-06-10;357)
- [N] DL 119/2018 (art. 13 o 14, modifiche agli artt. 23 e 25 DPR 633/72) ha eliminato l'obbligo di numerare progressivamente le fatture d'acquisto, perché la fattura elettronica è identificata univocamente dallo SdI. La circ. AdE 14/E/2019 ha chiarito che resta possibile un protocollo interno o l'uso dell'identificativo SdI — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633) *(attribuzione esatta all'articolo del DL 119/2018 non riverificata)*
- [N] Reverse charge interno (art. 17 c.5-6 DPR 633/72, con rinvio all'art. 23): il committente integra la fattura con aliquota e imposta e la annota nel registro vendite entro il mese di ricevimento, o comunque entro 15 giorni dal ricevimento e con riferimento a quel mese. La annota anche nel registro acquisti ai fini della detrazione — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)
- [N] Art. 39 DPR 633/72: registri e documenti si conservano secondo l'art. 22 DPR 600/73 — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)

### Inferences
- [I] Campi minimi di una riga del registro IVA acquisti:
  - protocollo interno (consigliato, progressivo per anno e sezionale);
  - identificativo SdI;
  - numero e data documento del fornitore;
  - data di ricezione SdI;
  - data registrazione;
  - periodo IVA di detrazione (mese/trimestre);
  - fornitore (P.IVA/CF);
  - per ogni aliquota o natura: imponibile, IVA, % di detraibilità, IVA detraibile e indetraibile;
  - flag reverse charge con collegamento all'autofattura o integrazione (TD16/TD17/TD18/TD19);
  - flag split payment, flag IVA per cassa.
- [I] Sezionali consigliati per Energenia:
  - vendite ordinarie;
  - vendite in reverse charge;
  - vendite split payment;
  - autofatture/integrazioni RC;
  - acquisti;
  - acquisti RC (sezionale gemello per le integrazioni);
  - acquisti intra/extra UE.
- [I] Funzione "stampa registro su richiesta" da avere sempre pronta: PDF con numerazione pagine per anno, che soddisfa la condizione dell'art. 7 c.4-quater.

### Gaps
- Testo esatto dei commi 4-ter e 4-quater dopo le modifiche del 2019 e del 2022 non riletto.
- Non verificato se il D.Lgs. di riordino IVA (Testo unico, vedi B8) rinumeri gli artt. 23 e 25 dal 2027.

---

## A4. Liquidazioni IVA periodiche, acconto, LIPE, dichiarazione annuale, servizi precompilati AdE

### Takeaway
- Liquidazione mensile entro il 16 del mese successivo, oppure trimestrale (per opzione) se il volume d'affari dell'anno precedente non supera €500.000 (servizi) o €800.000 (altre attività), con maggiorazione dell'1%.
- Acconto IVA entro il 27 dicembre.
- LIPE trimestrale (31/5, 16/9, 30/11, fine febbraio).
- Dichiarazione IVA dal 1/2 al 30/4.

I documenti precompilati IVA dell'AdE (registri, LIPE, bozza di dichiarazione) sono facoltativi. Per una SRL che tiene i propri registri servono al massimo come strumento di riconciliazione.

### Cited Findings
- [N] Art. 1 DPR 100/98: liquidazione mensile e versamento entro il giorno 16 del mese successivo — [Normattiva DPR 100/98](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1998-03-23;100)
- [N] Opzione trimestrale (art. 7 DPR 542/1999), con limiti di volume d'affari agganciati a quelli della contabilità semplificata (art. 18 DPR 600/73). Dal 2023/2024 i limiti sono €500.000 per le prestazioni di servizi e €800.000 per le altre attività.
  - Interessi dell'1% sull'IVA dei primi tre trimestri.
  - Versamenti entro il 16/5, il 20/8 (16/8 con proroga di Ferragosto) e il 16/11.
  - Il IV trimestre si versa con il saldo annuale entro il 16/3.
  - Fonte: [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600). *Il raccordo tra le soglie e l'adeguamento a 500k/800k non è stato riletto in sessione.*
- [N] Acconto IVA (art. 6 c.2 L. 405/1990): entro il 27 dicembre.
  - Metodi: storico (88% del versamento del periodo omologo dell'anno precedente), previsionale (88%), analitico (operazioni effettuate fino al 20/12).
  - Codici tributo: 6013 per i mensili, 6035 per i trimestrali.
  - *Non riletto.*
- [N] LIPE (art. 21-bis DL 78/2010): entro l'ultimo giorno del secondo mese successivo al trimestre (31/5, 30/11), con eccezioni: il II trimestre va al 16/9; il IV trimestre a fine febbraio, oppure dentro la dichiarazione IVA annuale se questa è presentata entro febbraio — [Normattiva DL 78/2010](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:2010-05-31;78)
- [N] Dichiarazione IVA annuale (art. 8 DPR 322/98): presentazione tra il 1° febbraio e il 30 aprile. Saldo IVA entro il 16/3, oppure differito ai termini delle imposte sui redditi con maggiorazione dello 0,40% per ogni mese o frazione. Per compensare in F24 un credito IVA annuale superiore a €5.000 servono la presentazione preventiva della dichiarazione e il visto di conformità (art. 10 DL 78/2009) — [Normattiva DPR 322/98](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1998-07-22;322)
- [N] Precompilati IVA (art. 4 D.Lgs. 127/2015; provv. AdE 8/7/2021 n. 183994 e successivi): per le operazioni dal 1/7/2021 l'AdE mette a disposizione, nel portale Fatture e Corrispettivi, bozze dei registri IVA, delle LIPE e (dal 2023 circa) della dichiarazione IVA annuale, per i soggetti passivi IVA residenti, con esclusioni per alcuni regimi speciali. L'uso è facoltativo — [Normattiva DPR 633/72 (per il quadro IVA)](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633) *(numero del provvedimento e perimetro soggettivo non riverificati)*

### Inferences
- [I] Classificazione di Energenia ai fini della soglia: l'attività mista (cessioni con posa, appalti di installazione, manutenzioni) senza distinta annotazione dei ricavi ricade, secondo la regola dell'art. 18 DPR 600/73 come la ricordo, nel limite delle "altre attività" (€800.000). Va verificato col commercialista.
- [I] Strutturalmente Energenia rischia un credito IVA ricorrente: vende al 10% o in reverse charge (N6.7) e acquista servizi e beni anche al 22%. Il software dovrebbe calcolare:
  - l'aliquota media acquisti vs vendite (rimborso annuale e infrannuale: art. 30 c.2 lett. a e art. 38-bis c.2 DPR 633/72, quando l'aliquota media sugli acquisti supera quella sulle vendite maggiorata del 10%);
  - la quota di operazioni in reverse charge / split payment, che danno titolo al rimborso.
- [I] Funzioni consigliate: piano delle liquidazioni con riporto del credito, gestione del minimo di versamento (soglia storica €25,82, da parametrizzare: vedi Gaps), generazione F24 (codici 6001-6012 mensili, 6031-6034 trimestrali, 6099 saldo annuale), export LIPE, confronto con i registri precompilati AdE.

### Gaps
- Non ho verificato le soglie 2026 esatte per la trimestrale (500k/800k?), né se il D.Lgs. 1/2024 o norme successive abbiano alzato la soglia minima di versamento IVA (ricordo una proposta o misura a €100, non confermata).
- Perimetro soggettivo dei precompilati IVA (se le SRL che liquidano mensilmente sono incluse senza limitazioni) non verificato.

---

## A5. Detrazione IVA: timing e annotazione degli acquisti

### Takeaway
Il diritto alla detrazione sorge quando l'imposta diventa esigibile e si ha la fattura (ricezione). Va esercitato al più tardi con la dichiarazione IVA dell'anno in cui il diritto è sorto, quindi l'anno di ricezione. Una fattura ricevuta e registrata entro il 15 del mese successivo può essere detratta nella liquidazione del mese di effettuazione, tranne quando l'operazione è dell'anno precedente.

### Cited Findings
- [N] Art. 19 c.1 DPR 633/72 (dopo il DL 50/2017): il diritto alla detrazione "sorge nel momento in cui l'imposta diviene esigibile ed è esercitato al più tardi con la dichiarazione relativa all'anno in cui il diritto alla detrazione è sorto" — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)
- [N] La circ. AdE 1/E/2018 lega il dies a quo al doppio requisito esigibilità + ricezione della fattura. La fattura ricevuta nell'anno N e registrata entro il 30/4 di N+1 in un'apposita sezione del registro acquisti si detrae nella dichiarazione relativa a N — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633) *(circolare non riletta)*
- [N] Art. 1 c.1 DPR 100/98, ultimo periodo (aggiunto dal DL 119/2018): entro il 16 "può essere esercitato il diritto alla detrazione dell'imposta relativa ai documenti di acquisto ricevuti e annotati entro il 15 del mese successivo a quello di effettuazione dell'operazione, fatta eccezione per i documenti di acquisto relativi ad operazioni effettuate nell'anno precedente" — [Normattiva DPR 100/98](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1998-03-23;100)
- [N] Data di ricezione della fattura elettronica: è la data di consegna dello SdI. Se la consegna non va a buon fine e il file è messo a disposizione nell'area riservata, conta la data di presa visione — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633) *(provvedimento AdE 30/4/2018, non riletto)*

### Inferences
- [I] Algoritmo "periodo di detrazione proposto":
  - `periodo = mese(data_ricezione)`;
  - se `data_operazione` è nel mese M, `data_ricezione` è nel mese M+1 entro il 15 e anno(M) = anno(ricezione), si può anticipare `periodo = M` (opzione utente);
  - se anno(operazione) < anno(ricezione), niente anticipo;
  - se la fattura è ricevuta nell'anno N e registrata dopo il 31/12/N ma entro il 30/4/N+1, va su un sezionale "anno precedente" che confluisce nella dichiarazione IVA N;
  - oltre il 30/4/N+1 la detrazione è persa (resta possibile solo la dichiarazione integrativa: art. 8 c.6-bis DPR 322/98).
- [I] IVA per cassa (fornitore in art. 32-bis) e regime ordinario del committente: la detrazione resta al momento del pagamento solo se è il committente ad aver optato per la cassa. Il software deve memorizzare il flag "IVA per cassa" della fattura del fornitore (vedi B7).
- [I] Indetraibilità specifiche da gestire con percentuali: auto aziendali (40%/100%), telefonia (50% presunto), spese di rappresentanza, vitto e alloggio. Sono regole generali non specifiche del settore, da parametrizzare per conto/causale.

### Gaps
- Non ho potuto rileggere la circ. 1/E/2018 per confermare la prassi del sezionale "fatture ricevute nell'anno precedente".

---

## A6. Partita doppia per il software: piano dei conti, causali, scritture automatiche

### Takeaway
La legge non impone un piano dei conti standard alle imprese private. Il piano deve però consentire di redigere il bilancio secondo gli schemi degli artt. 2424 (Stato patrimoniale) e 2425 (Conto economico) c.c. (anche in forma abbreviata o micro: artt. 2435-bis/ter) e il deposito in XBRL. Il software deve generare in automatico le scritture per: fatture attive e passive (comprese reverse charge, split payment, ritenute), incassi e pagamenti, F24, liquidazioni IVA, stipendi (da cedolino), ratei/risconti, fatture da emettere/ricevere e lavori in corso a fine esercizio.

### Cited Findings
- [N] Schemi obbligatori di bilancio: art. 2424 (SP), 2425 (CE), 2425-ter (rendiconto finanziario, non obbligatorio per abbreviato e micro), 2435-bis (abbreviato), 2435-ter (micro). Approvazione entro 120 giorni (o 180 nei casi previsti) e deposito al Registro Imprese — [Normattiva Codice civile](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:regio.decreto:1942-03-16;262)
- [N] Competenza fiscale (art. 109 TUIR):
  - cessioni di beni mobili alla consegna o spedizione;
  - prestazioni di servizi alla data di ultimazione;
  - opere e servizi di durata ultrannuale valutati come lavori in corso su ordinazione (art. 93 TUIR) in base ai corrispettivi pattuiti;
  - opere infrannuali valutate a costo (art. 92 c.6 TUIR).
  - Fonte: [Normattiva TUIR](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1986-12-22;917)
- [V] Le ritenute sui bonifici per ristrutturazioni subite dall'impresa vanno rilevate contabilmente come credito. Esiste un apposito approfondimento ECnews "Rilevazione delle ritenute sui bonifici per ristrutturazioni edilizie" (visto solo il titolo) — [ECnews](https://www.ecnews.it/fiscale/societa-e-bilancio/contabilita/rilevazione-delle-ritenute-sui-bonifici-ristrutturazioni-edilizie/)

### Inferences
- [I] **Causali minime e scritture automatiche (schema per installatore)**:
  - **FV10 – Fattura vendita B2C al 10%**: Crediti v/clienti (D) a Ricavi impianti FV (A) + IVA a debito 10% (A).
  - **FVRC – Fattura vendita reverse charge N6.7/N6.3**: Crediti v/clienti (D) a Ricavi installazioni (A). Nessuna IVA; annotazione nel registro vendite con natura N6.x e imponibile ai fini del volume d'affari.
  - **FVSP – Fattura vendita split payment**: Crediti v/clienti per il solo imponibile (D) a Ricavi (A). L'IVA va annotata nel registro vendite ma esclusa dalla liquidazione: in pratica si usa un conto IVA split payment che si chiude contro il credito, oppure si registra solo l'imponibile e l'IVA va solo nei registri.
  - **FVBS – Fattura con beni significativi**: due righe IVA, 10% e 22% (algoritmo in B2).
  - **FA – Fattura acquisto**: Costi / Merci / Cespiti (D) + IVA a credito (D) a Debiti v/fornitori (A); quota indetraibile girata al costo.
  - **FARC – Acquisto in reverse charge (es. subappaltatore elettricista)**: Costo (D) a Debiti v/fornitori (A) per l'imponibile, più integrazione IVA a credito (D) a IVA a debito (A), con doppia annotazione nei registri.
  - **INC – Incasso**: Banca (D) a Crediti v/clienti (A).
  - **INCBP – Incasso da bonifico parlante con ritenuta 11%**: Banca (D, netto accreditato) + Erario c/ritenute subite (D) a Crediti v/clienti (A, lordo). Vedi B4 per il calcolo.
  - **PAGPROF – Pagamento a professionista**: Debiti v/fornitori (D) a Banca (A, netto) + Erario c/ritenute da versare (A).
  - **F24**: Erario c/ritenute da versare / IVA c/erario / INPS (D) a Banca (A).
  - **LIQIVA – Liquidazione IVA**: IVA a debito (D) a IVA a credito (A), saldo a IVA c/erario.
  - **STIP – Stipendi**: Salari e stipendi / Oneri sociali / TFR (D) a Debiti v/dipendenti, Erario c/ritenute, INPS, Fondo TFR (A).
  - **Fine anno**: Fatture da emettere / Fatture da ricevere; ratei e risconti; rimanenze di merci e di lavori in corso su ordinazione (commesse di installazione aperte al 31/12, con SAL e acconti fatturati iscritti tra gli acconti da clienti).
- [I] Per un installatore il conto "Acconti da clienti" (passività) e i lavori in corso (attivo) vanno collegati alla commessa: le fatture di acconto o di SAL, se la commessa non è ultimata, non sono ricavi di competenza (tranne le prestazioni ultrannuali, art. 93 TUIR).

### Gaps
- Nessuna fonte ufficiale riletta in sessione per OIC 23 (lavori in corso) e OIC 15/19. Gli schemi di scrittura sopra sono prassi contabile standard, non norme.

---

## A7. Conservazione decennale e termini di accertamento

### Takeaway
Libri, scritture, fatture e corrispondenza si conservano per 10 anni dall'ultima registrazione (art. 2220 c.c.). Ai fini fiscali vanno tenuti comunque fino alla definizione degli accertamenti relativi al periodo d'imposta (art. 22 DPR 600/73), anche oltre i 10 anni se c'è un contenzioso in corso.

### Cited Findings
- [N] Art. 2220 c.c.: conservazione delle scritture per 10 anni dalla data dell'ultima registrazione, e per lo stesso periodo di fatture, lettere e telegrammi ricevuti e copie di quelli spediti — [Normattiva Codice civile](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:regio.decreto:1942-03-16;262)
- [N] Art. 22 c.2 DPR 600/73: le scritture obbligatorie vanno conservate "fino a quando non siano definiti gli accertamenti relativi al corrispondente periodo d'imposta, anche oltre il termine stabilito dall'art. 2220 c.c." — [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600)
- [N] Termini ordinari di accertamento: 31/12 del quinto anno successivo alla dichiarazione, settimo in caso di omessa dichiarazione (art. 43 DPR 600/73, art. 57 DPR 633/72) — [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600)

### Inferences
- [I] Nel software: nessuna cancellazione fisica di documenti o registrazioni prima di max(10 anni dall'ultima registrazione, definizione dell'accertamento), con un flag "contenzioso aperto" per anno d'imposta che blocca la purge.

### Gaps
- Nessuna.

---

## A8. Ritenute su fatture ricevute (professionisti, agenti, condominio), F24, CU/770; nuova ritenuta B2B dal 2028

### Takeaway
Quando paga professionisti o lavoratori autonomi occasionali, Energenia opera come sostituto d'imposta la ritenuta del 20% (cod. 1040, versamento entro il 16 del mese successivo al pagamento, principio di cassa). Per gli agenti la ritenuta è del 23% sul 50% delle provvigioni (cod. 1038), più i contributi ENASARCO. Restano a carico di Energenia CU e 770. La Legge di Bilancio 2026 (L. 199/2025, art. 1 c.112-114) ha introdotto una nuova ritenuta sui pagamenti tra imprese: **0,5% nel 2028 e 1% dal 2029**. Non è ancora operativa, ma il software va predisposto.

### Cited Findings
- [N] Art. 25 DPR 600/73: ritenuta del 20% sui compensi di lavoro autonomo (professionisti, ad esempio progettisti esterni, ingegneri, geometri). Va operata all'atto del pagamento e versata entro il 16 del mese successivo (F24, cod. 1040). Base: compenso più rivalsa INPS 4% se presente; esclusi il contributo integrativo delle casse professionali (es. Inarcassa 4%) e l'IVA. Non si applica ai forfettari, che lo dichiarano in fattura — [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600)
- [N] D.Lgs. 192/2024 (riforma IRPEF): dal 2025 i rimborsi di spese per l'incarico addebitati analiticamente al committente non concorrono al reddito di lavoro autonomo, quindi sono esclusi dalla base della ritenuta — [Normattiva TUIR](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1986-12-22;917) *(non riletto)*
- [N] Art. 25-bis DPR 600/73: ritenuta sulle provvigioni degli agenti pari al 23% del 50% delle provvigioni, ridotta al 20% della base se l'agente si avvale di dipendenti o terzi e lo dichiara. Codice 1038. Contributi ENASARCO a carico per metà del preponente, versamento trimestrale. L'aliquota complessiva (17%, cioè 8,5% + 8,5%) non è stata riverificata — [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600)
- [N] Ritenuta 4% del condominio (art. 25-ter DPR 600/73): il condominio sostituto d'imposta trattiene il 4% sui corrispettivi di appalti di opere e servizi resi da imprese. Riguarda **Energenia come percipiente** quando lavora per condomini. Non si applica quando il pagamento sconta già la ritenuta sul bonifico parlante (art. 25 DL 78/2010) — [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600) *(esclusione da riverificare)*
- [N] Certificazione Unica: consegna al percipiente e invio all'AdE entro il 16 marzo. Le CU con soli redditi non dichiarabili con il 730 (es. lavoro autonomo abituale) possono essere inviate entro il termine del 770 (31 ottobre) — [Normattiva DPR 322/98](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1998-07-22;322) *(non riletto)*
- [V] **Nuova ritenuta B2B**: la L. 30/12/2025 n. 199, art. 1 c.112-114, introduce una ritenuta d'acconto dello 0,5% per il 2028 e dell'1% dal 2029 sulle transazioni tra soggetti che esercitano attività d'impresa.
  - Si opera al pagamento, sul corrispettivo al netto dell'IVA.
  - Esclusi i soggetti in concordato preventivo biennale o in adempimento collaborativo, e i pagamenti già assoggettati alla ritenuta dell'art. 25 c.1 DL 78/2010 (bonifici parlanti; il testo è riportato in modo frammentario nella fonte).
  - Il Sole 24 Ore osserva che la ritenuta va calcolata al pagamento sull'importo effettivamente pagato, il che richiede di fatto una contabilità per cassa.
  - Fonti: [MySolution 2/1/2026](https://www.mysolution.it/fisco/informazioni/news/2026/01/02/nuova-ritenuta-dacconto-tra-imprese-dal-2028/); [Confartigianato, infografiche LdB 2026](https://www.confartigianato.it/storage/2025/12/Legge-Bilancio_Infografiche-2026-ok.pdf); [NT+ Fisco Sole 24 Ore](https://ntplusfisco.ilsole24ore.com/art/ritenuta-d-acconto-fattura-dal-2028-l-esempio-dell-iva-semplificare-l-adempimento-AIDxwLaB); [FiscoeTasse](https://www.fiscoetasse.com/approfondimenti/16987-imprese-e-nuova-ritenuta-dacconto-dallanno-2028.html); [MySolution 15/1/2026](https://www.mysolution.it/fisco/informazioni/news/2026/01/15/legge-di-bilancio.-ritenuta-b2b-a-tutto-campo)

### Inferences
- [I] Il modulo fornitori deve avere:
  - tipo di percipiente (professionista, occasionale, agente, impresa, forfettario);
  - aliquota e base della ritenuta;
  - flag cassa previdenziale;
  - generazione automatica del debito "Erario c/ritenute" al pagamento (non alla fattura);
  - scadenza F24 al 16 del mese successivo;
  - archivio dati per CU e 770.
- [I] Predisporre dal 2027 (per il 2028) una tabella parametrica "ritenuta B2B" (aliquota per anno, esclusioni) sia lato pagamenti (Energenia sostituto) sia lato incassi (Energenia percipiente: credito da scomputare). Le istruzioni attuative non risultano emanate in quanto trovato.
- [I] Energenia è percipiente di ritenute in tre casi: bonifici parlanti 11% (B4), condomini 4%, e dal 2028 la ritenuta B2B. Per tutti serve il conto "Erario c/ritenute subite" con dettaglio per anno e tipo, da scomputare dall'IRES.

### Gaps
- Testo definitivo dei c.112-114 L. 199/2025 e provvedimenti attuativi non letti. Non so se modifiche successive (es. decreti del 2026) abbiano rinviato o cambiato la misura.
- Aliquote ENASARCO 2026 e scadenze esatte non verificate.

---

## A9. Limiti all'uso del contante e tracciabilità rilevanti per la prima nota

### Takeaway
La soglia per i trasferimenti di contante tra soggetti diversi è di **€5.000** (pagamento a partire da €5.000 vietato) dal 1/1/2023. Per quanto risulta resta invariata nel 2026. Altri obblighi di tracciabilità incidono sulla deducibilità dei costi e sulle agevolazioni: i pagamenti per detrazioni edilizie richiedono il bonifico parlante; dal 2025 le spese di trasferta, vitto, alloggio e rappresentanza sono deducibili solo se pagate in modo tracciabile.

### Cited Findings
- [N] Art. 49 c.1 e c.3-bis D.Lgs. 231/2007, come modificato dalla L. 197/2022 (art. 1 c.384): soglia di €5.000 dal 1/1/2023 — [Normattiva D.Lgs. 231/2007](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2007-11-21;231) *(non riverificato per il 2026)*
- [N] L. 207/2024 (Bilancio 2025), art. 1 c.81-83 circa: dal 2025 i rimborsi a dipendenti per vitto, alloggio, viaggio e trasporto non tassati, e la deducibilità per l'impresa delle spese di trasferta e di rappresentanza, richiedono il pagamento con strumenti tracciabili (TUIR artt. 51, 95, 108) — [Normattiva TUIR](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1986-12-22;917) *(commi esatti non verificati)*
- [V] Il bonifico parlante non serve per bonus mobili e bonus verde; serve per le detrazioni edilizie ed energetiche — [InvestireOggi](https://www.investireoggi.it/bonus-edilizi-dopo-manovra-2026-quando-serve-il-bonifico-parlante-e-quando-bastano-carta-o-bonifico-ordinario/)

### Inferences
- [I] In prima nota ogni movimento di incasso o pagamento deve avere il campo "mezzo di pagamento" (contanti, bonifico ordinario, bonifico parlante, carta, assegno, RiBa, SDD, F24). Controlli:
  - (a) movimento in contanti ≥ €5.000 con la stessa controparte → blocco o warning antiriciclaggio;
  - (b) costi di trasferta o rappresentanza pagati in contanti → flag "indeducibile";
  - (c) incasso di fattura con causale "detrazione" non avvenuto tramite bonifico parlante → warning (rischio di perdita del bonus per il cliente).

### Gaps
- Soglia del contante 2026 non riverificata su fonte ufficiale (non risultano modifiche nella mia conoscenza fino a giugno 2026).

---

## B1. Aliquote IVA per impianti FV, accumulo, wallbox, solare termico, pompe di calore e impianti elettrici

### Takeaway
- **FV**: costruzione e cessione di impianti fotovoltaici al 10% (Tab. A parte III DPR 633/72: n. 127-quinquies per gli impianti, n. 127-sexies per i beni finiti forniti per la costruzione, n. 127-septies per le prestazioni in appalto), per qualunque cliente e anche su immobili non abitativi.
- **Wallbox**: 10% solo se installata unitariamente con il FV (risposta AdE 218/2020); altrimenti 22%.
- **Accumulo**: nessun interpello IVA specifico trovato. La prassi applica il 10% se fa parte dell'impianto FV.
- **Solare termico**: 10%, secondo un articolo Eutekne (visto solo il titolo).
- **Pompe di calore, impianti elettrici, domotica, condizionamento**: niente 127-quinquies. 10% solo come manutenzione o recupero su edifici abitativi (art. 7 L. 488/1999, con la regola dei beni significativi); 22% negli altri casi.

### Cited Findings
- [N] Tab. A parte III DPR 633/72:
  - n. 127-quinquies: "…impianti di produzione e reti di distribuzione calore-energia e di energia elettrica da fonte solare-fotovoltaica ed eolica…";
  - n. 127-sexies: "beni, escluse le materie prime e semilavorate, forniti per la costruzione delle opere, degli impianti e degli edifici di cui al n. 127-quinquies";
  - n. 127-septies: "prestazioni di servizi dipendenti da contratti di appalto relativi alla costruzione delle opere, degli impianti e degli edifici di cui al n. 127-quinquies".
  - Fonte: [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)
- [V] La circ. AdE 36/E del 19/12/2013 conferma il 10% (n. 127-quinquies) per cessione e realizzazione di impianti solari-fotovoltaici. Secondo la sintesi della fonte vale per impianti in grado di immettere energia in rete, dotati dei componenti indicati dalla norma CEI 82-25 — [ANCE Mantova su C.M. 36/E 2013](https://mantova.ance.it/2014/01/31/impianti-fotovoltaici-chiarimenti-dell-agenzia-delle-entrate-c-m-36-e-2013/?print=pdf); [Ediltecnico](https://ediltecnico.it/iva-agevolata-10-regime-per-i-pannelli-solari/)
- [V] Colonnine di ricarica: per la risposta a interpello AdE n. 218/2020, una colonnina realizzata in modo autonomo rispetto al FV sconta l'aliquota ordinaria; con installazione unitaria al FV si applica il 10% — [QualEnergia](https://www.qualenergia.it/pro/articoli-pro/aliquota-iva-al-10-per-le-colonnine-di-ricarica-ma-solo-se-installate-insieme-a-un-impianto-fotovoltaico/); [FiscoeTasse](https://www.fiscoetasse.com/rassegna-stampa/28932-aliquota-iva-per-auto-elettriche-e-colonnine-di-ricarica.html)
- [V] Accumulo: non è stato trovato un interpello IVA specifico. La risposta AdE n. 8/2018 riguarda la **detrazione IRPEF** di un accumulo aggiunto a un FV esistente, non l'IVA. Il 10% per l'accumulo (anche nel caso di rifacimento con potenziamento) è sostenuto da professionisti come manutenzione straordinaria su abitativo, ma non da prassi ufficiale — [AdE risposta 8/2018](https://www.agenziaentrate.gov.it/portale/documents/20143/307350/Interpello+8+2018_Risposta+n.+8.pdf/bb6dad88-cdaa-e4f8-2974-c9c05728dfeb); [PMI.it](https://www.pmi.it/?p=446220)
- [V] Solare termico: un articolo Eutekne è intitolato "Impianto termico a energia solare con IVA del 10%". Ho visto solo il titolo: documento di prassi citato e condizioni non verificati — [Eutekne](https://www.eutekne.info/Sezioni/Art_800757_impianto_termico_a_energia_solare_con_iva_del_10.aspx)
- [V] 10% per la manutenzione straordinaria (e ordinaria) solo su:
  - parti comuni di fabbricati a prevalente destinazione abitativa;
  - edilizia residenziale pubblica;
  - singole unità abitative (cat. A1-A11, escluso A10) e relative pertinenze;
  - negli altri casi 22%.
  - Fonte: [CNA Bologna (slide IVA)](https://bo.cna.it/wp-content/uploads/2025/03/Maletti_310321_IVA.pdf)
- [N] 4%: prestazioni in appalto per la costruzione di "prima casa" non di lusso (Tab. A parte II n. 39) e beni finiti forniti per la stessa costruzione (n. 24), con dichiarazione del committente. Per le altre nuove costruzioni abitative "Tupini" 10% (Tab. A parte III n. 127-quaterdecies e n. 127-undecies/duodecies) — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)

### Inferences
- [I] **Tabella decisionale aliquota / natura** (da codificare come regole con date di validità):

| # | Intervento | Cliente / immobile | Trattamento proposto | Base |
|---|---|---|---|---|
| 1 | FV nuovo (moduli+inverter+strutture+posa), anche con accumulo installato contestualmente | Privato, qualunque immobile | 10% | n. 127-quinquies/sexies/septies; circ. 36/E/2013 [V] |
| 2 | FV su edificio di impresa, contratto d'appalto/installazione | Soggetto IVA | **Reverse charge N6.7** (art. 17 c.6 lett. a-ter) — vedi B3; il committente integra al 10% | circ. 14/E e 37/E/2015 [V parz.] |
| 3 | FV su edificio di impresa, **cessione con posa in opera** (prevale il dare) | Soggetto IVA | 10% con IVA in fattura (no RC) | [I] da qualificazione contrattuale |
| 4 | FV a terra non funzionale a un edificio / agrivoltaico | Soggetto IVA | 10% con IVA in fattura (no RC) | [V] ECnews/Fiscomania |
| 5 | Wallbox installata con il FV (unitaria) | Qualunque | 10% | Risp. 218/2020 [V] |
| 6 | Wallbox autonoma | Qualunque | 22% (o 10% se rientra in manutenzione su abitativo — **incerto**) | Risp. 218/2020 [V] |
| 7 | Accumulo aggiunto a FV esistente | Abitazione | 10% come manutenzione straordinaria su abitativo (prassi, **incerto**) | [V] solo opinione |
| 8 | Solare termico | Qualunque | 10% (127-quinquies "calore-energia"?) — **da verificare** | [V] solo titolo Eutekne |
| 9 | Pompa di calore / climatizzatore / caldaia (sostituzione) | Abitazione (A1-A11 escl. A10) | 10% con regola beni significativi (B2) | L. 488/99 art. 7 c.1 lett. b |
| 10 | Pompa di calore / impianto elettrico / domotica | Immobile non abitativo, B2C | 22% | [N] |
| 11 | Idem su edificio, B2B soggetto IVA | Soggetto IVA | RC N6.7 | [N]/[V] |
| 12 | Impianti in nuova costruzione "prima casa" in appalto con il privato | Privato | 4% (con dichiarazione) | Tab. A II n. 39 [N] |
| 13 | Manutenzione ordinaria o riparazione FV esistente | Abitazione | 10% (manutenzione su abitativo) | [I] |
| 14 | Manutenzione FV esistente | Non abitativo, B2C | 22% (non è "costruzione") | [I] |
| 15 | Vendita di solo materiale senza posa | Qualunque | 22%, salvo beni finiti per la costruzione di un FV (127-sexies) con dichiarazione di destinazione | [I] |

- [I] Gli acquisti di Energenia da distributori di moduli e inverter al 10% (beni finiti, n. 127-sexies) sono prassi diffusa con dichiarazione di destinazione del cliente. Se l'installatore stesso possa beneficiarne va confermato su prassi (vedi Gaps). Il software deve accettare righe passive al 10% senza segnalarle come anomale.
- [I] La dicitura della norma nell'aliquota ridotta non è un obbligo di legge per le operazioni imponibili, ma è raccomandata (es. "IVA 10% ai sensi del n. 127-quinquies/127-septies, Tab. A, parte III, DPR 633/72"). Riduce le contestazioni e aiuta il cliente a recuperare la documentazione.

### Gaps
- Non sono riuscito a leggere la circ. 36/E/2013 nel testo ufficiale, né eventuali risposte AdE 2019-2026 su accumulo, solare termico, pompe di calore e domotica.
- Non è verificato se il 10% per "beni finiti" (127-sexies) spetti anche quando l'acquirente è l'installatore e non il committente finale.
- Non è verificato se le "smart home" o domotica abbiano un trattamento specifico (es. building automation come intervento ecobonus, ma per l'IVA resta la regola di L. 488/99).

---

## B2. "Beni significativi" nella manutenzione su edifici abitativi (DM 29/12/1999)

### Takeaway
Negli interventi di manutenzione ordinaria e straordinaria su edifici a prevalente destinazione abitativa il 10% copre tutta la prestazione, compresi i beni forniti. Fanno eccezione i "beni significativi" del DM 29/12/1999:
- ascensori e montacarichi;
- infissi esterni e interni;
- caldaie;
- videocitofoni;
- apparecchiature di condizionamento e riciclo dell'aria;
- sanitari e rubinetterie da bagno;
- impianti di sicurezza.

Per questi il 10% si applica solo fino a concorrenza della differenza tra valore complessivo dell'intervento e valore dei beni significativi; l'eccedenza va al 22%. La fattura deve indicare il servizio e, separatamente, i beni significativi forniti (L. 205/2017 c.19; circ. 15/E/2018). Le parti staccate con autonomia funzionale seguono il 10%.

### Cited Findings
- [N] Art. 7 c.1 lett. b) L. 488/1999 (reso permanente dalla L. 191/2009): 10% per le prestazioni aventi ad oggetto interventi di recupero (manutenzione ordinaria e straordinaria, art. 3 c.1 lett. a-b DPR 380/2001) su fabbricati a prevalente destinazione abitativa privata. Per i beni significativi del DM 29/12/1999 il 10% vale "fino a concorrenza del valore complessivo della prestazione relativa all'intervento di recupero, al netto del valore dei predetti beni" — [Normattiva L. 488/1999](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:1999-12-23;488)
- [V] La L. 205/2017 (Bilancio 2018) ha dato un'interpretazione autentica dell'art. 7 c.1 lett. b) L. 448/1999 [rectius 488/1999] su come individuare il valore dei beni significativi. La circ. AdE 15/E/2018 chiarisce che le componenti e parti staccate dei beni significativi godono del 10% se dotate di autonomia funzionale — [ANCE Siracusa su C.M. 15/E 2018](https://siracusa.ance.it/2018/07/20/iva-al-10-e-beni-significativi-i-chiarimenti-dell-agenzia-delle-entrate-c-m-15-e-18/?print=pdf); [CNA Bologna](https://bo.cna.it/wp-content/uploads/2025/03/Maletti_310321_IVA.pdf)
- [V] La risposta AdE n. 18/2019 riguarda IVA e beni significativi per un ascensore — [ANCE Reggio Calabria](https://reggiocalabria.ance.it/2019/08/27/iva-su-ascensore-e-beni-significativi-risposta-dellagenzia-entrate-n-18-2019/?print=pdf)
- [N] L. 205/2017 art. 1 c.19:
  - la fattura del prestatore deve indicare, oltre al servizio oggetto della prestazione, anche i beni significativi forniti nell'ambito dell'intervento;
  - il loro valore è quello risultante dall'accordo tra le parti, che deve tenere conto solo dei costi di produzione (materie prime e manodopera) e non può essere inferiore al prezzo di acquisto dei beni.
  - Fonte: [Normattiva L. 205/2017](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2017-12-27;205) *(testo non riletto)*
- [V] Per le pompe di calore non ho trovato una risposta ufficiale specifica: un forum tecnico (Edilclima) discute proprio come trattarle, con opinioni divergenti — [Edilclima forum](https://forum.edilclima.it/viewtopic.php?p=239597) *(fonte non autorevole)*

### Inferences
- [I] **Algoritmo** (T = imponibile totale dell'intervento, cioè servizi + tutti i beni; S = valore dei beni significativi):
  - se S ≤ T/2 → tutto al 10%;
  - altrimenti base 22% = 2S − T e base 10% = T − (2S − T) = 2(T − S).
  - Esempio: T = 10.000 (caldaia/PdC 6.000 + manodopera e materiali 4.000) → 10% su 8.000, 22% su 2.000.
  - Righe della fattura: (1) prestazione di manutenzione; (2) "bene significativo: [descrizione], valore € S"; (3) ripartizione IVA 10%/22% esplicitata.
- [I] Per prudenza conviene trattare come beni significativi:
  - pompe di calore (aria-acqua come "caldaie"; aria-aria come "apparecchiature di condizionamento");
  - climatizzatori;
  - videocitofoni e impianti di sicurezza (antintrusione, TVCC), rilevanti per la domotica.
  - Moduli FV e inverter non rientrano nell'elenco del DM e sono comunque al 10% per il n. 127-quinquies/sexies. La regola dei beni significativi non si applica alle opere che ricadono nel 127-quinquies.
- [I] Il 10% della L. 488/99 spetta solo nel rapporto con il committente finale. In subappalto si applicano l'IVA ordinaria o il reverse charge (vedi B3).
- [I] Il bene fornito direttamente dal cliente non entra nella base: 10% sulla sola manodopera. La mera cessione del bene senza posa → 22%.
- [I] Dati anagrafici da raccogliere nella commessa: categoria catastale e destinazione (abitativo sì/no, prevalenza abitativa per le parti comuni), tipo di intervento (manutenzione ordinaria / straordinaria / restauro / ristrutturazione / nuova costruzione), ed eventuale dichiarazione del cliente.

### Gaps
- Non verificata una posizione ufficiale AdE sulla qualificazione delle pompe di calore (caldaia o condizionatore) e sulle batterie di accumulo come beni significativi.
- Non verificato se interventi di "ristrutturazione edilizia" (art. 3 c.1 lett. d DPR 380/2001) seguano il 10% ex n. 127-quaterdecies senza regola dei beni significativi. Ricordo di sì, ma non è confermato.

---

## B3. Reverse charge edile/impianti (N6.3, N6.7) ed energetico (N6.8)

### Takeaway
L'installazione di impianti "relativi ad edifici" resa a un soggetto passivo IVA si fattura in **reverse charge** (art. 17 c.6 lett. a-ter DPR 633/72, natura **N6.7**, dicitura "inversione contabile"). Questo vale a prescindere dal subappalto e dal settore del committente. Il subappalto nel settore edile verso imprese edili o l'appaltatore principale ricade invece nella lett. a) (**N6.3**). Per il FV conta il "nesso funzionale con l'edificio" (circ. 37/E/2015):
- impianti integrati, semi-integrati o sul tetto, o a terra in aree pertinenziali → reverse charge;
- impianti a terra non funzionali a un edificio e agrivoltaico → IVA ordinaria (10%).

Restano fuori dal reverse charge le cessioni con posa in opera in cui prevale la cessione e tutte le operazioni verso privati. Il reverse charge energetico (N6.8) è rilevante solo se Energenia vende energia o certificati a rivenditori.

### Cited Findings
- [V] L'art. 17 c.6 lett. a-ter riguarda "prestazioni di servizi di pulizia, demolizione, installazione di impianti e completamento relative ad edifici". La circ. 14/E del 27/3/2015 limita "edifici" ai fabbricati, escludendo terreni, parti del suolo, parcheggi, piscine e giardini, salvo che siano parte integrante dell'edificio — [ECnews](https://www.ecnews.it/fiscale/fisco-e-patrimonio/iva/limpianto-agrivoltaico-non-ricade-nel-regime-del-reverse-charge-2/); [ANCE su C.M. 37/E 2015](https://ance.it/2015/12/estensione-del-reverse-charge-c-m-37-e-2015/?print=pdf)
- [V] Circ. 37/E/2015, par. 8 (fotovoltaico): criterio del "nesso funzionale rispetto all'edificio", con valutazione caso per caso. Secondo le fonti è soddisfatto per gli impianti integrati o semi-integrati installati sugli edifici e per quelli a terra in aree pertinenziali al fabbricato. Se l'impianto è funzionale a un edificio si applica il reverse charge interno e il debitore d'imposta è il committente; se non lo è, la lett. a-ter non si applica — [ECnews, Territorialità IVA e installazione FV](https://www.ecnews.it/fiscale/?p=34712); [Fiscomania](https://fiscomania.com/impianti-agrivoltaici-esclusi-reverse-charge/)
- [V] Per un contratto unico di demolizione e ricostruzione (nuova costruzione) si applicano le regole ordinarie, non il reverse charge (circ. 37/E/2015) — [ANCE](https://ance.it/2015/12/estensione-del-reverse-charge-c-m-37-e-2015/?print=pdf)
- [V] Gli impianti agrivoltaici sono stati esclusi dal reverse charge lett. a-ter dall'AdE (numero e data del documento di prassi non verificati) — [ECnews](https://www.ecnews.it/fiscale/fisco-e-patrimonio/agevolazioni/limpianto-agrivoltaico-non-ricade-nel-regime-del-reverse-charge/); [Fiscomania](https://fiscomania.com/impianti-agrivoltaici-esclusi-reverse-charge/)
- [N] Art. 17 c.6 lett. a): prestazioni di servizi, compresa la manodopera, rese nel settore edile da subappaltatori a imprese di costruzione o ristrutturazione, all'appaltatore principale o a un altro subappaltatore. La circ. 37/E/2006 richiede ATECO della sezione F (costruzioni) per entrambi — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)
- [N] Circ. 14/E/2015: per individuare l'"installazione di impianti" rinvia ai codici ATECO 2007 della divisione 43 (43.21 impianti elettrici, 43.22 idraulici, riscaldamento e condizionamento, 43.29 altri impianti). Comprende anche manutenzione e riparazione degli impianti relativi a edifici. Esclude le cessioni con posa in opera, dove la posa è accessoria alla cessione del bene — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633) *(circolare non riletta)*
- [N] Art. 21 c.6 DPR 633/72: per le operazioni in cui l'imposta è dovuta dal cessionario la fattura reca l'annotazione "inversione contabile", con l'eventuale indicazione della norma — [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)
- [N] Codici natura dell'inversione contabile (specifiche tecniche AdE della fattura elettronica): N6.1 rottami; N6.2 oro e argento; N6.3 subappalto nel settore edile; N6.4 cessione di fabbricati; N6.5 telefoni cellulari; N6.6 prodotti elettronici; N6.7 prestazioni nel comparto edile e settori connessi; N6.8 operazioni nel settore energetico; N6.9 altri casi. Per il passivo: integrazione TD16 per il reverse charge interno — [FatturaPA, documentazione formato](https://www.fatturapa.gov.it/it/norme-e-regole/documentazione-fattura-elettronica/formato-fatturapa/) *(URL e versione delle specifiche non verificati in sessione; il dettaglio tecnico è di competenza dell'altro ricercatore)*
- [N] Settore energetico, art. 17 c.6:
  - lett. d-bis: quote di emissione;
  - lett. d-ter: certificati relativi a gas ed energia elettrica;
  - lett. d-quater: cessioni di gas ed energia elettrica a un soggetto passivo-rivenditore (art. 7-bis c.3 lett. a).
  - Natura N6.8. Questa deroga è a termine (allineata all'art. 199-bis della dir. 2006/112/CE).
  - Fonte: [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633) *(scadenza attuale non verificata)*

### Inferences
- [I] **Regola di decisione** "IVA o reverse charge" per una riga di installazione:
  - cliente privato (consumatore) → IVA (10%, 22% o 4%);
  - cliente soggetto IVA e contratto prevalentemente cessione con posa → IVA;
  - cliente soggetto IVA, prestazione o appalto di installazione, manutenzione o completamento su un fabbricato (o FV funzionale al fabbricato) →
    - se c'è subappalto verso un'impresa edile o l'appaltatore principale con ATECO F e Energenia opera nel settore edile → **N6.3** (lett. a);
    - altrimenti → **N6.7** (lett. a-ter);
  - FV a terra non pertinenziale o agrivoltaico, verso soggetto IVA → IVA 10% ordinaria;
  - PA o soggetto in split payment, se l'operazione rientra nel reverse charge → **prevale il reverse charge** (lo split payment non si applica alle operazioni in RC) [N].
- [I] Anche per le fatture N6.x conviene salvare nel software l'aliquota "teorica" (10% o 22%) da comunicare al committente, che deve integrarla.
- [I] Il campo "tipo contratto" (appalto/prestazione vs vendita con posa) va reso obbligatorio a livello di commessa, perché determina sia il reverse charge sia il momento impositivo (B7).
- [I] Il reverse charge in uscita genera credito IVA strutturale: nel modulo IVA va collegato al calcolo dei presupposti per il rimborso (art. 30 c.2 lett. a DPR 633/72) e alle compensazioni.
- [I] Per Energenia il reverse charge energetico (N6.8) è probabilmente marginale. Diventa rilevante solo se possiede impianti e vende energia a trader o rivenditori (non agli utenti finali) o titoli o certificati energetici.

### Gaps
- Prevalenza tra lett. a) e a-ter quando entrambe sono astrattamente applicabili: non ho riletto il passaggio della circ. 14/E/2015.
- Il raccordo ATECO 2007 → ATECO 2025 (in uso dal 2025) per i codici richiamati dalla circ. 14/E non è verificato.
- Scadenza attuale delle lett. d-bis, d-ter, d-quater (energetico) non verificata.
- Numero della risposta AdE sull'agrivoltaico non verificato.

---

## B4. Detrazioni edilizie ed energetiche 2026, bonifico parlante, ritenuta 11% e registrazione degli incassi

### Takeaway
- Per le spese 2026 bonus ristrutturazioni (art. 16-bis TUIR, che include il FV con accumulo come risparmio energetico) ed ecobonus restano al **50% per l'abitazione principale** e al **36% per gli altri immobili**; nel 2027 scendono a 36% e 30%. Proroga della L. 199/2025.
- I privati pagano con **bonifico parlante**.
- Su questi bonifici la banca o Poste trattiene una ritenuta d'acconto dell'**11%**, in vigore dal **1° marzo 2024** (L. 213/2023 c.88; prima era dell'8%), su una base al netto dell'IVA.
- Nessuna fonte indica un cambio di aliquota nel 2026.
- Energenia incassa quindi meno del dovuto e registra un credito per le ritenute subite, da scomputare dall'IRES.

### Cited Findings
- [V] Legge di Bilancio 2026:
  - bonus ristrutturazioni ed ecobonus 2026 al 50% sulla prima casa e al 36% sugli altri immobili, riduzione a 36% e 30% rinviata al 2027;
  - tetto di spesa del bonus casa €96.000;
  - 10 quote annuali;
  - prorogati anche Sismabonus e bonus mobili (50% su €5.000);
  - non più previsto il bonus barriere 75%.
  - Fonti: [Ediltecnico](https://ediltecnico.it/bonus-edilizi-2026-legge-di-bilancio/); [GreenMe](https://www.greenme.it/casa-e-giardino/bioedilizia-e-bioarchitettura/bonus-casa-confermati-il-50-e-il-36-anche-per-il-2026-addio-al-superbonus-e-stop-al-bonus-barriere/); [Centro Fiscale](https://centrofiscale.com/bonus-casa-2026/)
- [V] Ritenuta sui bonifici parlanti: la L. 213/2023 (Bilancio 2024), c.88, modifica l'art. 25 DL 78/2010 e porta la ritenuta dall'**8% all'11% dal 1° marzo 2024**. La ritenuta è operata da banche o Poste all'accredito e riduce il netto incassato dall'impresa. Nessuna fonte trovata indica variazioni per il 2026 — [ECnews](https://www.ecnews.it/fiscale/in-pratica/guida-agli-adempimenti/la-ritenuta-sui-bonifici-parlanti/); [Eutekne](https://www.eutekne.info/Sezioni/Art_993635_aumento_della_ritenuta_all_11_per_i_bonifici_parlanti_da_domani.aspx); [QuiFinanza](https://quifinanza.it/fisco-tasse/bonus-fiscali/casa-stangata-governo-anche-sui-bonifici-cosa-cambia/753918/amp/)
  - **Nota di correzione**: il brief ipotizzava "11% dal 1 marzo 2025". La data corretta, secondo le fonti, è il **1° marzo 2024**.
- [V] Base della ritenuta (circ. 40/E/2010): non comprende l'IVA. La circolare del 2010 forfettizzava l'IVA al 20% (importo diviso 1,2). Fonti più recenti descrivono lo scorporo con l'aliquota più elevata in vigore (22%), perché la banca non conosce l'aliquota effettiva — [FiscoeTasse](https://www.fiscoetasse.com/rassegna-stampa/13513-per-il-36-e-55-ritenuta-al-netto-iva.html); [ECnews](https://www.ecnews.it/fiscale/?p=26037)
- [V] Requisiti del bonifico parlante: causale con riferimento normativo e codice fiscale del beneficiario della detrazione. Se l'errore riguarda la causale l'agevolazione può essere salvata; un errore sulla ritenuta (bonifico ordinario anziché parlante) può richiedere un nuovo bonifico — [ECnews](https://www.ecnews.it/fiscale/in-pratica/guida-agli-adempimenti/la-ritenuta-sui-bonifici-parlanti/); [InvestireOggi](https://www.investireoggi.it/bonus-edilizi-dopo-manovra-2026-quando-serve-il-bonifico-parlante-e-quando-bastano-carta-o-bonifico-ordinario/)
- [N] Il bonifico parlante (DM 41/1998 e DM 19/2/2007) deve contenere:
  - la causale con la norma (es. "art. 16-bis DPR 917/86" o "art. 1 c.344-347 L. 296/2006");
  - il codice fiscale del beneficiario della detrazione;
  - la partita IVA (o CF) del beneficiario del pagamento, cioè Energenia.
  - Per l'ecobonus richiesto da titolari di reddito d'impresa il bonifico non è obbligatorio.
  - Fonte: [Normattiva TUIR](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1986-12-22;917)
- [N] Art. 25 DL 78/2010: la ritenuta si applica ai bonifici disposti per beneficiare di oneri deducibili o detrazioni d'imposta, a titolo d'acconto delle imposte sui redditi dovute dal beneficiario del pagamento. Per una SRL va a scomputo dell'IRES; l'eventuale eccedenza diventa credito d'imposta — [Normattiva DL 78/2010](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:2010-05-31;78)
- [N] Sconto in fattura e cessione del credito: bloccati dal 17/2/2023 (DL 11/2023), con deroghe residue eliminate dal DL 39/2024. Nel 2026 non sono praticabili per i nuovi interventi, salvo situazioni transitorie (titoli abilitativi ante 17/2/2023) e casi particolari (zone sisma). Il Superbonus nel 2026 è residuale (zone terremotate) — [Normattiva TUIR](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1986-12-22;917) *(non riletto)*

### Inferences
- [I] **Scrittura di incasso con ritenuta 11%** (esempio: fattura FV 10.000 + IVA 10% = 11.000; il cliente paga 11.000 con bonifico parlante):
  - se la banca scorpora al 22%: base 11.000/1,22 = 9.016,39; ritenuta 11% = 991,80; accredito 10.008,20;
  - se scorpora all'aliquota effettiva (10%): base 10.000; ritenuta 1.100; accredito 9.900.
  - Scrittura: Banca c/c D [netto accreditato]; Erario c/ritenute subite su bonifici D [differenza]; Crediti v/clienti A 11.000.
  - **Il software non deve ricalcolare la ritenuta in modo teorico ma leggere il netto dall'estratto conto** (CBI/CAMT) e imputare la differenza. In alternativa può proporre un valore stimato (11% su lordo/1,22) che l'utente conferma.
- [I] Riconciliazione bancaria: l'incasso netto non chiude la partita. Serve una regola automatica: se il movimento è un bonifico parlante (causale o codice transazione), la differenza fino all'11% del lordo scorporato va a "Ritenute subite" anziché lasciare un residuo aperto sul cliente. Con acconti multipli la ritenuta è per ogni bonifico.
- [I] A fine anno il saldo di "Erario c/ritenute subite" va riportato nella dichiarazione IRES (Redditi SC, quadro RN) e chiuso con la scrittura: Erario c/IRES (debito) D a Erario c/ritenute subite A.
- [I] La fattura per lavori agevolati non richiede diciture obbligatorie di legge, per quanto noto. È consigliato riportare:
  - intestazione al soggetto che sosterrà la spesa e fruirà della detrazione (con CF; se più beneficiari, indicazione o annotazione delle quote);
  - indirizzo e dati catastali dell'immobile;
  - descrizione dell'intervento coerente con la norma ("intervento ex art. 16-bis c.1 lett. h TUIR — impianto FV con accumulo", "ecobonus art. 14 DL 63/2013 — sostituzione impianto di climatizzazione invernale con pompa di calore");
  - la distinta 10% / 22% per i beni significativi;
  - promemoria al cliente: "pagamento mediante bonifico parlante".
- [I] Per gli interventi con risparmio energetico (FV, pompe di calore, solare termico) il cliente deve fare la comunicazione ENEA entro 90 giorni dalla fine lavori. Il software può generare un promemoria, ma non è un adempimento contabile di Energenia.
- [I] Lo sconto in fattura va disabilitato di default (feature flag "legacy").

### Gaps
- Testo della circ. 40/E/2010 e prassi bancaria attuale sullo scorporo IVA (20%, 22% o aliquota effettiva) non riletti: **da confermare con la banca di Energenia** guardando una contabile reale.
- Non ho verificato come le banche certifichino le ritenute (CU o altra certificazione) né i tempi.
- Non ho verificato se la L. 199/2025 abbia modificato l'art. 25 DL 78/2010 per coordinarlo con la nuova ritenuta B2B (le fonti indicano solo l'esclusione dalla ritenuta B2B dei pagamenti già soggetti all'art. 25).

---

## B5. Conto Termico 3.0, Transizione 5.0 e iperammortamento, sconto in fattura: impatti sulla fatturazione

### Takeaway
Su questi incentivi non ho potuto verificare nulla in sessione (budget di ricerca esaurito). Secondo le mie conoscenze, da confermare:
- il **Conto Termico 3.0** (DM MASE 7 agosto 2025, operativo dal 25 dicembre 2025 circa tramite GSE) estende l'incentivo alle imprese e ai privati per pompe di calore, solare termico, FV con accumulo abbinato alla sostituzione del generatore con pompa di calore, colonnine e building automation;
- **Transizione 5.0** (art. 38 DL 19/2024) è chiusa per i nuovi investimenti dal 2026;
- la L. 199/2025 ha introdotto un **iperammortamento** per gli investimenti 2026.

Per tutti questi regimi le fatture devono riportare i riferimenti richiesti dalle rispettive regole (es. per 5.0: "Beni agevolabili ai sensi dell'articolo 38 del decreto-legge 2 marzo 2024, n. 19").

### Cited Findings
- [N] Transizione 5.0: la fattura deve contenere il riferimento "art. 38 DL 19/2024". Per il FV agevolabile i moduli devono essere iscritti nel registro ENEA (art. 12 DL 181/2023) — [Normattiva TUIR (rinvio generale)](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1986-12-22;917) *(non verificato in sessione; URL del DL 19/2024 non aperto)*
- [N] Iperammortamento 2026 previsto dalla L. 199/2025 — [Normattiva L. 199/2025](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2025-12-30;199) *(commi, beni ammessi e dicitura in fattura NON verificati)*
- [N] Conto Termico 3.0: DM 7/8/2025. Il GSE eroga l'incentivo al soggetto responsabile, o alla ESCO o installatore con mandato all'incasso. Le Regole applicative GSE (già nel CT 2.0) chiedono fatture intestate al soggetto responsabile, voci di spesa dettagliate e pagamenti tracciabili (bonifico) con riferimenti alla fattura — nessun URL verificato.

### Inferences
- [I] Nel software, prevedere sulla commessa un campo "incentivo" (Bonus casa / Ecobonus / Conto Termico 3.0 / Iperammortamento / Transizione 5.0 legacy / nessuno) che:
  - (a) inserisce in fattura le diciture parametriche richieste;
  - (b) imposta le regole di incasso: bonifico parlante con ritenuta 11% per le detrazioni; bonifico ordinario per il Conto Termico, senza ritenuta;
  - (c) per il CT 3.0 con mandato all'incasso, gestisce un credito verso GSE separato dal credito verso il cliente.
- [I] Il Conto Termico non è cumulabile con le detrazioni fiscali sullo stesso intervento (regola generale ricordata, non verificata): il campo deve essere esclusivo.

### Gaps
- Mancano: testo e Regole applicative del CT 3.0 (requisiti di fatture e bonifici, causali, eventuale obbligo di dicitura), commi e diciture dell'iperammortamento L. 199/2025, data di chiusura definitiva di Transizione 5.0 e regime transitorio. **Da ricercare in un secondo giro** (GSE, MIMIT, AdE).

---

## B6. Split payment (art. 17-ter DPR 633/72) nel 2026

### Takeaway
Lo split payment è **prorogato fino al 30 giugno 2029** con la Decisione di esecuzione (UE) 2026/1728 del Consiglio, adottata il 10/7/2026 e pubblicata in GUUE il 15/7/2026, con effetto dal 1/7/2026 senza soluzione di continuità. Il MEF, con il comunicato n. 77 del 30/6/2026, aveva già confermato la prosecuzione. È probabilmente l'ultima proroga. Le società quotate nel FTSE MIB ne sono escluse dal 1/7/2025.

### Cited Findings
- [V] La Decisione di esecuzione (UE) 2026/1728 è stata adottata il 10/7/2026 e pubblicata in GUUE il 15/7/2026, con efficacia fino al 30/6/2029 e decorrenza 1/7/2026. La proposta della Commissione è del 17/6/2026 (COM(2026) 281); l'Italia aveva chiesto il 31/12/2029. Le fonti citano il numero della decisione in modo leggermente diverso ("2026/1728" e "172872026") — [Namirial Focus](https://focus.namirial.com/it/split-payment-proroga-2029-cosa-cambia-per-imprese-pa/); [Orizzonte Scuola](https://www.orizzontescuola.it/split-payment-prorogato-fino-al-30-giugno-2029-confermata-la-procedura-per-le-scuole/); [MySolution](https://www.mysolution.it/fisco/approfondimenti/commenti/2026/07/split-payment-confermato-fino-al-30-giugno-2029-proroga-ue-e-quadro-operativo-della-disciplina-setti/); [FiscoeTasse](https://www.fiscoetasse.com/new-rassegna-stampa/4127-split-payment-prorogato-al-30-giugno-2029.html)
- [V] Il comunicato MEF n. 77 del 30/6/2026 consente di continuare ad applicare lo split payment dopo il 30/6/2026. L'autorizzazione precedente era la Decisione (UE) 2023/1552, valida dal 1/7/2023 al 30/6/2026 — [MySolution 1/7/2026](https://www.mysolution.it/fisco/informazioni/news/2026/07/01/split-payment-dopo-il-30-06.-indicazioni-del-mef); [ANCE](https://ance.it/wp-content/uploads/allegati/ANCE_Proroga_SplitPayment_al_30_giugno_2026.pdf)
- [V] La Commissione considera questa l'ultima deroga e monitorerà i tempi di rimborso IVA ai fornitori (relazione italiana entro il 30/9/2027) — [Studio Pizzano](https://www.studiopizzano.it/split-payment-proroga-2029-ultimo-rinnovo-e-nodo-rimborsi-iva/)
- [V] Dal 1/7/2025 le società quotate nell'indice FTSE MIB e identificate ai fini IVA sono escluse dallo split payment (art. 17-ter c.1-bis lett. d). La norma di modifica non è stata verificata — [sintesi dei risultati di ricerca, fonti come sopra](https://focus.namirial.com/it/split-payment-proroga-2029-cosa-cambia-per-imprese-pa/)
- [N] Art. 17-ter DPR 633/72:
  - per cessioni e prestazioni verso PA, enti e società controllate dalla PA indicate negli elenchi MEF, l'IVA è versata dal cessionario;
  - la fattura riporta "scissione dei pagamenti" (DM 23/1/2015) ed esigibilità "S";
  - escluse le operazioni in reverse charge e (dal DL 87/2018) i compensi soggetti a ritenuta.
  - Il fornitore annota la fattura nel registro vendite ma non computa l'IVA in liquidazione, e può chiedere il rimborso prioritario (art. 30 c.2 lett. a).
  - Gli elenchi MEF dei soggetti si pubblicano su finanze.gov.it.
  - Fonte: [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)

### Inferences
- [I] Anagrafica clienti: flag "split payment" con data di validità, aggiornabile dagli elenchi MEF annuali. Più una regola che disattiva lo split se la riga è in reverse charge (N6.x).
- [I] Data di cessazione da parametrizzare a 30/6/2029, con avviso al 2029.

### Gaps
- Atto normativo nazionale dell'esclusione FTSE MIB dal 1/7/2025 non verificato.
- Pubblicazione degli elenchi MEF 2027 non verificata.

---

## B7. IVA per cassa, fatture B2C, note di variazione, acconti e SAL, fattura differita

### Takeaway
- **IVA per cassa** (art. 32-bis DL 83/2012): opzione per volume d'affari ≤ €2 milioni. Vale solo per le operazioni verso soggetti IVA (B2B), con esclusione di reverse charge e split payment; per un installatore con molti clienti privati il beneficio è limitato.
- **Momento impositivo**:
  - appalti o prestazioni di installazione: all'atto del pagamento (art. 6 c.3), quindi ogni acconto o SAL incassato fa scattare l'obbligo di fattura entro 12 giorni;
  - cessioni con posa (beni mobili): alla consegna;
  - fattura o pagamento anticipato: anticipa l'operazione per quell'importo (art. 6 c.4).
- **Note di credito** (art. 26):
  - in aumento: sempre obbligatorie;
  - in diminuzione: senza limite temporale per nullità, annullamento, revoca, risoluzione, rescissione, mancato pagamento da procedure concorsuali o esecutive (con il vincolo della detrazione entro la dichiarazione dell'anno in cui si verifica il presupposto);
  - entro 1 anno per sopravvenuto accordo o rettifica di inesattezze.
- **Fatture B2C**: codice fiscale del cliente obbligatorio.

### Cited Findings
- [N] Art. 32-bis DL 83/2012:
  - opzione con volume d'affari ≤ €2.000.000;
  - l'IVA diventa esigibile all'incasso, e comunque dopo 1 anno dall'operazione;
  - la detrazione per chi opta avviene al pagamento;
  - esclusi i regimi speciali, il reverse charge, lo split payment e le operazioni verso cessionari che non agiscono nell'esercizio d'impresa;
  - la fattura deve riportare "operazione con IVA per cassa ai sensi dell'art. 32-bis del DL 83/2012".
  - Fonte: [Normattiva DL 83/2012](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:2012-06-22;83)
- [N] Art. 6 DPR 633/72:
  - c.1: cessioni di beni mobili alla consegna o spedizione;
  - c.3: prestazioni di servizi all'atto del pagamento del corrispettivo;
  - c.4: se prima di tali eventi è emessa fattura o è pagato in tutto o in parte il corrispettivo, l'operazione si considera effettuata, limitatamente all'importo fatturato o pagato, alla data della fattura o del pagamento.
  - Fonte: [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)
- [N] Art. 21 DPR 633/72:
  - c.4: fattura immediata emessa entro 12 giorni dall'effettuazione;
  - fattura differita (c.4 lett. a) per cessioni con DDT o prestazioni individuabili da idonea documentazione, emessa entro il 15 del mese successivo;
  - c.2 lett. f: per il cliente non soggetto IVA residente va indicato il codice fiscale;
  - art. 21-bis: fattura semplificata fino a €400.
  - Fonte: [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)
- [N] Art. 26 DPR 633/72:
  - c.1: variazioni in aumento obbligatorie;
  - c.2: variazioni in diminuzione facoltative per nullità, annullamento, revoca, risoluzione, rescissione, mancato pagamento per procedure concorsuali (dalla data di apertura, dopo il DL 73/2021) o esecutive individuali infruttuose, e per abbuoni o sconti contrattuali;
  - c.3: entro 1 anno dall'operazione per sopravvenuto accordo o per rettifica di inesattezze della fatturazione.
  - Il cessionario deve registrare la variazione a debito.
  - Il termine per la detrazione segue l'art. 19 (dichiarazione dell'anno del presupposto).
  - Fonte: [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)

### Inferences
- [I] Workflow di commessa per gli installatori:
  - (1) contratto (tipo: appalto oppure vendita con posa);
  - (2) acconto all'ordine → fattura d'acconto (con l'aliquota dell'operazione finale; se B2B su edificio, N6.7) emessa entro 12 gg dall'incasso, con data operazione = data incasso;
  - (3) SAL: nell'appalto l'approvazione del SAL **non** fa scattare la fattura, che scatta al pagamento. Si può emettere prima, e allora l'IVA è esigibile alla data della fattura;
  - (4) saldo a fine lavori o collaudo;
  - (5) fattura finale con storno degli acconti (righe negative con stessa aliquota o natura).
- [I] Per le vendite con posa e DDT: possibile fattura differita mensile. Per i privati con bonus è sconsigliata (serve chiarezza per il bonifico parlante).
- [I] Note di credito: il software deve chiedere la "causale art. 26" (accordo / risoluzione / procedura concorsuale / errore) e controllare il termine di 1 anno quando applicabile. Oltre l'anno, per un accordo, propone una nota di credito "fuori campo IVA art. 26" con il solo imponibile.
- [I] IVA per cassa: per un'impresa a prevalenza B2C e con molte operazioni in reverse charge l'opzione è poco utile. Tenere comunque i flag (attivo e passivo), perché i fornitori possono adottarla.

### Gaps
- Non ho riletto l'art. 32-bis né il DM 11/7/2013 attuativo, quindi la soglia e le esclusioni restano da confermare.
- Qualificazione appalto vs cessione con posa per il FV: non ho trovato in sessione la prassi AdE specifica (criterio della prevalenza e della volontà delle parti).

---

## B8. Novità 2025-2026, norme pendenti e aspetti da parametrizzare per data

### Takeaway
Le novità verificate rilevanti per il software sono:
- proroga del bonus casa ed ecobonus al 50%/36% per il 2026 (36%/30% nel 2027);
- nuova ritenuta B2B 0,5% (2028) e 1% (2029) della L. 199/2025;
- proroga dello split payment al 30/6/2029;
- conferma della ritenuta 11% sui bonifici parlanti dal 1/3/2024.

Non verificati ma probabili: il riordino dell'IVA in un Testo unico con decorrenza 2027, che rinumererebbe gli articoli citati nelle diciture di fattura, e l'iperammortamento 2026. Il software deve gestire **norme, diciture, aliquote e soglie come tabelle con validità temporale**.

### Cited Findings
- [V] Bonus casa ed ecobonus 2026: 50% / 36%; 2027: 36% / 30% — [Ediltecnico](https://ediltecnico.it/bonus-edilizi-2026-legge-di-bilancio/); [Centro Fiscale](https://centrofiscale.com/bonus-casa-2026/)
- [V] Ritenuta B2B L. 199/2025 art. 1 c.112-114: 0,5% nel 2028, 1% dal 2029 — [MySolution](https://www.mysolution.it/fisco/informazioni/news/2026/01/02/nuova-ritenuta-dacconto-tra-imprese-dal-2028/); [Confartigianato](https://www.confartigianato.it/storage/2025/12/Legge-Bilancio_Infografiche-2026-ok.pdf)
- [V] Split payment al 30/6/2029 (Decisione UE 2026/1728) — [Namirial](https://focus.namirial.com/it/split-payment-proroga-2029-cosa-cambia-per-imprese-pa/)
- [V] Ritenuta bonifici parlanti all'11% dal 1/3/2024 (L. 213/2023 c.88) — [ECnews](https://www.ecnews.it/fiscale/in-pratica/guida-agli-adempimenti/la-ritenuta-sui-bonifici-parlanti/)

### Inferences
- [I] Tabelle parametriche consigliate, tutte con `valido_dal` / `valido_al`:
  - (1) aliquote IVA e riferimenti normativi per caso d'uso (B1);
  - (2) codici natura e diciture (N6.3, N6.7, N3.5…);
  - (3) soggetti in split payment (elenchi MEF) e data di fine regime;
  - (4) aliquota ritenuta sui bonifici parlanti (8% fino al 29/2/2024, 11% dal 1/3/2024);
  - (5) ritenuta B2B (0% fino al 2027, 0,5% nel 2028, 1% dal 2029; esclusioni);
  - (6) aliquote delle detrazioni per la reportistica cliente (2026: 50/36; 2027: 36/30);
  - (7) soglie: contante €5.000, liquidazione trimestrale 500k/800k, IVA per cassa €2 mln, fattura semplificata €400, minimo versamento IVA;
  - (8) scadenzario fiscale (16 mensile, LIPE, 27/12, 16/3, 30/4, 31/10, CU 16/3).
- [I] Se dal 2027 entra in vigore un Testo unico IVA, i riferimenti "art. 17 c.6 lett. a-ter DPR 633/72", "n. 127-quinquies Tab. A" ecc. potrebbero cambiare numerazione. Le diciture vanno quindi in tabella, non nel codice.

### Gaps
- **Testo unico IVA**: non ho potuto verificare se il decreto legislativo di riordino sia stato approvato definitivamente e da quando decorre (ricordo un'ipotesi di efficacia dal 1/1/2027, non confermata).
- Non verificate eventuali modifiche 2026 a: soglie della liquidazione trimestrale, soglia minima di versamento IVA, termini CU e 770, reverse charge energetico, Conto Termico 3.0 e iperammortamento.
- Le ricerche non sono state completate per limiti tecnici (DNS di WebFetch e budget WebSearch). Un secondo giro dovrebbe privilegiare agenziaentrate.gov.it (circ. 14/E e 37/E 2015, 36/E 2013, 15/E 2018, 1/E 2018, risposte su accumuli e pompe di calore), gse.it (Regole applicative CT 3.0), normattiva.it (L. 199/2025 commi su ritenuta B2B e iperammortamento) e finanze.gov.it (split payment).
