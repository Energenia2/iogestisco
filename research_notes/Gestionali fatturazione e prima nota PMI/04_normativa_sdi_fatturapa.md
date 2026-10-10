# Normativa e specifiche tecniche SdI / FatturaPA (stato a ottobre 2026) — requisiti funzionali per un software di fatturazione attiva e passiva

> **Nota metodologica (leggere prima).** Ricerca svolta il 10/10/2026. In questa sessione il proxy di rete ha bloccato sia WebFetch sia curl verso tutti i domini (agenziaentrate.gov.it, fatturapa.gov.it, eur-lex, normattiva, ecc.). Le evidenze provengono quindi solo dai **riassunti dei risultati WebSearch** (titolo, URL, estratti), non dalla lettura integrale dei PDF ufficiali. Il budget di ricerca si è esaurito prima di poter verificare alcuni punti (vedi "Gaps"). Le voci marcate **[NV]** sono conoscenza consolidata delle specifiche e della normativa **non verificata in questa sessione**: sono indicate con l'URL ufficiale dove vanno controllate. Vanno trattate come ipotesi di lavoro finché lo sviluppatore non le confronta con l'Allegato A v1.9.1 e con l'"Elenco controlli".

---

## 1. Versione corrente delle specifiche tecniche, schema XSD, fattura semplificata, elenco controlli

### Takeaway
A ottobre 2026 la versione in vigore è **"Allegato A – Specifiche tecniche v1.9.1"**: pubblicata dall'AdE il 31/03/2026 e applicata dallo SdI dal **15/05/2026**. Da quella data i file non conformi vengono scartati. Rispetto alla v1.9 (in vigore dal 01/04/2025, che ha introdotto TD29 e RF20) le modifiche sono quattro. La prima è il nuovo controllo **00327** sui Gruppi IVA. La seconda è il valore **ESENZSPORT** in AltriDatiGestionali per i lavoratori sportivi. La terza è l'aggiornamento delle procedure di accreditamento dei canali WS/SFTP. La quarta è l'innalzamento del limite dei codici destinatario per soggetto da 100 a 300. I formati restano FPA12 (verso PA), FPR12 (verso privati) e FSM10 (fattura semplificata).

### Cited Findings
- La versione corrente è la 1.9.1; la 1.9 è stata usata dal 1° aprile 2025; la 1.9.1 è "utilizzabile dal 15 maggio 2026"; documento ufficiale "Allegato A – Specifiche tecniche vers. 1.9.1" — [AdE, Allegato A v1.9.1 (PDF)](https://www.agenziaentrate.gov.it/portale/documents/d/guest/allegato-a-specifiche-tecniche-vers-1-9-1); [AdE – Normativa, prassi e regole tecniche fatture elettroniche](https://www.agenziaentrate.gov.it/portale/normativa-prassi-e-regole-tecniche-fatture-elettroniche); copia del PDF: [FiscoeTasse](https://www.fiscoetasse.com/files/21704/e-fatture-specifiche-tecniche191-2026.pdf)
- Data di pubblicazione della 1.9.1: 31/03/2026 secondo il sito AdE e la stampa specializzata; PwC indica il 15/04/2026, quindi le fonti divergono sulla pubblicazione ma non sull'efficacia (15/05/2026) — [IPSOA 02/04/2026](https://www.ipsoa.it/documents/quotidiano/2026/04/02/e-fattura-nuove-specifiche-tecniche-15-maggio-2026); [PwC TLS blog 22/04/2026](https://blog.pwc-tls.it/en/2026/04/22/e-invoicing-updated-technical-specifications-and-changes/); [Eutekne](https://www.eutekne.info/Sezioni/Art_1099301_aggiornamenti_alle_specifiche_tecniche_per_la_fattura_elettronica.aspx)
- "Dal 15 maggio 2026 il SdI applicherà automaticamente il nuovo tracciato … le fatture trasmesse con la versione precedente saranno scartate" — [PMI.it](https://www.pmi.it/tecnologia/software-e-web/493394/fattura-elettronica-specifiche-tecniche-sdi-1-9-1.html); [Edotto](https://www.edotto.com/articolo/fatturazione-elettronica-nuove-specifiche-tecniche-dal-15-maggio-2026); [Fisco7 05/2026](https://www.fisco7.it/2026/05/fattura-elettronica-nuovo-tracciato-dal-15-maggio-2026/)
- Novità 1.9.1, quattro in tutto: (1) **controllo 00327**: se nel cessionario manca l'IdFiscaleIVA ed è indicato un CodiceFiscale, lo SdI verifica che quel CF appartenga a uno dei partecipanti del Gruppo IVA; se il CF è riferibile al Gruppo IVA nel suo insieme, il file viene scartato. Il controllo si applica al campo CodiceFiscale del cessionario (1.4.1.2 nella fattura ordinaria, 1.3.1.2 nella semplificata) e si affianca ai controlli 00321/00322/00325/00326. (2) Nuova stringa **ESENZSPORT** in AltriDatiGestionali per i compensi a lavoratori sportivi dilettantistici in esenzione IRPEF. (3) Procedure di accreditamento dei canali WS e SFTP aggiornate. (4) Il limite dei codici destinatario richiedibili passa da 100 a **300** — [ApriDigitale – guida sviluppatori 1.9.1](https://www.apridigitale.it/fatturazione-elettronica/guida-sviluppatori-1-9-1); [Studio Pizzano](https://www.studiopizzano.it/fattura-elettronica-versione-1-9-1-cosa-cambia-dal-15-maggio-2026/); [IPSOA 06/05/2026](https://www.ipsoa.it/documents/quotidiano/2026/05/06/e-fattura-nuove-specifiche-tecniche-15-maggio-2026); [CE System](https://www.cesystemweb.it/news/nuove-specifiche-tecniche-e-fattura-in-vigore-dal-15-maggio-2026-283)
- Versione 1.9 (pubblicata il 31/01/2025, efficace dal 01/04/2025): nuovo TipoDocumento **TD29**, nuova descrizione di **TD20**, nuovo regime **RF20** (franchigia IVA transfrontaliera, Dir. UE 2020/285, recepita con D.Lgs. 180/2024), e **eliminazione del limite di 400 € per le fatture semplificate** emesse in regime forfettario o in franchigia transfrontaliera. Lo schema XSD della fattura ordinaria è stato modificato per aggiungere TD29 — [Fabersystem](https://www.fabersystem.it/novita-dal-1-aprile-2025-nuove-specifiche-tecniche-per-la-fatturazione-elettronica-ecco-cosa-cambia/); [Informazione Fiscale](https://www.informazionefiscale.it/Fattura-elettronica-2025-specifiche-tecniche-codice-TD29); [Studio Pizzano v1.9](https://www.studiopizzano.it/fatturazione-elettronica-2025-in-vigore-le-specifiche-tecniche-v1-9/); [Forum Italia – v1.9](https://forum.italia.it/t/specifiche-tecniche-versione-1-9/43764); [Il Sole 24 Ore NT+ Fisco](https://ntplusfisco.ilsole24ore.com/art/fattura-elettronica-software-aggiornati-gestire-documenti-td29-e-franchigia-iva-transfrontaliera-AH3KnUR); copia v1.9: [Allegato A v1.9 (PDF)](https://complyplatform.com/wp-content/uploads/2025/04/Allegato-A-Specifiche-tecniche-vers-1.9.pdf)
- Documento AdE "Variazioni alle specifiche tecniche" del 12/03/2025: storico ufficiale delle variazioni — [AdE PDF](https://www.agenziaentrate.gov.it/portale/documents/20143/8642159/Variazioni+alle+specifiche+tecniche+fatture+elettroniche2025-03-12.pdf/d5819f47-17af-7de0-dce7-933ce9d325a4?t=1741782287707)
- FormatoTrasmissione: per le fatture B2B/B2C va valorizzato "FPR12"; il valore non è stato modificato dalla v1.9 — [FiscoeTasse – Allegato A v1.9](https://www.fiscoetasse.com/files/19533/fattura-elettrnocha-specifiche-1-9-2925.pdf)
- Contraddizione da segnalare: una guida commerciale del 2026 afferma che le specifiche "rimangono sostanzialmente invariate rispetto alla versione 1.7.1". L'affermazione è **errata**, perché contraddetta dalla pubblicazione ufficiale della 1.9 e della 1.9.1 — [CentroFiscale](https://centrofiscale.com/specifiche-tecniche-fattura-elettronica-2026/), contraddetto da [AdE Allegato A v1.9.1](https://www.agenziaentrate.gov.it/portale/documents/d/guest/allegato-a-specifiche-tecniche-vers-1-9-1)
- **[NV]** Tracciati: FatturaPA ordinaria (FPA12/FPR12; namespace `http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2`) e FatturaElettronicaSemplificata (FSM10; namespace `.../v1.0`). Sono pubblicati come file XSD con rappresentazione tabellare, fogli di stile XSL ed **"Elenco controlli"** (codici 00001–00499, raggruppati per categoria: nomenclatura e unicità del file, firma, validità di P.IVA e CF, coerenza di codici e importi) nella sezione documentazione di fatturapa.gov.it / AdE — [AdE – Normativa e regole tecniche](https://www.agenziaentrate.gov.it/portale/normativa-prassi-e-regole-tecniche-fatture-elettroniche)
- **[NV]** Fattura semplificata (FSM10, art. 21-bis DPR 633/72): ammessa per importi complessivi fino a 400 € (DM 10/05/2019) e per le note di variazione (TD08/TD09) senza limite. Dalla v1.9 il limite non si applica a forfettari e franchigia transfrontaliera (quest'ultimo punto è confermato da [Fabersystem](https://www.fabersystem.it/novita-dal-1-aprile-2025-nuove-specifiche-tecniche-per-la-fatturazione-elettronica-ecco-cosa-cambia/))

### Inferences
- Il software deve generare XML conforme a **v1.9.1** e versionare internamente le regole di validazione, cioè avere un motore di regole aggiornabile, perché l'AdE rilascia variazioni circa ogni 12–18 mesi (1.7.1 nel 2022, 1.8 nel 2023/24, 1.9 nel 2025, 1.9.1 nel 2026). Ogni volta concede un preavviso di circa 6–10 settimane, dopo il quale i file non conformi vengono scartati.
- La 1.9.1 sembra **non modificare l'XSD**: ESENZSPORT è un valore libero in AltriDatiGestionali e 00327 è un controllo semantico. È probabile che i parser già allineati alla v1.9 restino validi. Non verificato.
- Un validatore locale pre-invio deve replicare almeno: validazione XSD, il controllo 00327 sul Gruppo IVA (per il passivo/autofatture e per l'anagrafica clienti) e i controlli di coerenza sugli importi dell'Elenco controlli.
- Dal 01/01/2027 entra in vigore il Testo unico IVA (vedi §15). È ragionevole attendersi una nuova versione delle specifiche, o almeno delle descrizioni dei codici Natura e TD che citano articoli del DPR 633/72. È un'inferenza, non c'è un annuncio ufficiale trovato.

### Gaps
- Non è stato possibile leggere il PDF della v1.9.1 né l'"Elenco controlli" aggiornato: mancano il nome e la versione esatti dei file XSD (es. se lo schema FPR12 è stato rinumerato con la v1.9), l'elenco completo dei codici errore e le regole di compilazione di ESENZSPORT.
- Non sono emerse evidenze di versioni successive alla 1.9.1 (es. una 1.9.2 o una 2.0 per il 2027), ma la verifica è stata interrotta dall'esaurimento del budget di ricerca.

---

## 2. TipoDocumento (TD01–TD29)

### Takeaway
I codici TD validi nel tracciato ordinario sono TD01–TD06 e TD16–TD29. Nel tracciato semplificato si usano TD07–TD09. Il codice più recente è **TD29**, introdotto con la v1.9 e operativo dal 01/04/2025: è la comunicazione del cessionario per omessa o irregolare fatturazione (art. 6 c.8 D.Lgs. 471/97 come riformato dal D.Lgs. 87/2024).

### Cited Findings
- TD01 Fattura; TD02 Acconto/anticipo su fattura; TD04 Nota di credito; TD05 Nota di debito — [Money.it](https://www.money.it/codici-fatturazione-elettronica-elenco-codici); [Flextax](https://flextax.it/codici-fatture-elettroniche/)
- TD26 "Cessione di beni ammortizzabili e per passaggi interni"; TD27 "Fattura per autoconsumo o per cessioni gratuite senza rivalsa"; TD24/TD25 fatture differite ex art. 21 c.4 DPR 633/72 — [Flextax](https://flextax.it/codici-fatture-elettroniche/)
- TD28 (dalla v1.7.1, 2022): acquisti da San Marino con IVA addebitata in fattura cartacea, da usare in luogo di TD17/TD19 (che servono per fatture sammarinesi senza IVA). Una versione successiva lo ha esteso alla comunicazione di operazioni con l'estero non correttamente assoggettate a reverse charge — [Variazioni specifiche 30/09/2022 (PDF)](https://www.lentepubblica.it/wp-content/uploads/2022/10/Variazioni-alle-specifiche-tecniche-fatture-elettroniche-2022-09-30.pdf); [Agenda Digitale](https://www.agendadigitale.eu/documenti/fatturazione-elettronica/fattura-elettronica-le-nuove-specifiche-tecniche-dal-primo-ottobre-cosa-cambia/); [Agenda Digitale 2024](https://www.agendadigitale.eu/documenti/fattura-elettronica-2024-cambiano-tracciato-ed-elenco-controlli-cosa-fare/)
- TD29: comunicazione all'AdE dell'omessa o irregolare fatturazione da parte del cessionario/committente. Va trasmessa via SdI **entro 90 giorni** dal termine in cui la fattura doveva essere emessa, o dall'emissione della fattura irregolare. Sostituisce il vecchio meccanismo autofattura + versamento (TD20) previsto dall'art. 6 c.8. Se il cessionario non comunica, la sanzione è del 70% dell'imposta con minimo 250 € — [Informazione Fiscale](https://www.informazionefiscale.it/Fattura-elettronica-2025-specifiche-tecniche-codice-TD29); [IPSOA 29/03/2025](https://www.ipsoa.it/documents/quotidiano/2025/03/29/td29-1-aprile-omessa-irregolare-fatturazione); [Baker Tilly](https://www.bakertilly.it/insights/regolarizzazione-da-parte-del-cessionario-o-committente-con-codice-td29); [QuotidianoPiù](https://www.quotidianopiu.it/dettaglio/11089054/fatture-omesse-o-irregolari-nuove-specifiche-tecniche-da-aprile-2025)
- TD20 dopo la v1.9: resta per le regolarizzazioni ex art. 6 c.9-bis D.Lgs. 471/97 (inversione contabile) e art. 46 c.5 DL 331/93 (acquisti intra-UE) — [Fabersystem](https://www.fabersystem.it/novita-dal-1-aprile-2025-nuove-specifiche-tecniche-per-la-fatturazione-elettronica-ecco-cosa-cambia/)
- Questione aperta: non è chiaro come regolarizzare le violazioni commesse tra il 01/09/2024 e il 31/03/2025, cioè prima che TD29 fosse operativo — [IPSOA 29/03/2025](https://www.ipsoa.it/documents/quotidiano/2025/03/29/td29-1-aprile-omessa-irregolare-fatturazione)
- Esterometro: TD17 (servizi dall'estero), TD18 (beni intra-UE), TD19 (beni ex art. 17 c.2 già in Italia) — [Fiscomania – autofattura](https://fiscomania.com/autofattura-guida-casi-emissione/)

**Tabella completa** (descrizioni come da Allegato A; righe **[NV]** non confermate singolarmente in sessione, fonte da verificare: [Allegato A v1.9.1](https://www.agenziaentrate.gov.it/portale/documents/d/guest/allegato-a-specifiche-tecniche-vers-1-9-1))

| Codice | Descrizione | Tracciato | Uso tipico nel software |
|---|---|---|---|
| TD01 | Fattura | FPR/FPA | Fattura immediata, attiva |
| TD02 | Acconto/anticipo su fattura | FPR/FPA | Acconti |
| TD03 | Acconto/anticipo su parcella [NV] | FPR/FPA | Professionisti |
| TD04 | Nota di credito | FPR/FPA | Note di variazione in diminuzione |
| TD05 | Nota di debito | FPR/FPA | Note in aumento |
| TD06 | Parcella [NV] | FPR/FPA | Professionisti |
| TD07/TD08/TD09 | Fattura / nota di credito / nota di debito semplificata [NV] | solo FSM10 | Fattura semplificata |
| TD16 | Integrazione fattura reverse charge interno [NV] | FPR | Passivo: integrazione per reverse charge domestico |
| TD17 | Integrazione/autofattura acquisto servizi dall'estero | FPR | Passivo estero (UE ed extra-UE) |
| TD18 | Integrazione acquisto beni intracomunitari | FPR | Passivo UE beni |
| TD19 | Integrazione/autofattura acquisto beni ex art. 17 c.2 | FPR | Beni già in Italia da non residente |
| TD20 | Autofattura per regolarizzazione/integrazione (art. 6 c.9-bis D.Lgs. 471/97; art. 46 c.5 DL 331/93) | FPR | Regolarizzazioni |
| TD21 | Autofattura per splafonamento [NV] | FPR | Esportatori abituali |
| TD22 | Estrazione beni da deposito IVA [NV] | FPR | Depositi IVA |
| TD23 | Estrazione beni da deposito IVA con versamento IVA [NV] | FPR | Depositi IVA |
| TD24 | Fattura differita art. 21 c.4 lett. a) (con DDT o documento idoneo) | FPR/FPA | Differita mensile |
| TD25 | Fattura differita art. 21 c.4 terzo periodo lett. b) (triangolari interne) [NV per la lettera] | FPR/FPA | Triangolazioni nazionali |
| TD26 | Cessione beni ammortizzabili e passaggi interni | FPR | Cespiti |
| TD27 | Autoconsumo o cessioni gratuite senza rivalsa | FPR | Omaggi e autoconsumo |
| TD28 | Acquisti da San Marino con IVA (fattura cartacea) | FPR | Passivo San Marino |
| TD29 | Comunicazione omessa o irregolare fatturazione (art. 6 c.8 D.Lgs. 471/97) | FPR | Passivo, entro 90 giorni |

### Inferences
- Per il ciclo **passivo** il software deve generare documenti "auto-emessi" (TD16–TD23, TD28, TD29). In questi documenti il **cedente/prestatore è il fornitore** e il cessionario è l'azienda stessa (per TD17/18/19/28/29 il fornitore estero o inadempiente va nel blocco CedentePrestatore). Servono quindi dei flussi dedicati. Le regole di compilazione puntuali vanno verificate nella "Guida alla compilazione delle fatture elettroniche" dell'AdE, non reperita in sessione.
- Per TD29 serve un scadenziario a 90 giorni sulle fatture passive attese o irregolari, per esempio sulle consegne con DDT ricevuti ma senza fattura entro 12 giorni o entro il 15 del mese successivo.

### Gaps
- Testo esatto delle descrizioni ufficiali di TD03, TD06, TD16, TD21–TD23 e regole di compilazione TD29 (blocchi obbligatori, aliquota/imposta da indicare): non verificati, perché il PDF ufficiale non era accessibile.

---

## 3. Codici tabellari: Natura, EsigibilitaIVA, RegimeFiscale, ModalitaPagamento, CondizioniPagamento, Ritenute, Cassa, Bollo

### Takeaway
Le codifiche sono stabili dal 2021 (v1.6: Natura con sottocodici). Le uniche aggiunte recenti sono **RF20** (v1.9) e la stringa **ESENZSPORT** in AltriDatiGestionali (v1.9.1). Attenzione: **RF19 = forfettario**, **RF20 = franchigia IVA transfrontaliera**. Una fonte secondaria indica erroneamente RF20 come forfettario.

### Cited Findings
- Natura (significati confermati da più fonti secondarie): N1 escluse ex art. 15; N2.1 non soggette artt. 7–7-septies; N2.2 non soggette, altri casi (le fonti divergono: una lo collega alle fatture dei forfettari, un'altra lo descrive come residuale); N3.1 non imponibili esportazioni; N3.6 non imponibili, altre operazioni (gli esempi variano); N6.1 reverse charge rottami; N6.2–N6.8 oro/argento, subappalto edile, fabbricati, cellulari, prodotti elettronici, comparto edile, settore energetico; N6.9 altri casi di inversione; N7 IVA assolta in altro Stato UE (vendite a distanza, servizi TTE) — [Danea](https://www.danea.it/blog/fattura-elettronica-nuove-codifiche-per-documenti-e-natura-iva/); [Fiscomania – codici](https://fiscomania.com/codici-fattura-elettronica/); [Studio Penta circ. 860](https://studiopenta.it/circolare-n-860-nuovi-codici-natura-sulle-fatture-elettroniche/14711/); [Studio Cominotto Cantoni](https://www.studiocominottocantoni.it/it/blog/imposte/tabella-sintetica-codici-natura-fatturazione-elettronica.html)
- ModalitaPagamento: MP01 contanti … MP23 PagoPA (MP23 introdotto con le specifiche 2021) — [fex-app ModalitaPagamento](https://fex-app.com/FatturaElettronica/FatturaElettronicaBody/DatiPagamento/DettaglioPagamento/ModalitaPagamento); [Finom](https://finom.co/it-it/blog/codici-fattura-elettronica/)
- TipoRitenuta: RT01 persone fisiche; RT02 persone giuridiche; RT03 contributo INPS; RT04 ENASARCO; RT05 ENPAM; RT06 altro contributo previdenziale — [fex-app TipoRitenuta](https://fex-app.com/FatturaElettronica/FatturaElettronicaBody/DatiGenerali/DatiGeneraliDocumento/DatiRitenuta/TipoRitenuta); [Wise](https://www.wise.pro/codifiche-fattura-elettronica-b2b/)
- TipoCassa: TC01 Cassa Forense … TC22 INPS — [F24editabile – codici](https://f24editabile.com/strumenti-utili/codici-fatturazione-elettronica/); [Fiscomania – codici](https://fiscomania.com/codici-fattura-elettronica/)
- RF20 = regime transfrontaliero di franchigia IVA (Dir. 2020/285, D.Lgs. 180/2024, operativo dal 01/01/2025) — [Fabersystem](https://www.fabersystem.it/novita-dal-1-aprile-2025-nuove-specifiche-tecniche-per-la-fatturazione-elettronica-ecco-cosa-cambia/); [Il Sole 24 Ore NT+](https://ntplusfisco.ilsole24ore.com/art/fattura-elettronica-software-aggiornati-gestire-documenti-td29-e-franchigia-iva-transfrontaliera-AH3KnUR). Una guida ([Finom](https://finom.co/it-it/blog/codici-fattura-elettronica/)) lo descrive come "forfettario": **errore**, il forfettario è RF19 (vedi tabella).
- ESENZSPORT in AltriDatiGestionali (v1.9.1) per i compensi a lavoratori sportivi dilettantistici esenti IRPEF — [Studio Pizzano](https://www.studiopizzano.it/fattura-elettronica-versione-1-9-1-cosa-cambia-dal-15-maggio-2026/)

**Tabelle di riferimento** (fonte primaria da verificare: [Allegato A v1.9.1](https://www.agenziaentrate.gov.it/portale/documents/d/guest/allegato-a-specifiche-tecniche-vers-1-9-1); dove non indicato diversamente sopra, il dettaglio è **[NV]**)

*Natura (campo 2.2.1.14 / 2.2.2.2; obbligatorio con AliquotaIVA = 0)*

| Codice | Significato | Riferimento |
|---|---|---|
| N1 | Escluse | art. 15 DPR 633/72 |
| N2.1 | Non soggette – artt. 7–7-septies | territorialità |
| N2.2 | Non soggette – altri casi (es. forfettari/minimi, art. 74 c.1…) | |
| N3.1 | Non imponibili – esportazioni | art. 8 |
| N3.2 | Non imponibili – cessioni intracomunitarie | art. 41 DL 331/93 |
| N3.3 | Non imponibili – cessioni verso San Marino | art. 71 |
| N3.4 | Non imponibili – operazioni assimilate alle esportazioni | artt. 8-bis, 9 |
| N3.5 | Non imponibili – a seguito di dichiarazione d'intento | art. 8 c.1 lett. c) |
| N3.6 | Non imponibili – altre operazioni che non concorrono al plafond | |
| N4 | Esenti | art. 10 |
| N5 | Regime del margine / IVA non esposta in fattura | |
| N6.1–N6.9 | Inversione contabile (rottami; oro/argento; subappalto edile; fabbricati; cellulari; prodotti elettronici; comparto edile; settore energetico; altri casi) | art. 17 c.5–6, 74 c.7–8 |
| N7 | IVA assolta in altro Stato UE (vendite a distanza, servizi TTE – OSS) | |

*EsigibilitaIVA* [NV]: **I** immediata; **D** differita (es. art. 6 c.5 per PA; IVA per cassa art. 32-bis DL 83/2012); **S** scissione dei pagamenti (art. 17-ter, split payment).

*RegimeFiscale* [NV, tranne RF20]: RF01 ordinario; RF02 contribuenti minimi; RF04 agricoltura e pesca (artt. 34, 34-bis); RF05 sali e tabacchi; RF06 fiammiferi; RF07 editoria; RF08 telefonia pubblica; RF09 rivendita documenti di trasporto/sosta; RF10 intrattenimenti e giochi (art. 74 c.6); RF11 agenzie viaggi (art. 74-ter); RF12 agriturismo; RF13 vendite a domicilio; RF14 beni usati/arte/antiquariato (margine); RF15 aste di oggetti d'arte; RF16 IVA per cassa PA; RF17 IVA per cassa art. 32-bis; RF18 altro; **RF19 forfettario** (L. 190/2014); **RF20 franchigia transfrontaliera** (v1.9). RF03 non è più in uso.

*ModalitaPagamento* [NV per i codici intermedi]: MP01 contanti; MP02 assegno; MP03 assegno circolare; MP04 contanti presso Tesoreria; MP05 bonifico; MP06 vaglia cambiario; MP07 bollettino bancario; MP08 carta di pagamento; MP09 RID; MP10 RID utenze; MP11 RID veloce; MP12 RIBA; MP13 MAV; MP14 quietanza erario; MP15 giroconto su conti di contabilità speciale; MP16 domiciliazione bancaria; MP17 domiciliazione postale; MP18 bollettino di c/c postale; MP19 SEPA Direct Debit; MP20 SDD CORE; MP21 SDD B2B; MP22 trattenuta su somme già riscosse; MP23 PagoPA.

*CondizioniPagamento* [NV]: TP01 pagamento a rate; TP02 pagamento completo; TP03 anticipo.

*CausalePagamento* (DatiRitenuta) [NV]: codici del Modello 770 (A, B, C, … fino a ZO); va aggiornato alle istruzioni 770 vigenti.

*TipoCassa* [NV per TC02–TC21]: TC01 Cassa Forense; TC02 dottori commercialisti; TC03 geometri; TC04 Inarcassa (ingegneri e architetti); TC05 notariato; TC06 ragionieri; TC07 ENASARCO; TC08 ENPACL; TC09 ENPAM; TC10 ENPAF; TC11 ENPAV; TC12 ENPAIA; TC13 fondo spedizionieri/agenzie marittime; TC14 INPGI; TC15 ONAOSI; TC16 CASAGIT; TC17 EPPI; TC18 EPAP; TC19 ENPAB; TC20 ENPAPI; TC21 ENPAP; TC22 INPS.

*Bollo* [NV]: blocco DatiBollo (2.1.1.6): **BolloVirtuale = "SI"** e ImportoBollo (2.00).

### Inferences
- Il software deve mappare i codici IVA interni sulle combinazioni **Aliquota/Natura/Esigibilità/Riferimento normativo** e bloccare in validazione: Natura assente con aliquota 0; Natura presente con aliquota > 0; Esigibilità S con Natura N6.x. Queste incoerenze generano scarti 004xx nell'Elenco controlli [NV].
- La logica di attribuzione dei codici Natura N6.x (reverse charge settoriali) è esclusa da questo perimetro (coperta da un altro ricercatore). Qui conta solo la codifica.

### Gaps
- Lista ufficiale aggiornata delle CausalePagamento e testo ufficiale delle descrizioni RF/MP/TC: non verificati per l'impossibilità di scaricare l'Allegato A.

---

## 4. Canali di trasmissione, accreditamento, nomenclatura file, dimensioni, lotti

### Takeaway
I canali verso lo SdI sono quattro: **PEC**, **SDICoop** (web service SOAP con certificati client forniti dallo SdI), **SFTP (SDIFTP)** per alti volumi, e procedura web o app dell'AdE (portale "Fatture e Corrispettivi" / app FatturAE). Un software proprietario che vuole trasmettere in autonomia ha due strade: la PEC (semplice ma poco automatizzabile) oppure l'accreditamento di un canale SDICoop. Il canale SDICoop richiede richiesta tramite il Sistema di Accreditamento, file firmato CAdES-BES, test di interoperabilità e passaggio in produzione. Le procedure di accreditamento WS/SFTP sono state aggiornate con la v1.9.1. Limiti: **5 MB per file** (fattura, lotto o zip) e **30 MB per messaggio PEC**.

### Cited Findings
- Dimensione: "il singolo file fattura non può superare la dimensione di 5MB"; anche lo ZIP non può superare 5 MB. Via PEC il messaggio con allegati non deve superare 30 MB e può contenere più file; negli altri canali ogni trasmissione contiene un solo file (fattura singola, lotto o archivio) — [Specifiche tecniche operative SdI v1.8.1](https://www.fatturapa.gov.it/export/documenti/Specifiche_tecniche_SdI_v1.8.1.pdf); [AdE Allegato A v1.8](https://www.agenziaentrate.gov.it/portale/documents/20143/5747438/Allegato+A+-+Specifiche+tecniche+vers+1.8.pdf/d120d9ba-ba16-0239-bcf9-fb4b59d7f93b)
- Nome file: codice Paese ISO 3166-1 alpha-2 + identificativo del trasmittente + progressivo univoco **alfanumerico di massimo 5 caratteri** [a-zA-Z0-9]. Ogni file inviato deve avere un nome diverso da quelli inviati in precedenza; il progressivo serve solo a differenziare i nomi, non c'è obbligo di numerazione stretta — [Specifiche tecniche operative SdI v1.8.1](https://www.fatturapa.gov.it/export/documenti/Specifiche_tecniche_SdI_v1.8.1.pdf); [AdE Allegato A v1.1](http://media.directio.it/portale/prassi/20180607-Allegato_A_Specifiche_tecniche_vers_1.1_FE.pdf)
- Accreditamento: dopo l'esito positivo della richiesta si accede a "Gestire il canale" e si scarica il file di test. La richiesta va firmata CAdES-BES. Seguono test di interoperabilità e poi la richiesta di passaggio in produzione — [fatturapa.gov.it – Test del processo (WS/SFTP)](https://www.fatturapa.gov.it/it/sistemainterscambio/sperimentazione/); [Medium – accreditamento SDICoop](https://massimomorchio.medium.com/fattura-elettronica-accreditamento-canale-sdicoop-ef6afb65cacb)
- Certificati SDICoop: lo SdI fornisce i certificati necessari al colloquio, compreso il certificato della CA. Un errore 403 nei test dipende spesso da certificati non inseriti nel file .p12 usato per la richiesta — [fatturapa.gov.it – FAQ Accreditamento canale](https://www.fatturapa.gov.it/it/faq/faq-accreditamento-canale/); [Forum Italia](https://forum.italia.it/t/installazione-certificati-canale-sdicoop/3382)
- Semplificazione: chi opera solo in B2B/B2C non deve più eseguire i test di colloquio previsti per la fatturazione verso la PA. L'ambiente di test resta disponibile dopo l'accreditamento, con limite giornaliero di invii e fatture prive di valore fiscale — [fatturapa.gov.it – Semplificazione accreditamento](https://www.fatturapa.gov.it/it/news/Semplificazione-della-procedura-di-accreditamento-al-Sistema-di-Interscambio/); [fatturapa.gov.it – Sperimentazione](https://www.fatturapa.gov.it/it/sistemainterscambio/sperimentazione/)
- SDIFTP (specifiche v4.3): il test parte dalla consegna dei certificati di firma e cifratura; l'ente deve confermare la predisposizione dell'ambiente SFTP entro 15 giorni — [Istruzioni servizio SDIFTP v4.3 (PDF)](https://www.fatturapa.gov.it/export/documenti/ftp/v4.x/Specifiche_tecniche_FTP_V4.3.pdf)
- Guida AdE "Accreditare un canale … e richiesta codici destinatario" — [AdE PDF](https://www.agenziaentrate.gov.it/portale/documents/20143/289347/Accreditamento+e+richiesta+codici+destinatario_Accreditamento+e+richiesta+codici+destinatario_v1.0.pdf/8333539f-f864-ac00-3ab0-74ce8a47db69)
- Con la v1.9.1 il limite dei codici destinatario per soggetto sale a 300 e le procedure WS/SFTP sono aggiornate — [ApriDigitale](https://www.apridigitale.it/fatturazione-elettronica/guida-sviluppatori-1-9-1); [Eutekne](https://www.eutekne.info/Sezioni/Art_1099301_aggiornamenti_alle_specifiche_tecniche_per_la_fattura_elettronica.aspx)
- **[NV]** Formato del nome: `IT` + CF o P.IVA del trasmittente + `_` + progressivo (es. `IT01234567890_00001.xml`). Estensioni ammesse: `.xml`, `.xml.p7m` (CAdES) e `.zip` (archivio di più file). Le notifiche usano `<nomefile>_<TIPO>_<prog>.xml` (es. `_RC_001`). **Lotto** = un file con un solo FatturaElettronicaHeader e più FatturaElettronicaBody, ammesso solo con stesso cedente e stesso cessionario. PEC: primo invio all'indirizzo `sdi01@pec.fatturapa.it`, poi all'indirizzo PEC assegnato dallo SdI nella prima risposta — [Allegato A v1.9.1](https://www.agenziaentrate.gov.it/portale/documents/d/guest/allegato-a-specifiche-tecniche-vers-1-9-1)

### Inferences
- Per un software "SdI-native" senza intermediari, l'architettura consigliata è un **canale SDICoop accreditato**, composto da due servizi: SdIRiceviFile (trasmissione) e TrasmissioneFatture/RicezioneFatture (endpoint esposti per notifiche e ricezione passive, con mTLS). Richiede un server con endpoint pubblici HTTPS, gestione dei certificati SdI e un codice destinatario a 7 caratteri per il ciclo passivo. La PEC va tenuta solo come canale di emergenza.
- L'SFTP ha senso solo per volumi molto alti (migliaia di file al giorno). Per una PMI è sovradimensionato.
- Il generatore deve garantire l'**unicità del nome file per trasmittente** (contatore persistente base 36 o 62 su 5 caratteri) e la scissione automatica di lotti o zip sotto i 5 MB, considerando anche gli allegati base64 in `Allegati`.

### Gaps
- Contenuto esatto delle "procedure di accreditamento WS e SFTP aggiornate" con la v1.9.1 (nuovi certificati? nuovi passi?): non verificato.
- Specifiche tecniche operative SdI: l'ultima versione individuata è la v1.8.1; non è chiaro se esista una versione allineata alla 1.9.1.

---

## 5. Notifiche SdI, ciclo di vita, scarto, recapito, codice destinatario

### Takeaway
Ricevute e notifiche: **RC** consegna, **NS** scarto (con codici 00xxx), **MC** mancata consegna, **NE** esito committente (solo PA: EC01 accettazione, EC02 rifiuto), **DT** decorrenza termini (solo PA, dopo 15 giorni senza esito), **AT** attestazione di impossibilità di recapito (solo PA). Lo SdI risponde entro **5 giorni**. Una fattura scartata si considera **non emessa** e va ritrasmessa entro **5 giorni**, preferibilmente con lo stesso numero e la stessa data (circ. 13/E/2018).

### Cited Findings
- Scarto: la notifica arriva entro 5 giorni e la fattura scartata è "non emessa" — [Fatture in Cloud](https://www.fattureincloud.it/guida-fatturazione-elettronica/fattura-elettronica-scartata/); [Agenda Digitale – esperto risponde](https://www.agendadigitale.eu/documenti/esperto-risponde/fattura-elettronica-scartata-entro-quanto-tempo-va-riemessa/)
- Circ. 13/E del 02/07/2018: dopo lo scarto si invia entro 5 giorni un documento corretto, **preferibilmente con stessa data e stesso numero**. In alternativa si emette una nuova fattura con numerazione che evidenzi il collegamento (es. "1/R", "1/S" in un registro sezionale) e si storna internamente la scartata, senza comunicazione allo SdI. Le fonti divergono su "5 giorni lavorativi" o "5 giorni solari". Oltre il termine si applica il ravvedimento ex art. 13 D.Lgs. 472/97 — [AdE comunicato circ. 13/E/2018](https://www.agenziaentrate.gov.it/portale/-/cs-02072018-cs-circolare-13-fattura-elettronica); [Agenda Digitale](https://www.agendadigitale.eu/documenti/esperto-risponde/fattura-elettronica-scartata-entro-quanto-tempo-va-riemessa/); [PMI.it](https://www.pmi.it/impresa/contabilita-e-fisco/311613/fattura-elettronica-ipotesi-di-scarto-e-possibili-soluzioni.html)
- PA: il termine di 15 giorni per l'esito parte dalla data della RC o della MC. In assenza di esito lo SdI invia la **DT** a trasmittente e destinatario. La DT comunica solo la chiusura del processo SdI e "non ha alcuna implicazione sulla verifica della correttezza" della fattura. Dopo la DT lo SdI scarta la fattura se viene reinviata — [Specifiche tecniche operative SdI v1.8.1](https://www.fatturapa.gov.it/export/documenti/Specifiche_tecniche_SdI_v1.8.1.pdf); [Fiscozen](https://www.fiscozen.it/guide/decorrenza-fattura-elettronica-pubblica-amministrazione/); [SoftwareSemplice](https://www.softwaresemplice.it/blog/fattura-elettronica/fattura-elettronica-pa-e-notifica-di-decorrenza-termini/1157)
- EC01 = accettazione; EC02 = rifiuto. Una fonte (Medium) inverte i codici: è un errore — [Manuale Erpy – Notifiche](https://erpy.it/manuale/manuale_erpy/fat_cl/notifiche.html); [Specifiche SdI v1.8.1](https://www.fatturapa.gov.it/export/documenti/Specifiche_tecniche_SdI_v1.8.1.pdf)
- PA: dopo una MC segue l'**AT** (attestazione di avvenuta trasmissione con impossibilità di recapito); secondo un manuale l'AT arriva dopo 10 giorni dalla MC — [Manuale Erpy](https://erpy.it/manuale/manuale_erpy/fat_cl/notifiche.html); [DCS FacilePA (PDF)](https://www.dcssrl.it/facilePA/pro/Fase-MonitorareStatoInvio_rev150625.pdf)
- Ciclo di vita B2B (RC/MC/NS) — [Fatturah – notifiche](https://www.fatturah.it/blog/notifiche-sdi-ciclo-vita-fattura)
- Codice destinatario: 7 caratteri per i privati, 6 caratteri (codice univoco ufficio IPA) per la PA. Per un ente privo di ufficio attivo su IPA, una fonte cita il codice generico "999999" con recapito al servizio di conservazione AdE — [Commercialista Telematico 03/2026](https://www.commercialistatelematico.com/articoli/2026/03/fattura-elettronica-verso-la-pa.html); [Fatture in Cloud – PA](https://www.fattureincloud.it/guida-fatturazione-elettronica/fattura-elettronica-pa/)
- "XXXXXXX" = cessionario non residente o non gestito dallo SdI — [Money.it](https://www.money.it/esterometro-2026-come-funziona-e-soggetti-obbligati); [Fiscozen](https://www.fiscozen.it/guide/esterometro/)
- **[NV]** Regole di recapito (provv. AdE 30/04/2018 n. 89757 e Allegato A): (a) se il cessionario ha registrato un indirizzo telematico preferito (servizio "Registrazione indirizzo telematico" in Fatture e Corrispettivi), lo SdI recapita lì a prescindere da quanto scritto in fattura; (b) altrimenti usa il CodiceDestinatario, oppure, con "0000000", la PECDestinatario; (c) se il recapito non è possibile, o se il cliente è un consumatore finale, un forfettario/minimo o un produttore agricolo esonerato, lo SdI rende disponibile la fattura nell'area riservata del cessionario e invia **MC** al trasmittente. In quel caso la fattura è comunque **emessa** e l'emittente deve comunicare al cliente che l'originale è nell'area riservata, consegnandogli una copia di cortesia. Data di emissione = data di trasmissione attestata dallo SdI; data di ricezione = data di consegna (RC) oppure data di presa visione nell'area riservata. Lo SdI invia al destinatario anche il file **metadati (MT)** — [Allegato A v1.9.1](https://www.agenziaentrate.gov.it/portale/documents/d/guest/allegato-a-specifiche-tecniche-vers-1-9-1)

### Inferences
- Modello di stato minimo per la fattura attiva: `Bozza → Validata → Inviata → (Scartata NS | Consegnata RC | Non consegnata MC) → [solo PA: Accettata EC01 | Rifiutata EC02 | Decorrenza DT | AT]`. Con NS il numero e la data vanno "liberati" per la riemissione entro 5 giorni, con alert a scadenza.
- Il codice errore NS va mostrato all'utente con una descrizione leggibile e con l'azione correttiva suggerita. Serve una tabella interna sincronizzata con l'Elenco controlli.
- Per il **passivo** il software deve consumare dal canale SDICoop: file fattura + metadati MT; per la PA emittente gestire anche l'invio dell'esito (non rilevante per una PMI). Deve importare dalle API o download del portale le fatture con MC, cioè quelle disponibili solo nell'area riservata.

### Gaps
- Codici errore NS più frequenti (lista e descrizioni ufficiali) e codici specifici per CIG/CUP: una fonte cita 00411, un'altra 00432 — da verificare sull'Elenco controlli.
- Testo integrale delle regole di recapito nelle specifiche correnti: non verificato.

---

## 6. Termini di emissione, data documento vs data trasmissione, numerazione

### Takeaway
La **fattura immediata** si trasmette entro **12 giorni** dall'effettuazione dell'operazione e la data documento è quella dell'operazione. La **fattura differita** (TD24) si trasmette entro il **15 del mese successivo**, con possibilità di indicare come data quella dell'ultima operazione del mese (circ. 14/E/2019).

### Cited Findings
- Immediata: entro 12 giorni dall'effettuazione dell'operazione (termine portato da 10 a 12 giorni dal 01/07/2019, Decreto Crescita). Nel campo "Data" va la data dell'operazione, mentre la data di invio allo SdI può essere fino a 12 giorni dopo — [Fisco7 2019](https://www.fisco7.it/2019/10/fattura-elettronica-immediata-e-differita-per-servizi-conta-lincasso/); [M2 Informatica](https://m2informatica.it/news/chiarimenti-fatturazione-elettronica-data-emissione-data-delloperazione); [AdE FAQ – Emissione fatture elettroniche](https://www.agenziaentrate.gov.it/portale/schede/comunicazioni/fatture-e-corrispettivi/faq-fe/risposte-alle-domande-piu-frequenti-categoria/emissione-delle-fatture-elettroniche)
- Differita: per cessioni o prestazioni dello stesso mese allo stesso cliente documentate da DDT o documento analogo, emissione entro il 15 del mese successivo. Circ. 14/E/2019: per le fatture via SdI è "possibile indicare una sola data, ossia … quella dell'ultima operazione" (facoltà, non obbligo) — [ProFattura](https://www.profattura.it/guide/termini-emissione-fattura); [Danea](https://www.danea.it/blog/fattura-elettronica-novita-invio-data-di-registrazione/)
- **[NV]** Numerazione (art. 21 c.2 lett. b DPR 633/72): numero progressivo che identifichi la fattura in modo univoco. La circ. 1/E/2013 ammette la numerazione continua senza azzeramento annuale e le serie sezionali, purché ogni numero sia univoco (es. per anno, per serie). Il campo Numero deve contenere almeno un carattere numerico (controllo 00xxx dell'Elenco controlli) — [AdE FAQ – Emissione](https://www.agenziaentrate.gov.it/portale/schede/comunicazioni/fatture-e-corrispettivi/faq-fe/risposte-alle-domande-piu-frequenti-categoria/emissione-delle-fatture-elettroniche)
- **[NV]** TD25: differita per le triangolari interne (art. 21 c.4 terzo periodo lett. b), da emettere entro la fine del mese successivo a quello di consegna dei beni.

### Inferences
- Il software deve distinguere **DataDocumento** (data dell'operazione) da **data trasmissione/presa in carico SdI** (da RC/NS). Deve calcolare la scadenza di invio (data operazione + 12 giorni; 15 del mese successivo per TD24) e segnalare in un cruscotto i documenti in ritardo, perché il ritardo è sanzionabile (§13).
- Va gestito un **controllo anti-duplicato** locale su (cedente, anno, numero, tipo), perché lo SdI scarta i duplicati (codice 00404 "fattura duplicata" [NV]).
- Dal 2027 i riferimenti di legge (art. 21 DPR 633/72) migreranno nel Testo unico IVA (§15): le descrizioni in UI e nei documenti dovrebbero essere parametriche.

### Gaps
- Testo ufficiale circ. 14/E/2019 e circ. 1/E/2013 non letti in sessione.

---

## 7. Firma digitale

### Takeaway
La firma elettronica qualificata è **obbligatoria per le fatture verso la PA** (CAdES-BES → `.xml.p7m`, oppure XAdES-BES enveloped) e **facoltativa per B2B/B2C**.

### Cited Findings
- La richiesta di accreditamento del canale va firmata in formato CAdES-BES — [Medium – accreditamento SDICoop](https://massimomorchio.medium.com/fattura-elettronica-accreditamento-canale-sdicoop-ef6afb65cacb)
- **[NV]** Allegato A e specifiche FatturaPA: per le FPA12 la firma qualificata è obbligatoria (CAdES-BES, file `.p7m`; o XAdES-BES con firma "enveloped" senza attributi aggiuntivi). Per le FPR12 è facoltativa. Lo SdI verifica validità e integrità della firma e il certificato non scaduto/revocato (controlli 001xx dell'Elenco controlli) — [Allegato A v1.9.1](https://www.agenziaentrate.gov.it/portale/documents/d/guest/allegato-a-specifiche-tecniche-vers-1-9-1)

### Inferences
- Il software deve integrare la firma: via HSM o firma remota di un QTSP per la firma automatica massiva, oppure con un dispositivo dell'utente. Deve anche saper leggere i `.p7m` in ingresso nel passivo, estraendo l'XML dalla busta CAdES ed eventualmente verificando la firma.
- Per il B2B l'assenza di firma semplifica l'architettura. L'integrità e l'origine sono garantite dal canale SdI e dalla conservazione a norma (§11).

### Gaps
- Controlli di firma esatti (codici 001xx) e formati di firma ammessi nella v1.9.1: non verificati.

---

## 8. Specificità PA: codice ufficio IPA, CIG/CUP, NSO, split payment, esito

### Takeaway
Verso la PA servono: FPA12, firma qualificata, **codice univoco ufficio IPA a 6 caratteri**, CIG/CUP nei blocchi DatiOrdineAcquisto/DatiContratto/DatiConvenzione. Gestione dell'esito EC01/EC02 entro 15 giorni o della DT. Lo split payment (Esigibilità S) è autorizzato dall'UE **fino al 30/06/2026**; la proroga al 30/06/2029 era proposta dalla Commissione (COM(2026) 281 del 17/06/2026), ma la sua approvazione definitiva non è stata verificata.

### Cited Findings
- Codice ufficio a 6 caratteri (indicePA); CIG e CUP per la tracciabilità (L. 136/2010) nei blocchi DatiOrdineAcquisto/DatiContratto; il CUP è generato dalla stazione appaltante su cupweb (DIPE). Gli scarti più frequenti dipendono da codice ufficio errato e CIG/CUP diversi da quelli dell'ordine — [Commercialista Telematico 03/2026](https://www.commercialistatelematico.com/articoli/2026/03/fattura-elettronica-verso-la-pa.html); [Officina – CIG e CUP](https://officina.it/guide/fatturazione-elettronica/come-inserire-cig-e-cup-fattura-elettronica-pa); [CentroFiscale – fattura rifiutata PA](https://centrofiscale.com/fattura-elettronica-rifiutata-pa/)
- Dal 27/01/2026 un servizio web in "Fatture e Corrispettivi" consente di **integrare il CUP su fatture già trasmesse**, per spese collegate a incentivi pubblici alle attività produttive (dato riportato in una sintesi di risultati; attribuzione a una singola fonte non certa) — [Commercialista Telematico 03/2026](https://www.commercialistatelematico.com/articoli/2026/03/fattura-elettronica-verso-la-pa.html); [CentroFiscale](https://centrofiscale.com/specifiche-tecniche-fattura-elettronica-2026/)
- Split payment: Decisione di esecuzione (UE) 2023/1552 del 25/07/2023 (GUUE L 188 del 27/07/2023) che autorizza l'Italia **fino al 30/06/2026**; esclusione delle società quotate dal 01/07/2025. La Commissione ha adottato la proposta **COM(2026) 281 del 17/06/2026** per estendere il meccanismo al **30/06/2029**, con approvazione del Consiglio ancora necessaria al momento della fonte — [Assolombarda – proroga 30/06/2026](https://www.assolombarda.it/servizi/fisco/informazioni/split-payment-confermata-la-proroga-al-30-giugno-2026-con-esclusione-delle-societa-quotate-dal-1deg-luglio-2025); [Assolombarda – proposta 2029](https://www.assolombarda.it/servizi/fisco/informazioni/split-payment-2013-proposta-di-proroga-al-30-giugno-2026-con-esclusione-delle-societa-quotate-dal-1deg-luglio-2025); [Studio Fiscale Legale](https://www.studiofiscalelegale.it/it/split-payment-ufficiale-la-proroga-al-2026/)
- Esito committente EC01/EC02 entro 15 giorni dalla RC; in mancanza, DT — [Specifiche SdI v1.8.1](https://www.fatturapa.gov.it/export/documenti/Specifiche_tecniche_SdI_v1.8.1.pdf); [Manuale Erpy](https://erpy.it/manuale/manuale_erpy/fat_cl/notifiche.html)
- **[NV]** DM 24/08/2020 n. 132: la PA può rifiutare (EC02) solo per cause tipizzate, cioè operazione non riferibile all'ente, CIG o CUP omesso o errato, codice AIC/repertorio dispositivi medici omesso, dati NSO assenti. **NSO** (Nodo Smistamento Ordini, DM 7/12/2018): per gli acquisti di beni del SSN la fattura deve riportare gli estremi dell'ordine elettronico (DatiOrdineAcquisto con il formato "#id_ordine#data#endpoint#") [NV].

### Inferences
- Lo stato reale dello split payment dopo il 30/06/2026 è **critico per il software**, perché determina se va usata EsigibilitaIVA = S verso la PA da luglio 2026. Va verificata la decisione del Consiglio UE e la relativa norma interna. Se manca la proroga, va applicata l'esigibilità ordinaria (I/D).
- Per la PA servono anagrafica IPA (scaricabile da indicepa.gov.it), campi strutturati CIG/CUP/NSO per riga o per documento, firma, e gestione del rifiuto con emissione di nota di credito o nuova fattura secondo il caso.

### Gaps
- **Non verificato** se il Consiglio UE abbia approvato la proroga dello split payment al 2029 (search budget esaurito). Va controllato su EUR-Lex e GU prima del go-live.
- Formato NSO e testo DM 132/2020: non verificati in sessione.

---

## 9. Imposta di bollo sulle fatture elettroniche

### Takeaway
Il bollo è di **2 € per fattura** senza IVA (esente, esclusa, fuori campo, non imponibile in genere) d'importo **> 77,47 €**. Si indica con **BolloVirtuale = SI** e si versa **trimestralmente con F24**, codici **2521/2522/2523/2524** (2525 sanzioni, 2526 interessi), sulla base degli elenchi A/B precalcolati dall'AdE nel portale. Esiste una franchigia di differimento: se il bollo del trimestre è sotto **5.000 €** si può versare con la scadenza successiva.

### Cited Findings
- Codici F24: 2521 (I trim.), 2522 (II), 2523 (III), 2524 (IV), 2525 sanzioni, 2526 interessi. Il codice dipende dal **trimestre di emissione**, non dal mese di pagamento. Per i trimestri differiti si usa il codice del trimestre di riferimento (precisazione della guida AdE di giugno 2026) — [AdE – L'imposta di bollo sulle fatture elettroniche (giugno 2026)](https://www.agenziaentrate.gov.it/portale/documents/d/guest/l-imposta_di_bollo_sulle_fatture_elettronichegiugno2026); [F24editabile](https://f24editabile.com/blog/bollo-fatture-elettroniche-f24-2521-2524-2026/)
- Scadenze 2026: I trimestre 1° giugno 2026 (il 31/05 cadeva di domenica); II trimestre 30/09/2026; III trimestre 30/11/2026; IV trimestre 28/02/2027, che secondo una fonte slitta al 01/03/2027 perché cade di domenica — [Mastro.tax](https://mastro.tax/guida-imposta-bollo-fattura-elettronica-2026); [FreeInvoice](https://www.freeinvoice.it/blog/imposta-di-bollo-fatture-elettroniche-2026/)
- Soglia 5.000 €: se il bollo complessivo supera i 5.000 € il differimento non è possibile. Il dato viene da fonti secondarie e non è stato trovato nei passaggi della guida AdE individuati — [Mastro.tax](https://mastro.tax/guida-imposta-bollo-fattura-elettronica-2026); [Informazione Fiscale](https://www.informazionefiscale.it/bollo-fatture-elettroniche-scadenze-come-pagare)
- Importo: 2 € per fattura senza IVA d'importo > 77,47 € — [PartitaIVA.it](https://www.partitaiva.it/imposta-bollo-fatture-elettroniche/); [AdE guida giugno 2026](https://www.agenziaentrate.gov.it/portale/documents/d/guest/l-imposta_di_bollo_sulle_fatture_elettronichegiugno2026)
- Elenchi: **Elenco A** (fatture in cui il cedente ha indicato il bollo assolto, non modificabile) ed **Elenco B** (fatture senza indicazione del bollo ma per cui l'AdE lo ritiene dovuto, modificabile dal contribuente) — [AdE – Guida bollo dicembre 2021](https://www.agenziaentrate.gov.it/portale/documents/20143/3394067/Guida_Bollo_sulle_fatture_elettr_Dicembre_2021.pdf/2f73bd8e-4b1d-ebec-5c88-89bc95952ff1); [Commercialista Telematico 2022](https://www.commercialistatelematico.com/articoli/2022/09/versamento-imposta-bollo-fatture-guida-rapida-scadenza-venerdi-30-settembre-2022.html)
- Irregolarità: l'AdE invia una comunicazione telematica alla PEC (INI-PEC) con imposta, sanzione ridotta a 1/3 e interessi; se non si paga entro 30 giorni scatta l'iscrizione a ruolo. Le fonti 2021–22 indicano una sanzione del 30% (15% entro 90 giorni; 1/15 per giorno entro 15 giorni). Le fonti divergono sulla possibilità di ravvedimento dopo la comunicazione — [EC News](https://www.ecnews.it/fiscale/fisco-e-patrimonio/imposte-indirette/limposta-di-bollo-sulle-fatture-elettroniche-sanzioni/); [Edotto](https://www.edotto.com/articolo/imposta-di-bollo-su-e-fatture-riduzione-delle-sanzioni-e-ravvedimento); [FiscoeTasse](https://www.fiscoetasse.com/rassegna-stampa/29721-e-fatture-come-ravvedere-il-bollo-virtuale.html)
- **[NV]** Base normativa: art. 6 DM 17/06/2014 e art. 12-novies DL 34/2019; DM 04/12/2020 per elenchi e scadenze; differimento con soglia 5.000 € introdotto dal DL 73/2022. L'AdE mette a disposizione gli elenchi entro il 15 del mese successivo al trimestre; le modifiche all'elenco B sono ammesse fino all'ultimo giorno del mese successivo al trimestre (per il II trimestre fino al 10/09). Pagamento anche con addebito diretto dal portale. **Sanzione per omesso versamento**: con il D.Lgs. 87/2024 l'art. 13 D.Lgs. 471/97 è sceso al 25% per le violazioni dal 01/09/2024; i dati al 30% delle fonti 2021–22 sarebbero quindi superati.

### Inferences
- Requisiti software: (1) calcolo automatico del bollo a livello documento, con regola "somma degli importi senza IVA (Natura N1/N2.x/N3.x/N4/N5…) > 77,47 €"; le esenzioni specifiche dal bollo (es. fatture per esportazioni di beni [NV]) vanno parametrizzate per Natura/caso; (2) flag BolloVirtuale = SI, con eventuale riaddebito al cliente come riga separata; (3) report trimestrale riconciliabile con l'elenco A e le soglie di differimento; (4) generazione dei dati per l'F24 (codici 2521–2524 per trimestre di emissione).
- La sanzione vigente (25% o 30%) va confermata, perché incide sulle stime di ravvedimento proposte dal software.

### Gaps
- Verifica normativa della soglia 5.000 € e delle date esatte di disponibilità e modifica degli elenchi nella guida AdE di giugno 2026 (il documento non era scaricabile).
- Percentuale di sanzione vigente per omesso o tardivo versamento del bollo dopo il D.Lgs. 87/2024.

---

## 10. Operazioni con l'estero (ex esterometro)

### Takeaway
Dal **01/07/2022** l'esterometro è assorbito dallo SdI. Le **vendite** a soggetti non residenti si inviano come fatture con CodiceDestinatario **"XXXXXXX"**, entro i termini di emissione. Gli **acquisti** si comunicano con **TD17/TD18/TD19** (TD28 per San Marino) entro il **15 del mese successivo** a quello di ricevimento del documento o di effettuazione dell'operazione.

### Cited Findings
- L'esterometro come adempimento trimestrale autonomo è abolito: le operazioni transfrontaliere passano dallo SdI; per le vendite si emette la fattura (es. TD01) con codice destinatario "XXXXXXX", indicando IdPaese del cliente e CAP "00000" — [Money.it](https://www.money.it/esterometro-2026-come-funziona-e-soggetti-obbligati); [Fiscozen](https://www.fiscozen.it/guide/esterometro/); [Danea](https://www.danea.it/blog/esterometro/)
- Acquisti: TD17 servizi, TD18 beni UE, TD19 beni ex art. 17 c.2. Il mancato invio equivale a omessa comunicazione anche se la fattura è registrata. Termine: il 15 del mese successivo (tabella Fiscomania, Fiscozen). Conflitto: Autofattura.io indica 12 giorni per TD19, dato non verificato su fonte ufficiale. Anche i forfettari sono obbligati — [Fiscomania](https://fiscomania.com/autofattura-guida-casi-emissione/); [Autofattura.io](https://www.autofattura.io/blog/esterometro); [IPSOA – guida esterometro](https://www.ipsoa.it/guide/esterometro-come-quando-inviare-dati-operazioni-tranfrontaliere)
- **[NV]** Base: art. 1 c.3-bis D.Lgs. 127/2015 (L. 178/2020 e DL 73/2022): esclusione per gli acquisti di beni e servizi non territorialmente rilevanti (artt. 7–7-octies) d'importo ≤ 5.000 € per singola operazione; nessun obbligo per operazioni già documentate da bolletta doganale o da fattura elettronica SdI.

### Inferences
- Il software deve: (a) per il cliente estero impostare automaticamente "XXXXXXX", IdPaese e CAP "00000", con scelta della Natura (N2.1, N3.1, N3.2…); (b) per il fornitore estero generare il documento TD17/18/19 al momento della registrazione della fattura passiva estera, con scadenziario al 15 del mese successivo; (c) gestire San Marino (TD28 o fattura elettronica via SdI, §12).

### Gaps
- Termine ufficiale per TD19 (15 del mese successivo o 12 giorni?): conflitto tra fonti non risolto.

---

## 11. Conservazione digitale a norma

### Takeaway
Le fatture elettroniche (XML firmati o meno, con relative ricevute SdI) vanno conservate a norma (DM 17/06/2014, CAD, Linee guida AgID 2020/2021 in vigore dal 01/01/2022) **entro il terzo mese successivo al termine di presentazione della dichiarazione dei redditi**. Si possono usare il **servizio gratuito AdE**, che richiede l'adesione nel portale Fatture e Corrispettivi e vale solo per le fatture transitate dallo SdI, oppure un conservatore privato. Durata minima: 10 anni (art. 2220 c.c.).

### Cited Findings
- Servizio gratuito AdE: disponibile su adesione volontaria nell'area riservata "Fatture e Corrispettivi" (art. 1 c.1 D.Lgs. 127/2015), utilizzabile **solo per le fatture emesse e ricevute tramite SdI** — [AdE – Come si conservano le fatture elettroniche](https://www.agenziaentrate.gov.it/portale/aree-tematiche/fatturazione-elettronica/guida-fatturazione-elettronica/come-predisporre-inviare-ricevere-fe/come-si-conservano-fe); [AdE FAQ intermediari – registrazione e conservazione](https://www.agenziaentrate.gov.it/portale/schede/comunicazioni/fatture-e-corrispettivi/faq-fe/risposte-alle-domande-piu-frequenti-categoria/registrazione-e-conservazione-delle-fatture-intermediari)
- Adesione con effetto retroattivo (dal 2021): si può indicare una data anteriore per conservare le fatture già transitate. Secondo alcune guide il servizio mantiene i documenti per 15 anni anche in caso di recesso — [Fatturah](https://www.fatturah.it/blog/conservazione-sostitutiva-fatture-gratis); [MEM Informatica](https://www.meminformatica.it/index.php/supporto/approfondimenti/commercialisti/item/1336-fattura-elettronica-conservazione-retroattiva-novita-dell-agenzia-delle-entrate)
- Termine: tre mesi dalla scadenza della dichiarazione dei redditi. Una guida indica il 31/12/2025 per le fatture 2024, ma con la scadenza Redditi al 31/10 il termine sarebbe il 31/01 dell'anno successivo: **conflitto da verificare** — [Sibill](https://sibill.com/contabilita/fatturazione-elettronica-e-conservazione-guida-e-scadenze-2026/); [Fido Commercialista](https://fidocommercialista.it/conservazione-sostitutiva)
- Linee guida AgID sulla formazione, gestione e conservazione dei documenti informatici (2020, aggiornate 2021) e Regolamento sui criteri per la fornitura dei servizi di conservazione, con requisiti in Allegato A: in vigore dal 01/01/2022. L'iscrizione dei conservatori al Marketplace AgID è facoltativa; le PA che usano conservatori non iscritti inviano i contratti ad AgID entro 30 giorni — [AgID – Linee guida (PDF, versione 2024-05)](https://www.agid.gov.it/sites/agid/files/2024-05/linee_guida_sul_documento_informatico.pdf); [AgID – Allegato A Requisiti](https://www.agid.gov.it/sites/default/files/repository_files/allegato_a_.pdf); [Agenda Digitale – Regolamento](https://www.agendadigitale.eu/documenti/conservazione-documenti-informatici-ecco-i-criteri-di-fornitura-secondo-il-regolamento-agid/); [Regolamento (copia Regione Marche)](https://static.regione.marche.it/portals/0/Agenda_Digitale/Polo%20Conservazione%20Reg_le/Documentazione_2023/Regolamento_criteri_fornitura_servizio_conservazione.pdf)
- Una fonte commerciale sostiene aggiornamenti 2025 dei requisiti Marketplace (eIDAS 2.0, capitale minimo): **non verificati** — [Comarch](https://www.comarch.it/data-management/notizie/conservazione-digitale-regole-agid-gdpr/)
- Conservazione per 10 anni — [Il Commercialista Online](https://www.ilcommercialistaonline.it/conservazione-fattura-elettronica/)

### Inferences
- **[NV]** Termine operativo: per le fatture 2025, con dichiarazione Redditi 2026 in scadenza il 31/10/2026, la conservazione va chiusa entro il **31/01/2027** (art. 3 c.3 DM 17/06/2014 come modificato dall'art. 12-novies DL 34/2019).
- Il software non deve "fare" conservazione (servono un conservatore qualificato, il manuale di conservazione e i pacchetti PdV/PdA con indici UNI SInCRO). Deve invece: (a) archiviare in modo immutabile XML, `.p7m` e tutte le ricevute SdI (RC/NS/MC/NE/DT/AT/MT); (b) generare i **metadati minimi** previsti dall'Allegato 5 delle Linee guida AgID (es. identificativo, data, soggetti, P.IVA/CF, tipologia, impronta hash); (c) esportare pacchetti di versamento verso un conservatore, oppure guidare l'utente all'adesione al servizio AdE.
- Il servizio AdE copre solo le fatture SdI. Restano fuori, per esempio, le fatture cartacee sanitarie (§12), i DDT, i registri IVA e i documenti non SdI, che richiedono un conservatore separato o un altro canale.

### Gaps
- Durata dell'accordo di servizio AdE (3 anni con rinnovo? [NV]), contenuto esatto dell'accordo e testo ufficiale del termine di conservazione: non verificati.
- Eventuali aggiornamenti 2025–2026 delle Linee guida AgID: non verificati.

---

## 12. Chi deve emettere fattura elettronica nel 2026 ed esclusioni

### Takeaway
Nel 2026 tutti i soggetti IVA residenti o stabiliti, **forfettari compresi**, emettono fattura elettronica via SdI (B2B, B2C, B2G). Restano escluse le **prestazioni sanitarie verso persone fisiche**: con il **D.Lgs. 81/2025** il divieto è diventato **permanente** e la Ris. AdE 9/E del 24/02/2026 ne ha delimitato il perimetro. Verso San Marino si usa lo SdI; verso i consumatori finali la fattura va nell'area riservata, con copia di cortesia.

### Cited Findings
- Sanità: il D.Lgs. 81/2025 ha reso **permanente** il divieto di e-fattura via SdI modificando l'art. 10-bis DL 119/2018. Finiscono così le proroghe annuali in vigore dal 2019. Il divieto riguarda sia i soggetti tenuti all'invio al Sistema TS sia quelli non tenuti, per le prestazioni sanitarie a persone fisiche. B2B e B2G restano elettronici. L'invio dei dati al STS resta obbligatorio — [MySolution 13/01/2026](https://www.mysolution.it/fisco/informazioni/news/2026/01/13/prestazioni-sanitarie-a-regime-il-divieto-di-fatturazione-elettronica-ai-privati/); [Fiscomania](https://fiscomania.com/prestazioni-sanitarie/); [Studio Meli](https://www.studiomeli.it/prestazioni-sanitarie-e-fattura-elettronica-divieto-permanente-dal-2026/); [EC News](https://www.ecnews.it/fiscale/fisco-e-patrimonio/iva/divieto-di-fatturazione-elettronica-delle-operazioni-sanitarie/)
- Ris. AdE n. 9 del 24/02/2026: il divieto si limita alle prestazioni sanitarie rilevanti per il STS; operazioni imponibili come la vendita di dispositivi medici possono restarne fuori, con valutazione caso per caso — [MySolution 04/2026 – Ris. 9/2026](https://www.mysolution.it/fisco/approfondimenti/commenti/2026/04/fatturazione-delle-prestazioni-sanitarie-e-vendita-di-dispositivi-medici-i-chiarimenti-della-risoluzione-n.-92026-setti/); [A. Montalbano 27/03/2026](https://www.agostinomontalbano.it/2026/03/27/divieto-fatturazione-elettronica-sanitaria-2026/)
- Forfettari: tenuti a comunicare via SdI anche le operazioni estere (TD17–19) — [Autofattura.io](https://www.autofattura.io/blog/esterometro)
- San Marino: TD28 per acquisti con fattura cartacea con IVA — [Variazioni specifiche 2022](https://www.lentepubblica.it/wp-content/uploads/2022/10/Variazioni-alle-specifiche-tecniche-fatture-elettroniche-2022-09-30.pdf)
- **[NV]** Forfettari: obbligo dal 01/07/2022 per chi ha ricavi > 25.000 € e dal **01/01/2024 per tutti** (art. 18 DL 36/2022). San Marino: DM 21/06/2021, scambi via SdI con codice destinatario dell'Ufficio tributario sammarinese "2R4GTO8", obbligatorio dal 01/07/2022. B2C: la fattura elettronica è emessa via SdI (codice "0000000", CF del cliente); l'originale è nell'area riservata del consumatore e la copia di cortesia (PDF o cartacea) non ha valore fiscale.

### Inferences
- Il software deve avere un **flag "prestazione sanitaria verso persona fisica"**: in quel caso deve bloccare l'invio allo SdI, produrre la fattura cartacea o PDF analogica con numerazione coerente, generare il tracciato Sistema TS (fuori perimetro SdI) e prevedere la conservazione separata.
- Per i soggetti in **franchigia transfrontaliera (RF20)** e i forfettari il generatore deve consentire FSM10 senza il limite di 400 € (v1.9).

### Gaps
- Testo del D.Lgs. 81/2025 (art. di modifica e decorrenza) e della Ris. 9/E/2026: non letti direttamente.
- Obblighi per i soggetti esteri identificati in Italia e casi residuali di esonero (es. produttori agricoli art. 34 c.6, soggetti che hanno optato per L. 398/91 sotto soglia): non verificati.

---

## 13. Sanzioni per omessa o tardiva fatturazione elettronica e ravvedimento

### Takeaway
Per le violazioni dal **01/09/2024** (D.Lgs. 87/2024) l'omessa o tardiva fattura con impatto sulla liquidazione costa il **70% dell'imposta**, con un minimo che le fonti indicano in **300 €** (alcune ancora 500 €, regime ante riforma). Se la violazione non incide sulla liquidazione la sanzione è fissa, **da 250 a 2.000 €**. Per le operazioni non imponibili o esenti si applica il **5%** dei corrispettivi. Il cessionario che non regolarizza con TD29 entro 90 giorni paga il 70% con minimo 250 €. Le fasce di ravvedimento riportate dalle fonti non coincidono.

### Cited Findings
- Le regole vigenti sono quelle dell'art. 6 D.Lgs. 471/97 come modificato dal D.Lgs. 87/2024, applicabili alle violazioni dal 01/09/2024; le misure 90–180% con minimo 500 € valgono per le violazioni precedenti — [Orefattura](https://www.orefattura.it/fattura-elettronica/invio-tardivo-fattura-elettronica); [Fiscomania](https://fiscomania.com/tardiva-emissione-della-fattura-elettronica-sanzioni/)
- 70% dell'imposta con minimo 300 € (art. 6 c.1 e c.4) secondo Orefattura e Cosmocode; Fiscomania e altre fonti indicano un minimo di 500 €: **conflitto**. Senza effetti sulla liquidazione: da 250 a 2.000 €. Operazioni esenti, non imponibili o non soggette: 5% dei corrispettivi (minimo 300 € secondo Orefattura) — [Orefattura](https://www.orefattura.it/fattura-elettronica/invio-tardivo-fattura-elettronica); [Cosmocode](https://www.cosmocode.it/blog/sanzioni-invio-tardivo-fattura-elettronica-guida-completa-2026/); [Fiscomania](https://fiscomania.com/tardiva-emissione-della-fattura-elettronica-sanzioni/); [Studio Pizzano – sanzioni](https://www.studiopizzano.it/sanzioni-fattura-elettronica-guida-completa-per-omissioni-ritardi-ed-errori/)
- Cessionario (art. 6 c.8): comunicazione TD29 entro 90 giorni; in mancanza, 70% dell'imposta con minimo 250 € — [Informazione Fiscale](https://www.informazionefiscale.it/Fattura-elettronica-2025-specifiche-tecniche-codice-TD29)
- Ravvedimento (art. 13 D.Lgs. 472/97): Orefattura indica 1/9 del minimo entro 90 giorni, 1/8 entro il termine della dichiarazione dell'anno, 1/7 oltre. Cosmocode indica 1/10 entro 30 giorni, 1/9 entro 90, poi 1/8, 1/7, 1/6, 1/5. Le due tabelle sono **non coincidenti** — [Orefattura](https://www.orefattura.it/fattura-elettronica/invio-tardivo-fattura-elettronica); [Cosmocode](https://www.cosmocode.it/blog/sanzioni-invio-tardivo-fattura-elettronica-guida-completa-2026/)

### Inferences
- Il software può offrire un "calcolatore di ravvedimento" solo con tabelle parametriche aggiornabili, validate da un professionista. Le fonti divergono e vanno verificate sul testo vigente in Normattiva.
- La funzione più utile è preventiva: alert su fatture non trasmesse entro 12 giorni o entro il 15 del mese successivo, e su TD17–19/TD29 in scadenza.

### Gaps
- Testo vigente dell'art. 6 c.4 D.Lgs. 471/97 (minimo 300 € o 500 €) e dell'art. 13 D.Lgs. 472/97 dopo il D.Lgs. 87/2024: non verificati su Normattiva (fetch bloccato, budget esaurito).

---

## 14. ViDA (VAT in the Digital Age) e impatti su un software nuovo

### Takeaway
Il pacchetto ViDA (Direttiva (UE) **2025/516**, Reg. 2025/517, Reg. di esecuzione 2025/518) è stato pubblicato in GUUE il 25/03/2025 ed è in vigore dal 14/04/2025. Dal **01/07/2030** le operazioni B2B intra-UE richiederanno **e-fattura strutturata conforme EN 16931** e **digital reporting** quasi in tempo reale verso un VIES centrale. I sistemi nazionali preesistenti al 2024, come lo SdI, dovranno allinearsi entro il **01/01/2035**.

### Cited Findings
- Pubblicazione: Direttiva (UE) 2025/516 con Reg. 2025/517 e Reg. di esecuzione 2025/518; entrata in vigore il 14/04/2025 — [KPMG Avocats](https://kpmg.com/av/fr/avocats/eclairages/2025/04/vida-publication-de-la-directive-et-des-reglements.html); [eConnect – timeline](https://econnect.eu/en/docs/knowledge/regulations/europe/vida/timeline); [MDDP](https://www.mddp.pl/vida-package-published-should-we-be-afraid-of-the-eu-schema/)
- 01/07/2030: le fatture B2B intra-UE devono essere e-fatture strutturate EN 16931 con dati DRR (art. 5 Dir. 2025/516). Altre tappe: 01/07/2027 (estensione OSS e reverse charge B2B obbligatorio), 01/07/2028 (piattaforme come deemed supplier), 01/01/2035 (allineamento di tutti i sistemi nazionali) — [eConnect](https://econnect.eu/en/docs/knowledge/regulations/europe/vida/timeline); [Digital Policy Alert](https://digitalpolicyalert.org/change/4990)
- I sistemi nazionali introdotti prima del 2024 (come quello italiano) hanno tempo fino al 01/01/2035 per conformarsi — [MDDP](https://www.mddp.pl/vida-package-published-should-we-be-afraid-of-the-eu-schema/); [Forvis Mazars Italia](https://www.forvismazars.com/it/en/services/tax/vida-and-e-invoicing-requirements)
- Reporting quasi in tempo reale con condivisione dei dati tra amministrazioni tramite VIES centrale. Le finestre temporali riportate divergono: 10 giorni per l'emissione secondo una fonte, 2 giorni lavorativi secondo un'altra — **da verificare sul testo** — [BDO](https://www.bdo.global/en-gb/insights/tax/indirect-tax/european-union-vida-e-invoicing-and-digital-reporting-challenges,-compliance-and-opportunities); [RSM](https://rsmus.com/insights/services/business-tax/vida-reform-addresses-digital-trade-and-cross-border-compliance.html); [PwC Lussemburgo](https://www.pwc.lu/en/newsletter/2025/vat-in-the-digital-age-vida.html)
- La Commissione ha pubblicato un programma di lavoro 2026–2035 su e-invoicing e DRR (20/05/2026, secondo una fonte) — [Edicom](https://edicomgroup.com/blog/vida-the-european-union-promotes-b2b-electronic-invoicing); [VATupdate 19/08/2026](https://www.vatupdate.com/2026/08/19/briefing-document-podcast-vat-in-the-digital-age-vida-digital-reporting-requirements/)
- Il modello italiano dovrebbe allinearsi a ViDA soprattutto per le operazioni intra-UE dal 2030 — [Doxee](https://doxee.com/resources/blog/european-e-invoicing-whats-changing-for-italy/)

### Inferences
- Un software nuovo dovrebbe avere un **modello dati interno semantico allineato a EN 16931** (Business Terms BT-xx), da cui generare FatturaPA oggi e UBL 2.1/CII (Peppol BIS o profilo ViDA) domani. Il mapping FatturaPA ↔ EN 16931 esiste già: lo SdI accetta formati EN 16931 per la PA dal 2019 [NV].
- Dal 2030 le fatture intra-UE (oggi FatturaPA con "XXXXXXX" e N3.2 / TD17-18) dovranno probabilmente viaggiare in formato EN 16931 e alimentare il DRR. La sequenza dei campi (identificativi, codici IVA, riferimenti alle note di variazione) va progettata per la tracciabilità a livello di riga.
- Con ViDA l'obbligo nazionale di e-fattura non richiede più una deroga UE: il quadro giuridico SdI è stabile e non c'è rischio di "scadenza" della deroga [inferenza dalla riforma dell'art. 218 Dir. IVA, non verificata].

### Gaps
- Termini esatti di emissione e reporting DRR nel testo finale (10 giorni o 2 giorni), e se e come l'Italia sostituirà l'esterometro SdI con il DRR UE: non verificati su EUR-Lex.
- Nessuna fonte ufficiale italiana (AdE/MEF) su un piano di recepimento di ViDA nello SdI trovata in sessione.

---

## 15. Altre novità 2025–2026 rilevanti per il software

### Takeaway
Le novità principali sono quattro: (1) specifiche 1.9.1 dal 15/05/2026 (§1); (2) **Testo unico IVA (D.Lgs. 10/2026)**, pubblicato in GU il 30/01/2026 e **in vigore dal 01/01/2027**, che rinumera le norme su fatturazione e registrazione (oggi DPR 633/72 e DL 331/93); (3) divieto sanitario permanente e Ris. 9/E/2026 (§12); (4) servizio di integrazione del CUP su fatture già trasmesse (27/01/2026) e incertezza sullo split payment dopo il 30/06/2026 (§8).

### Cited Findings
- Testo unico IVA: D.Lgs. 19/01/2026 n. 10, in GU il 30/01/2026, 171 articoli, efficacia dal **01/01/2027** (decorrenza rinviata dal 2026 con il Milleproroghe), abrogazioni dalla stessa data (artt. 170–171). Riunisce DPR 633/72 e DL 331/93 con natura "compilativa", cioè senza modifiche sostanziali salvo poche eccezioni (es. prova dell'uscita doganale per le esportazioni). Include le regole su fatturazione e corrispettivi telematici — [FiscoeTasse](https://www.fiscoetasse.com/normativa-prassi/13548-nuovo-testo-unico-iva-in-vigore-dal-2027-il-testo-pubblicato-in-gu.html); [Money.it](https://www.money.it/testo-unico-iva-pubblicato-gazzetta-ufficiale-tutte-novita); [Finanza e Fisco](https://www.finanzaefisco.com/testo-unico-iva-2027-dlgs-10-2026-struttura-tabelle-abrogazioni/); [ANCE](https://ance.it/2026/02/testo-unico-iva-ecco-come-cambia-la-normativa-di-riferimento-sul-valore-aggiunto/); [Fiscal Focus 28/01/2026](https://www.fiscal-focus.it/news-24/ore-21-00-testo-unico-iva-pubblicazione-in-gu-entro-fine-settimana-efficacia-dal-1deg-gennaio-2027,3,181185)
- Esiste un'analisi specialistica degli "impatti operativi su gestionali, registri ed e-fattura" del Testo unico — [QuotidianoPiù](https://www.quotidianopiu.it/dettaglio/16440001/testo-unico-iva-impatti-operativi-su-gestionali-registri-ed-e-fattura)
- Software aggiornati per TD29 e franchigia transfrontaliera (2025) — [Il Sole 24 Ore NT+](https://ntplusfisco.ilsole24ore.com/art/fattura-elettronica-software-aggiornati-gestire-documenti-td29-e-franchigia-iva-transfrontaliera-AH3KnUR)
- Servizio di integrazione del CUP su fatture già trasmesse dal 27/01/2026 — [Commercialista Telematico 03/2026](https://www.commercialistatelematico.com/articoli/2026/03/fattura-elettronica-verso-la-pa.html)

### Inferences
- **Requisito**: tutti i riferimenti normativi in descrizioni, Natura → "RiferimentoNormativo", diciture obbligatorie (es. "operazione non imponibile art. 8 DPR 633/72", "inversione contabile art. 17…") devono stare in **tabelle configurabili con validità temporale** (data inizio/fine), per passare ai riferimenti del Testo unico dal 01/01/2027 senza rilasci di codice.
- È plausibile che l'AdE pubblichi nuove specifiche (descrizioni TD/Natura) per allinearsi al Testo unico: è un'inferenza. Il motore di validazione va quindi progettato per supportare più versioni di specifiche in parallelo durante le transizioni.
- **Requisiti funzionali di sintesi** per il software, ricavati da tutte le sezioni:
  1. Generatore XML FPR12/FPA12/FSM10 v1.9.1 con validazione XSD e regole locali (Elenco controlli, incluso 00327), gestione allegati e lotti, rispetto del limite di 5 MB.
  2. Canale SdI: SDICoop accreditato (trasmissione + ricezione notifiche e passive) con PEC di backup; nomenclatura file univoca; codice destinatario a 7 caratteri per il passivo (fino a 300 per soggetto).
  3. Macchina a stati delle notifiche (RC/NS/MC/NE/DT/AT/MT), riemissione dopo scarto entro 5 giorni con stesso numero e data, alert di scadenza.
  4. Scadenziari: emissione a 12 giorni / 15 del mese successivo; TD17–19 al 15 del mese successivo; TD29 a 90 giorni; bollo trimestrale con soglia 5.000 €; conservazione al 31/01 (anno+2).
  5. Ciclo passivo: import XML/p7m, estrazione firma, autofatture e integrazioni TD16–TD29, gestione MC (area riservata).
  6. PA: IPA, CIG/CUP/NSO, firma qualificata, esiti EC01/EC02, split payment parametrico (stato post 30/06/2026 da verificare).
  7. Bollo virtuale: calcolo, riaddebito, report trimestrale, codici F24.
  8. Esclusioni: prestazioni sanitarie a persone fisiche (no SdI), copia di cortesia B2C.
  9. Archivio immutabile e export verso conservatore (metadati AgID Allegato 5), oppure adesione al servizio AdE.
  10. Modello dati semantico EN 16931-ready per ViDA 2030.

### Gaps
- Non è stato possibile verificare: altre novità 2026 dei servizi "Fatture e Corrispettivi" (es. nuove API, precompilata IVA), eventuali modifiche della Legge di Bilancio 2026 sulla fatturazione elettronica, stato dello split payment dopo il 30/06/2026. La ricerca si è interrotta per esaurimento del budget WebSearch e per il blocco di rete sul fetch delle pagine ufficiali.
