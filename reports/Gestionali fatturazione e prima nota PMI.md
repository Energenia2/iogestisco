# Costruire un Easyfatt snello, conforme e riservato

*Rapporto di ricerca per Giovanni D'Argento, amministratore di Energenia Srl (Conversano, BA). Data di riferimento: 10/10/2026. Perimetro: fatture attive, fatture passive e prima nota, senza magazzino, su piattaforma Windows con uso anche da remoto.*

Raccomando di **costruire un gestionale web snello**, installato sul server Windows aziendale con database **PostgreSQL** e raggiungibile da fuori ufficio **solo tramite VPN**. Il perimetro comprende fatture attive, fatture passive, prima nota cassa/banca con scadenzario, registri IVA e stima della liquidazione. **Contabilità generale e dichiarativi restano allo studio** che usa GB Software. Il trasporto verso lo SdI va affidato a un **intermediario via API a consumo** (circa 50-165 € l'anno per 500-3.000 transazioni) dietro un'interfaccia sostituibile. La conservazione va al **servizio gratuito dell'Agenzia delle Entrate**, la banca si gestisce con file **CBI RH/camt.053**. Un fatto **confermato dall'utente il 10/10/2026** semplifica molto il disegno: il commercialista **scarica già fatture attive e passive dal cassetto fiscale con delega e le importa in GB**. Verso lo studio il software deve quindi solo produrre XML FatturaPA di alta qualità ed esportare ciò che il cassetto non contiene: incassi, pagamenti, movimenti bancari e movimenti non IVA. Prima di scrivere codice conviene una prova di due settimane di **OpenSTAManager** come termine di paragone. **Odoo con OCA l10n-italy** ha senso solo se Energenia decide di portare in casa l'intera contabilità. Rispetto a Easyfatt si risparmiano circa **240-400 € l'anno di licenze**, che non ripagano lo sviluppo. Il progetto si giustifica con il controllo dei dati, l'assenza di soglie di volume e funzioni che in questa fascia di prezzo il mercato non offre: download dal cassetto, approvazione delle passive, commessa/cantiere, regole IVA del fotovoltaico, ritenuta dell'11% sui bonifici parlanti gestita in automatico. Il rischio principale è **restare conformi nel tempo**: specifiche FatturaPA 1.9.1 dal 15/05/2026, Testo unico IVA dal 01/01/2027, ritenuta tra imprese dal 2028, ViDA dal 01/07/2030. Tutta la ricerca si è svolta con la lettura diretta delle pagine bloccata dal proxy. Prezzi, specifiche tecniche e punti normativi controversi vanno quindi verificati sulle fonti primarie (sezione 10) prima di decidere o programmare.

---

## 1. Sintesi esecutiva: costruire il nucleo, delegare trasporto, conservazione e contabilità

La risposta è netta sull'architettura e condizionata sulla scelta tra costruire e adottare.

**Architettura.** Le prove indicano tutte la stessa soluzione: un'applicazione web con database relazionale vero, sul server aziendale, raggiunta da remoto solo via VPN. Easyfatt stesso **vieta l'archivio di lavoro in Dropbox o su percorsi di rete** e limita la multiutenza a 5 postazioni in LAN ([help Danea multiutenza](https://help.danea.it/easyfatt/html/Si_pu_usare_EasyFatt_in_rete_da_pi_computer_.htm); [help Danea copie di sicurezza](https://help.danea.it/easyfatt/html/Archivi_Copie_di_sicurezza.htm)). La documentazione SQLite avverte che i database su filesystem di rete si corrompono ([sqlite.org](https://sqlite.org/useovernet.html)). Gli ERP italiani convergono tutti su DBMS server più client browser ([EduPass Mexal](https://www.edupass.it/StreamFile/Resources/Documenti/Manuali/Mexal-Businesspass/NozioniGenerali.pdf); [Help Zucchetti AHR Web](https://help.zucchetti.it/dms/ticpro/help/sam/ahrw_standard/gscg/gscg_mpn.html)).

**Costruire o adottare.** Le note sull'open source tendono ad "adottare e personalizzare". Ammettono però che costruire da zero ha senso se il perimetro resta piccolo: emissione, ricezione e prima nota semplice, con la contabilità IVA "vera" lasciata al commercialista. È esattamente il caso di Energenia, e il fatto confermato sul cassetto fiscale lo rafforza.

**Integrazione con lo studio.** Il canale delle fatture è già risolto e non va duplicato. Mandare le stesse fatture anche con il tracciato "File Xml GB" esporrebbe lo studio alla **doppia registrazione** ([softwaregb.it File Xml GB](https://www.softwaregb.it/importazione-nota-file-xml-rilascio-utility-archivio/); [guidegbsoftware import FE](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/)).

| Decisione | Raccomandazione | Confidenza | Sezione |
|---|---|---|---|
| Costruire o adottare | Costruire un nucleo snello. Prima, prova di due settimane di OpenSTAManager come termine di paragone. Odoo + OCA solo se si internalizza la contabilità generale | Media | 8 |
| Perimetro | Fatture attive e passive, prima nota per risorsa (cassa, banche) con scadenzario, registri IVA gestionali e stima della liquidazione. Libro giornale, bilancio e dichiarativi restano allo studio | Alta (coerente con la richiesta) | 4 |
| Canale fatture verso lo studio | **Cassetto fiscale, già in uso dallo studio (confermato dall'utente il 10/10/2026)**. Il software non invia fatture allo studio: produce XML corretti (Natura, N6.7, DatiPagamento, sezionali concordati) | Alta | 6.5 |
| Dati non coperti dal cassetto | Incassi e pagamenti con riferimento fattura, movimenti bancari, movimenti non IVA (F24, ritenute subite 11%, giroconti, spese bancarie). Canale: File Xml GB limitato a pagamenti e non IVA, **se il tracciato lo consente**, oppure estratto conto/CSV per Riconcilia GB. Da confermare con lo studio | Media | 6.5 |
| Architettura | Web app monolitica sul Windows Server, PostgreSQL 18, accesso remoto WireGuard/Tailscale con MFA, nessuna porta esposta | Alta | 7 |
| Canale SdI | Intermediario API a consumo (Invoicetronic; alternativa Openapi) dietro un adattatore sostituibile. PEC come piano "massima riservatezza". SDICoop sconsigliato | Media (prezzi da riverificare) | 6.1 |
| Conservazione | Servizio gratuito AdE (adesione retroattiva) più archivio applicativo immutabile. Registri contabili secondo le prassi dello studio | Media | 6.3 |
| Banca | Import di file CBI RH / camt.053 / CSV. Open banking (PSD2) solo in fase 3, con contratto business | Media | 6.4 |
| Dropbox | Solo destinazione di backup già cifrati lato client. Mai database "vivo" | Alta | 7.6 |
| Windows | Verificare subito la versione del server: 2016 esce dal supporto il 12/01/2027. Per i PC Windows 10: passaggio a Windows 11 o ESU commerciale come ponte | Media-Alta | 7.1 |

---

## 2. Le prove vengono da estratti di ricerca, non da letture integrali

Il rapporto sintetizza **otto note di ricerca redatte il 10/10/2026**. Le condizioni erano degradate. Il proxy di rete ha bloccato il fetch diretto di quasi tutti i domini rilevanti: agenziaentrate.gov.it, fatturapa.gov.it, normattiva.it, danea.it, softwaregb.it, guidegbsoftware.it, learn.microsoft.com, garanteprivacy.it e altri. In diversi filoni anche il budget di ricerca si è esaurito.

Quasi ogni fatto viene quindi da **estratti restituiti dal motore di ricerca**, non dalla lettura integrale delle pagine. Le eccezioni sono due: i dati dei repository GitHub (stelle, licenze, date di aggiornamento), presi via API, e lo schema del database di Easyfatt, ricostruito da un progetto open source di terzi ([easyfatt-db-connector](https://github.com/LukeSavefrogs/easyfatt-db-connector/)).

Le note normative separano ciò che hanno verificato da ciò che è conoscenza pregressa del ricercatore. Il rapporto conserva quei marcatori e aggiunge una scala di confidenza.

| Marcatore | Significato |
|---|---|
| **[V]** | Verificato in sessione tramite estratti di fonti citate, per lo più secondarie autorevoli, non il testo ufficiale |
| **[N] / [NV]** | Conoscenza normativa o tecnica pregressa del ricercatore (aggiornata a circa giugno 2026), **non riletta in sessione** |
| **[I]** | Inferenza o proposta progettuale, non regola di legge né dato di fonte |
| **n.t.** | Non trovato nelle fonti raccolte |
| **A / M / B** | Confidenza **A**lta: fonte ufficiale citata o più fonti concordi. **M**edia: fonti secondarie concordi ma testo ufficiale non letto, oppure [N] consolidata. **B**assa: fonte singola o interessata, conflitto tra fonti, solo titolo letto |

Anche "Alta" significa "alta tra le evidenze disponibili in questa sessione". Nessun punto normativo va codificato senza il controllo sulla fonte primaria elencato nella sezione 10.

Un fatto ha uno statuto diverso: **la prassi attuale del commercialista, confermata direttamente da Giovanni il 10/10/2026**. Lo studio scarica fatture attive e passive dal portale Fatture e Corrispettivi / cassetto fiscale con delega e le importa in GB Software.

---

## 3. Easyfatt vende soglie, i cloud vendono banca, gli ERP vendono partita doppia

### 3.1 Quattro fasce di prezzo e un prodotto a metà strada

Il mercato cloud italiano si divide in quattro fasce ([note concorrenti cloud: Fatture in Cloud costo](https://www.fattureincloud.it/costo/); [Aruba listino](https://www.aruba.it/listino-fatturazione-elettronica.aspx); [TeamSystem Contabilità in Cloud prezzi](https://www.teamsystem.com/store/fatturazione-e-contabilita/contabilita-in-cloud/prezzi/)):

1. **Solo fatturazione elettronica a basso costo**: circa 25-90 € l'anno (Aruba, Legalinvoice, Pazienza) oppure gratis (portale AdE, SumUp).
2. **Gestionali leggeri a scalini**: circa 48-612 € l'anno (Fatture in Cloud, Fattura24). Banca, solleciti e OCR stanno nei piani alti.
3. **Partita doppia in cloud**: 782-1.826 € l'anno (TeamSystem Contabilità in Cloud, ex Reviso).
4. **Pacchetti con banca o commercialista**: Qonto, Fiscozen.

La prassi dominante è un **prezzo promozionale il primo anno e un rinnovo più caro del 25-150%**.

**Easyfatt** sta a metà strada: prezzo da fascia 2, funzioni da gestionale desktop.
- **Prima nota per risorsa in partita semplice**: un registro cassa/banca, non contabilità in partita doppia ([Danea prima nota](https://www.danea.it/software/easyfatt/prima-nota/); [Garda Informatica](https://www.gardainformatica.it/blog/consulenza/danea-easyfatt-pro-e-contro)).
- **Soglie annue di fatture elettroniche, inviate più ricevute**: 400 Professional, 800 Enterprise One, illimitate Enterprise ([FAQ Danea 585](https://www.danea.it/software/easyfatt/supporto/faq/?id=585)).
- **Multiutenza solo in Enterprise**: fino a 5 postazioni in LAN, con archivio Firebird `.eft` su un disco locale del PC server ([Danea novità DB](https://www.danea.it/blog/danea-easyfatt-novita-db/)).
- **Easyfatt Cloud**: lanciato a inizio 2026 con canone aggiuntivo. Esclude archivi con più di 20.000 prodotti o 40.000 documenti e non si usa insieme all'installazione locale ([help Easyfatt Cloud](https://help.danea.it/easyfatt/Easyfatt_Cloud.htm)).

Le critiche degli utenti riguardano il **modello commerciale più che il software**. Su Trustpilot ci sono circa 440 recensioni, in maggioranza negative, che lamentano rincari e soglie che spingono all'upgrade ([Trustpilot Danea](https://it.trustpilot.com/review/danea.it?page=2)). Su Capterra Italia il voto è 3,7/5 su 60 recensioni, con qualità/prezzo a 3,3 ([Capterra](https://www.capterra.it/compare/199642/209315/fatture-in-cloud/vs/easyfatt)).

**Fatture in Cloud** guida la fascia leggera:
- registrazione automatica delle passive per categoria;
- OCR "Genius" da Premium (252 €/anno);
- riconciliazione via TS Pay su CBI Globe, con suggerimenti AI e conferma in un clic ([FIC riconciliazione](https://www.fattureincloud.it/software-fatturazione/riconciliazione/)).

In cambio lega la ricezione al codice destinatario **M5UXCR1** ([FIC ricezione](https://www.fattureincloud.it/guida-fatturazione-elettronica/ricezione-fattura-elettronica/)).

Gli ERP desktop (Passepartout Mexal, Zucchetti Ad Hoc Revolution, Wolters Kluwer Arca Evolution) offrono:
- partita doppia guidata da causali;
- data di competenza IVA separata dalla data di registrazione;
- cruscotto delle passive;
- analitica per commessa.

Non hanno listini pubblici e ricevono critiche per l'interfaccia datata. Mexal su Capterra ha 4,6/5, ma su sole 9 recensioni ([Capterra Mexal](https://www.capterra.com/p/199649/Mexal/)).

### 3.2 Matrice comparativa

| Dimensione | Easyfatt (Professional → Enterprise) | Fatture in Cloud (Premium / Premium Plus) | Fattura24 (Business / Complete) | Aruba FE + moduli | Passepartout Mexal | Zucchetti AHR / WK Arca Evolution |
|---|---|---|---|---|---|---|
| **Prezzo 2026 (IVA esclusa)** | Professional ~180 €. Enterprise One 288-300 €. Enterprise 420-480 €. Cloud a parte (B) | Premium 252 €, Premium Plus 348 €, Complete 612 € | Business 144 → 192 €, Complete 288 → 384 € (1° anno → rinnovo) | 29,90 + 19,90 + 19,90 = 69,70 € | Nessun listino: canone o licenza tramite partner | Nessun listino: licenza più canone |
| **Fatture attive** | Ciclo completo preventivo → DDT → fattura. TD01/TD24 automatici, ritenute, Enasarco, bollo. SdI via TS Digital (M5UXCR1), conservazione 10 anni inclusa | FE in tutti i piani, ricorrenze, tracciamento email | FE completa. La sua API crea il documento ma non invia allo SdI | FE base | Ciclo documenti nella versione "Solution", Docuvision | Ciclo vendite con contabilizzazione automatica |
| **Fatture passive** | Download in tutte le edizioni. "Registra" (fornitore, castelletto IVA, scadenze) solo da Professional. Integrazioni TD16-TD18 | Registrazione automatica per categorie, OCR Genius, import ZIP **manuale** dal cassetto | Ricezione con codice SZLUBAI, registrazione manuale, OCR n.t. | Ricezione con codice KRRH6B9 (B) | Cruscotto "Da esaminare", anteprima modificabile, import sintetico o per riga | Contabilizzazione dei passivi guidata dalla causale |
| **Prima nota** | Cassa/banca per risorsa, partita semplice. Partita doppia solo con l'add-on Contabilità in Cloud | Prima nota per categorie, alimentata dai documenti | Prima nota con campo "piano dei conti". Bilancino e Budget vs Actual in Complete | Modulo Incassi e Pagamenti, giroconti | Partita doppia con causali, centri di costo, commesse | Partita doppia guidata da causali |
| **Scadenzario e solleciti** | Scadenzario a colori. Solleciti via email/WhatsApp/lettera. RiBa CBI, SDD e bonifici SEPA | Scadenzario Plus a calendario con F24, Google Calendar e Previsioni. Solleciti e RiBa da Premium Plus | n.t. | Solleciti automatici | Saldaconto, RiBa, bonifici SEPA (CUC) | Partite in tempo reale, distinte, insoluti |
| **Riconciliazione bancaria** | Confronto visivo. Automatica solo con TS Pay o Contabilità in Cloud (CSV) | PSD2 (TS Pay / CBI Globe). AI suggerisce, conferma in un clic, massiva, tolleranza ±1 €. Import CSV per oltre il 90% delle banche | Upload xls/csv dell'estratto conto | Presente, metodo n.t. | Dalla release 2022A: CBI RH, PSD2 a pagamento, "Mexal AI" | Arca: modulo con abbinamento automatico e manuale |
| **IVA** | Registri, liquidazione, file LIPE (da Professional). Non gestisce il regime del margine (N5) | Analisi trimestrale; liquidazione esplicita n.t. | n.t. | n.t. | Registri, liquidazione, LIPE, F24 senza moduli aggiuntivi | Registri e liquidazione |
| **Commercialista** | Export TeamSystem GeCom/Lynfa o PDF. GB legge direttamente il file .eft | Account commercialista gratuito, import nei software TeamSystem | n.t. | Area commercialista (fonte inaffidabile) | Passcom lavora sugli stessi dati | Ecosistema del produttore (Ago, Genya) |
| **Multiutenza / cloud** | Enterprise: 5 utenti solo in LAN, niente NAS, niente Dropbox. Easyfatt Cloud con limiti | Web nativo. Utenti con permessi (piano non confermato) | Business: 5 utenti | Web | Server a 64 bit Windows/Linux, client iDesk (Windows 10+) e web | SQL Server client-server, AHR Web, Ad Hoc Infinity web |
| **Privacy / sicurezza** | `.eft` Firebird apribile con credenziali di default (SYSDBA/masterkey): probabilmente non cifrato [I]. Controlli solo applicativi | Dati nel SaaS TeamSystem, lock-in sul codice destinatario | Dati nel SaaS | Dati nel SaaS | Possibile on-premise | Possibile on-premise |

Fonti della matrice:
- Easyfatt: [Danea caratteristiche](https://www.danea.it/software/easyfatt/caratteristiche/); [Gestionale Ideale](https://gestionaleideale.it/); [centrofiscale](https://centrofiscale.com/teamsystem-fatture-cloud-vs-danea-easyfatt-2026/); [help Danea import FE d'acquisto](https://help.danea.it/easyfatt/Importazione_fatture_elettroniche_d_acquisto.htm); [help Danea registri IVA](https://help.danea.it/easyfatt/html/Registri_e_Liquidazione_Iva.htm); [help Danea export commercialista](https://help.danea.it/easyfatt/Esportare_dati_vs_Commercialisti.htm); [PyPI easyfatt-db-connector](https://pypi.org/project/easyfatt-db-connector/).
- Fatture in Cloud: [help Scadenzario Plus](https://help.fattureincloud.it/help/articolo/145-scadenzario-scadenzario-plus); [help cassetto](https://help.fattureincloud.it/help/articolo/532-scarica-documenti-elettronici-ricevute-cassetto-fiscale-agenzie-entrate); [news riconciliazione](https://news.fattureincloud.it/riconciliazione-bancaria-pi%C3%B9-semplice-e-veloce-che-mai!-326474).
- Fattura24: [prezzi](https://www.fattura24.com/prezzi/); [riconciliazione](https://www.fattura24.com/manuale/altri-documenti/riconciliazione-bancaria/); [API](https://www.fattura24.com/api/crea-fattura-elettronica/).
- Aruba: [modulo Incassi e Pagamenti](https://www.pec.it/modulo-incassi-e-pagamenti.aspx).
- Mexal: [EduPass riconciliazione](https://www.edupass.it/StreamFile/Resources/materialevideocorsiriservati/corso_riconciliazione.pdf); [EduPass cruscotto fatture](https://prova-edupass.passweb.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=fatturazione-elettronica-con-servizio-invio-e-ricezione/cruscotto-fatture); [Ingest Mexal](https://ingest.it/soluzioni-gestionali/passepartout-mexal/gestione-contabilita/).
- AHR e Arca: [Help Zucchetti causale](https://help.zucchetti.it/dms/ticpro/help/sam/ahrw_standard/gscg/gscg_acc.html); [PmiSoftware Arca](https://www.pmisoftware.it/software-gestionale-arca-evolution/).

I prezzi di Easyfatt sono incoerenti tra listino Danea, rivenditore e confronto di terzi. Il prezzo ufficiale di Enterprise (35 o 40 €/mese?) e quello di Easyfatt Cloud **non sono stati letti sul listino** (confidenza B).

### 3.3 Cosa copiare da ciascuno

Il "meglio del mercato" non sta in un solo prodotto.

**Da Easyfatt**
- **Modello dati a documento unico**: testata, righe, castelletto IVA. Il tipo documento è governato da flag (`TTipiDoc`: Acq, Registraz, RegistroIva, UsaScadenzePagamento, NotaVariaz…).
- **Scadenzario e prima nota come una sola entità**: una rata saldata diventa un movimento. È il motivo per cui gli utenti lo trovano semplice ([models.py](https://github.com/LukeSavefrogs/easyfatt-db-connector/)).

**Da Fatture in Cloud**
- registrazione automatica delle passive;
- riconciliazione massiva con tolleranza sugli arrotondamenti e collegamento degli F24;
- vista calendario e previsioni di cassa;
- accesso gratuito del commercialista;
- API OAuth2 con webhook sui documenti ricevuti ([FIC webhook](https://developers.fattureincloud.it/docs/webhooks/subscriptions/)).

**Da Mexal**
- **cruscotto delle passive con stati** e anteprima modificabile;
- doppia modalità di import, sintetica (conto automatico) o per riga;
- import dell'estratto conto **CBI RH** con aggancio del conto via IBAN e tabella delle causali CBI ([EduPass import fatture](https://prova-edupass.passweb.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=fatture-ricevute-con-ritenuta/registrazione-fattura-e-pagamento/import-fatture)).

**Da Ad Hoc Revolution**
- **la causale come modello della registrazione**: registro IVA, contropartita IVA, partite;
- **data di competenza IVA separata** dalla data di registrazione ([Help Zucchetti prima nota](https://help.zucchetti.it/dms/ticpro/help/sam/ahrw_standard/gscg/gscg_mpn.html)).

**Da Bluenext e Acut**
- **reverse charge in un solo passaggio**: una registrazione genera la doppia annotazione con secondo protocollo, e l'integrazione TD16 inviata allo SdI non si contabilizza di nuovo ([Bluenext TD16](https://helpdesk.bluenext.it/it/support/solutions/articles/32000032181-autofattura-td16); [Acut](https://learning.acut.it/tutorial/gestione-prima-nota)).

---

## 4. Il prodotto: funzioni in tre fasi e sei lacune di mercato da occupare

Il principio guida [I] è offrire la **semplicità d'uso di Easyfatt sopra un modello dati rigoroso**:
- documento unico con righe, castelletto IVA e rate;
- registrazioni sempre collegate al documento d'origine e all'identificativo SdI;
- un registro interno a partita doppia "nascosto", in cui ogni movimento ha due lati (risorsa e contropartita), così l'export verso lo studio e le quadrature sono banali;
- **tutte le regole normative in tabelle con data di validità**, perché dal 01/01/2027 cambia la numerazione delle norme (sezione 5);
- un modello semantico allineato a EN 16931 per ViDA.

Le fasi sono tre:
- **MVP**: quanto serve per spegnere Easyfatt nel perimetro richiesto ed essere conformi dal giorno del passaggio.
- **Fase 2**: automazioni e integrazioni che tolgono lavoro manuale.
- **Fase 3**: funzioni con più incertezza tecnica o normativa.

"Condizionale" indica funzioni che dipendono dalle risposte di Giovanni (sezione 11). Il simbolo **★** marca una lacuna di mercato: la funzione non risulta offerta in questa fascia di prezzo da nessuno dei prodotti analizzati. È un'inferenza da assenza di evidenze, non da verifica esaustiva.

### 4.1 Ciclo attivo

| ID | Funzione | Fase | Riferimento "meglio del mercato" |
|---|---|---|---|
| A1 | Anagrafiche clienti per tipo (privato, impresa, PA, estero): codice destinatario o PEC, split payment con date di validità, P.IVA/CF obbligatori | MVP | Easyfatt `TAnagrafica` (FE_CodUfficio, Pec); elenchi MEF |
| A2 | Documenti TD01, TD02 (acconto), TD04, TD05. Fattura finale con storno degli acconti. Preventivo e proforma non fiscali | MVP (preventivo in fase 2 se attualmente non è usato) | Easyfatt, inclusioni a cascata |
| A3 | **Sezionali concordati con lo studio** (ordinarie, reverse charge N6.7, split payment, note di credito, autofatture), con numerazione univoca per anno e sezionale | MVP | GB assegna la causale contabile in base al sezionale ([guidegbsoftware](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/)) |
| A4 | Motore dei codici IVA: aliquota, Natura, Esigibilità, RiferimentoNormativo e dicitura in tabelle con validità temporale | MVP | Testo unico IVA dal 01/01/2027 |
| A5 ★ | **Regole IVA di settore come proposta da confermare**: 10% FV, N6.7 per installazioni su edifici verso soggetti IVA, IVA ordinaria per FV a terra non pertinenziale e agrivoltaico, wallbox al 10% solo se unitaria con il FV, beni significativi 10%/22% calcolati in automatico | MVP (regole validate dallo studio) | Nessun prodotto lo documenta |
| A6 | Bollo virtuale automatico oltre 77,47 € di importi senza IVA, riaddebito opzionale, report trimestrale | MVP | Easyfatt Opzioni > Varie |
| A7 | XML FPR12/FPA12 secondo v1.9.1, validazione XSD e controlli locali (incluso 00327), nome file univoco, limite di 5 MB | MVP | FatturaElettronica.NET o validazione dell'intermediario |
| A8 | Stati SdI: bozza, inviata, poi RC/NS/MC (per la PA anche NE EC01/EC02, DT, AT). Riemissione entro 5 giorni con stesso numero e data. Codici di scarto spiegati in chiaro | MVP | Specifiche SdI |
| A9 | Scadenzario di emissione (12 giorni per l'immediata, 15 del mese successivo per la differita) con avvisi | MVP | Sezione 5 |
| A10 | Clienti esteri: codice XXXXXXX, CAP 00000, Natura N2.1/N3.x | Condizionale | Danea, Money.it |
| A11 | Pubblica amministrazione: FPA12, codice IPA a 6 caratteri, CIG/CUP/NSO strutturati, firma qualificata tramite l'intermediario | Condizionale | Invoicetronic, firma a 0,02 € |
| A12 | PDF di cortesia (XSL → HTML → PDF), invio email, promemoria "pagare con bonifico parlante" sui lavori agevolati | MVP | Easyfatt; prassi detrazioni |
| A13 | Fattura differita TD24 da rapporti d'intervento o DDT | Fase 2 (se usata) | Easyfatt TD24 automatico |
| A14 ★ | Campo "incentivo" sulla commessa (bonus casa/ecobonus, Conto Termico 3.0, iperammortamento, nessuno) con diciture e regole d'incasso parametriche | Fase 2 | Nessuno; regole CT 3.0 non verificate |
| A15 | Solleciti automatici e link di pagamento | Fase 2 | FIC Premium Plus; Easyfatt |

### 4.2 Ciclo passivo

| ID | Funzione | Fase | Riferimento "meglio del mercato" |
|---|---|---|---|
| B1 | Ricezione dall'intermediario (codice destinatario registrato) con interrogazione periodica in uscita. Import manuale di XML, P7M e ZIP con estrazione della busta CAdES | MVP | FIC; Mexal; OpenSSL/BouncyCastle |
| B2 | Cruscotto con stati: da esaminare, in approvazione, approvata, registrata, pagata. Deduplica per IdSdI o hash | MVP (stati base) | Mexal Docuvision |
| B3 ★ | **Workflow di approvazione**: il responsabile di commessa approva, l'amministrazione registra, la fattura diventa pagabile solo se approvata | Fase 2 | Nessuna evidenza in FIC, Fattura24, Aruba, Legalinvoice |
| B4 | Fornitore riconosciuto o creato da P.IVA. Conto, categoria e commessa di default per fornitore, con memoria dell'ultima scelta. Import sintetico o per riga | MVP | FIC "Da registrare"; Mexal F10/F4 |
| B5 ★ | **Commessa/cantiere su ogni riga di costo** già all'import | MVP (etichetta), fase 2 (margini) | Mexal analitica; assente in Easyfatt e nei cloud leggeri |
| B6 | Riconoscimento automatico di N6.x, ritenuta d'acconto e cassa previdenziale. Scadenze dal blocco DatiPagamento | MVP | Mexal, Easyfatt "Registra" |
| B7 | Reverse charge in un passaggio: doppia annotazione con secondo protocollo, TD16 opzionale collegato e non ricontabilizzato | MVP | Bluenext, Acut |
| B8 | Integrazioni per acquisti esteri TD17/TD18/TD19 (TD28 per San Marino) con scadenza al 15 del mese successivo | Condizionale | Easyfatt Professional |
| B9 | Periodo di detrazione proposto: ricezione o operazione; sezionale "anno precedente" fino al 30/04 | MVP | Art. 19 DPR 633/72, DPR 100/98 [N] |
| B10 ★ | **Quadratura con il cassetto fiscale**: import ZIP manuale (MVP), download automatico giornaliero tramite provider con Delega Unica (fase 2). Priorità ridotta: lo studio scarica già dal cassetto | MVP / Fase 2 | A-Cube; FIC solo import manuale |
| B11 | Avviso TD29 a 90 giorni su fatture attese e non ricevute o irregolari | Fase 3 | Specifiche 1.9 |
| B12 | Acquisizione di PDF, foto ed email di documenti non SdI (esteri, servizi SaaS, ricevute) con estrazione AI | Fase 3 | FIC Genius, Invoox, Quoro |

### 4.3 Prima nota, banca e scadenzario

| ID | Funzione | Fase | Riferimento "meglio del mercato" |
|---|---|---|---|
| C1 | Prima nota per risorsa (cassa, banche, carte) alimentata da incassi e pagamenti dei documenti. Movimenti manuali con categorie, giroconti, saldo a una data | MVP | Easyfatt `TPrimaNota` / `TRisorse` |
| C2 | Campo "mezzo di pagamento" con controlli: contante ≥ 5.000 €, trasferte pagate in contanti, incasso di lavori agevolati non arrivato da bonifico parlante | MVP | Note normative A9 [N] |
| C3 | Scadenzario attivo e passivo da condizioni di pagamento e DatiPagamento, con vista calendario | MVP | FIC Scadenzario Plus |
| C4 | Import dell'estratto conto CBI RH, camt.053 e CSV per banca. Deduplica su IBAN, data, importo e riferimento | MVP | Mexal 2022A; FIC CSV |
| C5 | Riconciliazione semi-automatica: proposta per importo, data, controparte e riferimento; conferma in un clic; riconciliazione massiva; tolleranza sugli arrotondamenti | MVP (regole), fase 2 (apprendimento) | FIC |
| C6 ★ | **Ritenuta 11% sui bonifici parlanti**: la differenza tra lordo e netto accreditato va a "Erario c/ritenute subite", anche con acconti multipli | MVP | Nessun prodotto la documenta |
| C7 | Pagamenti a professionisti con ritenuta 20%: netto pagato più debito "Erario c/ritenute da versare", con scadenza F24 al 16 del mese successivo | MVP | Art. 25 DPR 600/73 [N] |
| C8 | Distinte pain.001 CBI v00.04.01 (bonifici), SDD pain.008, RiBa CBI | Fase 2 (condizionale) | Easyfatt, Mexal |
| C9 | Previsioni di cassa da crediti e debiti, Budget vs Actual | Fase 2 | FIC Previsioni; Fattura24 Complete |
| C10 | Open banking PSD2 con gestione del rinnovo del consenso ogni 180 giorni | Fase 3 | FIC/TS Pay; Mexal |
| C11 | Registro interno a partita doppia: il modello dati nasce nel MVP; causali configurabili e bilancino arrivano in fase 2 | MVP (dati) / Fase 2 (funzioni) | Causali AHR [I] |

### 4.4 IVA e adempimenti

| ID | Funzione | Fase | Riferimento "meglio del mercato" |
|---|---|---|---|
| D1 | Registri IVA vendite e acquisti per sezionale, stampa PDF su richiesta con numerazione delle pagine | MVP | Easyfatt Professional; DL 357/94 [N] |
| D2 ★ | **Stima della liquidazione IVA spiegabile**: dettaglio per documento, split payment escluso, reverse charge, credito IVA strutturale, aliquota media acquisti contro vendite (presupposto del rimborso) | MVP | Easyfatt ha la liquidazione; i cloud leggeri no |
| D3 | Scadenzario fiscale: versamenti del 16, LIPE, acconto del 27/12, bollo 2521-2524 | Fase 2 | Note normative |
| D4 | Export LIPE in XML, se lo studio non la produce | Fase 2 | Easyfatt |
| D5 | Dati per F24: bollo, ritenute 1040 | Fase 2 | |
| D6 | Archivio dei dati dei percipienti per CU e 770 | Fase 3 | |
| D7 | Tabelle per la ritenuta tra imprese (0,5% nel 2028, 1% dal 2029) lato pagamenti e lato incassi | Fase 3 (struttura nel MVP) | L. 199/2025 |
| D8 | Modello semantico EN 16931 ed export UBL/CII | Principio nel MVP, output prima del 01/07/2030 | ViDA |

### 4.5 Commercialista, dati e piattaforma

| ID | Funzione | Fase | Riferimento "meglio del mercato" |
|---|---|---|---|
| E1 | **Qualità dell'XML come interfaccia verso lo studio**: sezionali concordati, P.IVA/CF completi, Natura corrette (N6.7, N6.3, N2/N3/N4), DatiPagamento completi (modalità, IBAN, scadenze), riferimenti di commessa in `AltriDatiGestionali`. Lo studio legge le fatture dal cassetto (confermato dall'utente il 10/10/2026) | MVP | GB attribuisce causale e IVA da XML, sezionale e anagrafica |
| E2 | Export di pagamenti e movimenti non IVA per lo studio: incassi e pagamenti con riferimento fattura, F24, ritenute subite, giroconti, spese bancarie. Canale da concordare: File Xml GB limitato a pagamenti e non IVA, oppure estratto conto/CSV per Riconcilia GB | MVP (CSV) / Fase 2 (File Xml GB, appena c'è la specifica) | GB può leggere i pagamenti dal `.eft` di Danea (uso attuale da verificare) |
| E3 | Export CSV/Excel di prima nota, scadenzario e registri in ogni vista | MVP | Critica degli utenti Mexal |
| E4 | ZIP degli XML del periodo con nomi file e ricevute originali, solo come canale di riserva o per lo storico | MVP | GB "Importa Storico Fatture" (fino a 500 file) |
| E5 | Accesso ospite del commercialista in sola lettura | Fase 2 | FIC, account commercialista gratuito |
| E6 | Migrazione da Easyfatt: lettura del `.eft` (Firebird) o dell'Easyfatt-Xml; anagrafiche, storico documenti, scadenze aperte | MVP | [easyfatt-db-connector](https://pypi.org/project/easyfatt-db-connector/); [Easyfatt-Xml](https://www.danea.it/software/easyfatt/xml/) |
| E7 | API REST con OAuth2 e webhook "documento ricevuto" | Fase 3 | FIC API v2 |
| F1 | Utenti nominali, ruoli (amministrazione, commesse, sola lettura), MFA TOTP o WebAuthn | MVP | Easyfatt: permessi per tipo documento |
| F2 ★ | **Registro di audit in sola aggiunta con catena di hash**. Documenti emessi immutabili: si rettifica solo con storni | MVP | Easyfatt: protezione solo applicativa |
| F3 | Archivio immutabile di XML, p7m e notifiche con SHA-256 e metadati | MVP | Sezione 6.3 |
| F4 | Backup cifrato 3-2-1-1-0 con prova di ripristino trimestrale | MVP | Sezione 7.6 |
| F5 | Nessuna soglia di volume o di utenti | MVP | Principale lamentela verso Easyfatt |
| F6 | Accesso da browser su qualsiasi sistema operativo, in LAN e via VPN | MVP | |
| F7 | PWA mobile per fotografare documenti e consultare dati | Fase 3 | Danea Transfer (solo iPhone) |

### 4.6 Le lacune che un prodotto su misura può occupare

Sei lacune emergono dalle note con coerenza.

1. **Download automatico dal cassetto fiscale.** Fatture in Cloud permette solo l'import manuale di uno ZIP ([FIC help 532](https://help.fattureincloud.it/help/articolo/532-scarica-documenti-elettronici-ricevute-cassetto-fiscale-agenzie-entrate)). L'automazione esiste solo presso provider API come A-Cube, con Delega Unica ([A-Cube](https://www.acubeapi.com/prodotti/api-download-cassetto-fiscale)). Per Energenia la lacuna pesa meno, perché lo studio scarica già dal cassetto. Il download automatico resta utile per la quadratura interna (fatture recapitate altrove, codici destinatario sbagliati), ma scende a fase 2.
2. **Approvazione delle passive.** Nessuna evidenza in Fatture in Cloud, Fattura24, Aruba o Legalinvoice.
3. **Stima della liquidazione IVA spiegabile.** I cloud leggeri mostrano al massimo l'IVA in un'analisi trimestrale. Easyfatt Professional ha la liquidazione e la LIPE, ma senza le specificità del settore.
4. **Commessa/cantiere** come dimensione di riga. Negli ERP c'è ([EduPass analitica Mexal](https://www.edupass.it/manuali/manualistica-mexal/manuale-prodotto?a=manuale-prodotto%2Fazienda%2Fcontrollo-di-gestione%2Fintroduzione)), ma a prezzi e complessità di un'altra fascia.
5. **Logica verticale dell'installatore**: aliquote del fotovoltaico, N6.7, beni significativi, wallbox. Nessun prodotto analizzato la documenta.
6. **Riconciliazione che riconosce la ritenuta dell'11%** e la sposta in automatico su "Erario c/ritenute subite". Nessun prodotto analizzato la documenta.

Per Energenia, che vende spesso al 10% o in reverse charge e acquista anche al 22%, le lacune 3, 5 e 6 hanno lo stesso effetto: generano **credito IVA strutturale** e incassi netti inferiori al fatturato. Sono quindi le funzioni che più cambiano la qualità della gestione finanziaria quotidiana.

---

## 5. Checklist normativa a ottobre 2026: trenta requisiti, due contraddizioni risolte

### 5.1 Requisiti e livello di confidenza

| # | Requisito (stato al 10/10/2026) | Cosa deve fare il software | Conf. | Fonte |
|---|---|---|---|---|
| N1 | **Allegato A, Specifiche tecniche v1.9.1**, obbligatorio dal **15/05/2026**: i file non conformi sono scartati. Pubblicato il 31/03/2026 secondo l'AdE (il 15/04/2026 secondo PwC). Novità: **controllo 00327** sui Gruppi IVA, stringa **ESENZSPORT**, codici destinatario richiedibili da 100 a **300**, procedure di accreditamento WS/SFTP aggiornate. La v1.9 (dal 01/04/2025) aveva introdotto **TD29**, **RF20** e tolto il limite di 400 € alla semplificata per forfettari e franchigia | Validatore con versioni, controlli locali (incluso 00327). L'XSD probabilmente non cambia con la 1.9.1 [I, NV] | A (date) / B (XSD invariato) | [AdE Allegato A 1.9.1](https://www.agenziaentrate.gov.it/portale/documents/d/guest/allegato-a-specifiche-tecniche-vers-1-9-1); [IPSOA](https://www.ipsoa.it/documents/quotidiano/2026/04/02/e-fattura-nuove-specifiche-tecniche-15-maggio-2026); [PMI.it](https://www.pmi.it/tecnologia/software-e-web/493394/fattura-elettronica-specifiche-tecniche-sdi-1-9-1.html); [ApriDigitale](https://www.apridigitale.it/fatturazione-elettronica/guida-sviluppatori-1-9-1); [Fabersystem](https://www.fabersystem.it/novita-dal-1-aprile-2025-nuove-specifiche-tecniche-per-la-fatturazione-elettronica-ecco-cosa-cambia/) |
| N2 | Formati: **FPR12** (privati), **FPA12** (PA), **FSM10** (semplificata fino a 400 €). Namespace `.../fatture/v1.2` [NV] | Tre generatori, un solo modello dati | M | [AdE regole tecniche](https://www.agenziaentrate.gov.it/portale/normativa-prassi-e-regole-tecniche-fatture-elettroniche) |
| N3 | TipoDocumento TD01-TD06 e TD16-TD29. **TD29** = comunicazione del cessionario per omessa o irregolare fatturazione, **entro 90 giorni**; se manca, sanzione del 70% con minimo 250 €. TD20 resta per art. 6 c.9-bis D.Lgs. 471/97 e art. 46 c.5 DL 331/93 | Tabella TD completa, flussi di autofattura con il fornitore come cedente | M (TD03, TD06, TD16, TD21-23 [NV]) | [Informazione Fiscale](https://www.informazionefiscale.it/Fattura-elettronica-2025-specifiche-tecniche-codice-TD29) |
| N4 | Natura N1-N7 con sottocodici: **N6.3** subappalto edile, **N6.7** comparto edile e settori connessi, **N6.8** settore energetico. **RF19** = forfettario, **RF20** = franchigia transfrontaliera (una guida li confonde) | Blocchi in validazione: Natura obbligatoria con aliquota 0, Esigibilità S incompatibile con N6.x [NV] | M | [Fiscomania codici](https://fiscomania.com/codici-fattura-elettronica/) |
| N5 | Notifiche **RC, NS, MC**; solo PA: **NE** (EC01 accettazione, EC02 rifiuto), **DT** dopo 15 giorni, **AT**. Lo SdI risponde entro 5 giorni. La fattura scartata è **non emessa** e va ritrasmessa entro 5 giorni, preferibilmente con **stesso numero e data** (circ. 13/E/2018). Le fonti divergono su giorni lavorativi o solari | Macchina a stati, avvisi a 5 giorni | A/M | [AdE circ. 13/E](https://www.agenziaentrate.gov.it/portale/-/cs-02072018-cs-circolare-13-fattura-elettronica); [Specifiche SdI v1.8.1](https://www.fatturapa.gov.it/export/documenti/Specifiche_tecniche_SdI_v1.8.1.pdf) |
| N6 | Fattura immediata entro **12 giorni** dall'operazione, con la data dell'operazione. Differita (TD24) entro il **15 del mese successivo** (circ. 14/E/2019) | Scadenziario di emissione; DataDocumento separata dalla data SdI | A | [AdE FAQ emissione](https://www.agenziaentrate.gov.it/portale/schede/comunicazioni/fatture-e-corrispettivi/faq-fe/risposte-alle-domande-piu-frequenti-categoria/emissione-delle-fatture-elettroniche) |
| N7 | Limiti: **5 MB** per file (anche zip e lotto), **30 MB** per messaggio PEC. Nome file = IT + identificativo del trasmittente + progressivo alfanumerico di massimo 5 caratteri. Primo invio PEC a sdi01@pec.fatturapa.it [NV] | Contatore del nome file persistente, divisione dei lotti sotto i 5 MB | M | [Specifiche SdI v1.8.1](https://www.fatturapa.gov.it/export/documenti/Specifiche_tecniche_SdI_v1.8.1.pdf) |
| N8 | L'**indirizzo telematico registrato prevale** sul CodiceDestinatario scritto nell'XML. "0000000" si usa solo con PEC. Con MC la fattura è comunque emessa ed è nell'area riservata del cliente. Dall'08/12/2025 la registrazione dell'indirizzo è delegabile con la Delega Unica | Pianificare il passaggio del codice destinatario (sezione 6.1) | M/A | [CDA Studio](https://www.cdastudio.it/news/news-fiscalita/241-fattura-elettronica-e-codice-destinatario); [FiscoeTasse Delega Unica](https://www.fiscoetasse.com/new-rassegna-stampa/2660-delega-unica-agli-intermediari-nuove-modalita-dall8-dicembre-2025.html) |
| N9 | Firma qualificata obbligatoria **solo per FPA12** (CAdES-BES .p7m o XAdES-BES), facoltativa per i privati | Firma tramite l'intermediario o con il dispositivo del legale rappresentante | A | [Invoicetronic](https://invoicetronic.com/en/pricing/); [fatturapa.gov.it FAQ](https://www.fatturapa.gov.it/it/faq/FAQ_file_fatturapa.htm/) |
| N10 | **Bollo** da 2 € sulle fatture con importi senza IVA oltre 77,47 €, BolloVirtuale = SI. F24 con codici **2521-2524** per trimestre di **emissione** (2525 sanzioni, 2526 interessi). Scadenze: 01/06/2026, 30/09/2026, 30/11/2026, poi 01/03/2027 (il 28/02/2027 cade di domenica). Elenchi A e B dell'AdE. Differimento sotto i 5.000 € (solo fonti secondarie). Sanzione 25% dopo il D.Lgs. 87/2024 [NV] contro 30% nelle fonti 2021-22 | Calcolo automatico, report trimestrale riconciliabile con l'elenco A | M (importi e codici) / B (soglia e sanzione) | [AdE guida bollo giugno 2026](https://www.agenziaentrate.gov.it/portale/documents/d/guest/l-imposta_di_bollo_sulle_fatture_elettronichegiugno2026); [Mastro.tax](https://mastro.tax/guida-imposta-bollo-fattura-elettronica-2026) |
| N11 | Estero: vendite con codice **XXXXXXX**; acquisti con **TD17/TD18/TD19** entro il 15 del mese successivo (per TD19 una fonte dice 12 giorni). Esclusi gli acquisti non territoriali fino a 5.000 € [NV] | Integrazione generata dalla registrazione | M | [Money.it](https://www.money.it/esterometro-2026-come-funziona-e-soggetti-obbligati); [Fiscomania](https://fiscomania.com/autofattura-guida-casi-emissione/) |
| N12 | Conservazione a norma per emittente e ricevente, entro il terzo mese dal termine della dichiarazione dei redditi: **per le fatture 2025 entro il 31/01/2027** [NV] (una guida indica il 31/12). Il servizio AdE è **gratuito, solo per i file SdI**, li tiene 15 anni e ammette adesione retroattiva. Durata dell'accordo in conflitto tra fonti. Conservazione per 10 anni (art. 2220 c.c.) | Archivio immutabile più adesione AdE; non è conservazione a norma "in proprio" | M | [AdE conservazione](https://www.agenziaentrate.gov.it/portale/aree-tematiche/fatturazione-elettronica/guida-fatturazione-elettronica/come-predisporre-inviare-ricevere-fe/come-si-conservano-fe); [Sibill](https://sibill.com/contabilita/fatturazione-elettronica-e-conservazione-guida-e-scadenze-2026/) |
| N13 | **Split payment** fino al **30/06/2029** (vedi 5.2). Esigibilità S, dicitura "scissione dei pagamenti". Escluso con reverse charge e su compensi con ritenuta [N]. Società del FTSE MIB escluse dal 01/07/2025 | Flag sul cliente con validità, fine regime parametrica | M-A | [Namirial](https://focus.namirial.com/it/split-payment-proroga-2029-cosa-cambia-per-imprese-pa/); [MySolution](https://www.mysolution.it/fisco/approfondimenti/commenti/2026/07/split-payment-confermato-fino-al-30-giugno-2029-proroga-ue-e-quadro-operativo-della-disciplina-setti/) |
| N14 | **Reverse charge per installazione di impianti** relativi a edifici (art. 17 c.6 lett. a-ter), Natura **N6.7**, dicitura "inversione contabile". Per il FV conta il **nesso funzionale con l'edificio** (circ. 37/E/2015). Agrivoltaico e FV a terra non pertinenziale vanno a IVA ordinaria. Esclusa la cessione con posa. Subappalto edile con ATECO F: **N6.3**. Il reverse charge prevale sullo split payment [N] | Regola di decisione (5.3) e campo "tipo contratto" obbligatorio sulla commessa | M | [ECnews agrivoltaico](https://www.ecnews.it/fiscale/fisco-e-patrimonio/iva/limpianto-agrivoltaico-non-ricade-nel-regime-del-reverse-charge-2/); [ANCE 37/E](https://ance.it/2015/12/estensione-del-reverse-charge-c-m-37-e-2015/?print=pdf); [ECnews FV](https://www.ecnews.it/fiscale/?p=34712) |
| N15 | **IVA 10% per il FV** (Tab. A parte III, n. 127-quinquies/sexies/septies; circ. 36/E/2013) [V]. Wallbox al 10% **solo se installata insieme al FV** (risposta 218/2020) [V]. Accumulo: nessun interpello IVA, prassi al 10% (B). Solare termico al 10%: letto solo il titolo di un articolo (B). Manutenzione su abitativo al 10% con regola dei **beni significativi** (DM 29/12/1999; L. 205/2017 c.19; circ. 15/E/2018). Pompe di calore come bene significativo: incerto (B) | Tabella decisionale (5.3), algoritmo dei beni significativi | M (FV, wallbox) / B (accumulo, termico, PdC) | [ANCE Mantova 36/E](https://mantova.ance.it/2014/01/31/impianti-fotovoltaici-chiarimenti-dell-agenzia-delle-entrate-c-m-36-e-2013/?print=pdf); [QualEnergia](https://www.qualenergia.it/pro/articoli-pro/aliquota-iva-al-10-per-le-colonnine-di-ricarica-ma-solo-se-installate-insieme-a-un-impianto-fotovoltaico/); [CNA Bologna](https://bo.cna.it/wp-content/uploads/2025/03/Maletti_310321_IVA.pdf); [ANCE Siracusa 15/E](https://siracusa.ance.it/2018/07/20/iva-al-10-e-beni-significativi-i-chiarimenti-dell-agenzia-delle-entrate-c-m-15-e-18/?print=pdf) |
| N16 | **Ritenuta dell'11% sui bonifici parlanti dal 01/03/2024** (L. 213/2023 c.88, modifica dell'art. 25 DL 78/2010; prima era 8%). Base al netto dell'IVA. Si scomputa dall'IRES. Non è chiaro se la banca scorpori l'IVA al 22% o all'aliquota effettiva | Regola di riconciliazione (5.4), conto "Erario c/ritenute subite" | A (aliquota e data) / B (scorporo) | [ECnews](https://www.ecnews.it/fiscale/in-pratica/guida-agli-adempimenti/la-ritenuta-sui-bonifici-parlanti/); [Eutekne](https://www.eutekne.info/Sezioni/Art_993635_aumento_della_ritenuta_all_11_per_i_bonifici_parlanti_da_domani.aspx); [FiscoeTasse](https://www.fiscoetasse.com/rassegna-stampa/13513-per-il-36-e-55-ritenuta-al-netto-iva.html) |
| N17 | Ritenute subite: **condominio 4%** (art. 25-ter) [N], con esclusione da riverificare quando si paga con bonifico parlante. **Ritenuta tra imprese** (L. 199/2025 c.112-114): **0,5% nel 2028, 1% dal 2029**, applicata al pagamento sul netto IVA, esclusi i pagamenti già soggetti all'art. 25 DL 78/2010. Decreti attuativi non emanati | Tabelle parametriche con validità, credito per anno e tipo | M / B | [MySolution](https://www.mysolution.it/fisco/informazioni/news/2026/01/02/nuova-ritenuta-dacconto-tra-imprese-dal-2028/); [NT+ Fisco](https://ntplusfisco.ilsole24ore.com/art/ritenuta-d-acconto-fattura-dal-2028-l-esempio-dell-iva-semplificare-l-adempimento-AIDxwLaB) |
| N18 | Ritenute operate da Energenia: **20% ai professionisti**, codice 1040, versamento entro il 16 del mese successivo al pagamento. Agenti: 23% sul 50% delle provvigioni, codice 1038. CU entro il 16/03 [N] | Debito al pagamento (non alla fattura), dati per CU e 770 | M | [Normattiva DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600) |
| N19 | Registrazione: fatture emesse entro il 15 del mese successivo; acquisti prima della liquidazione in cui si detrae e comunque entro la dichiarazione dell'anno di ricezione. Detrazione anticipata al mese dell'operazione se la fattura è ricevuta e annotata entro il 15, salvo a cavallo d'anno. Libro giornale entro 60 giorni [N] | Avvisi bloccanti, proposta del periodo di detrazione | M | [Normattiva DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633); [DPR 100/98](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1998-03-23;100) |
| N20 | Liquidazione mensile entro il 16. Trimestrale facoltativa con volume d'affari fino a 500.000 € (servizi) o 800.000 € (altre attività), più l'1%. Acconto entro il 27/12. LIPE (31/05, 16/09, 30/11, fine febbraio). Dichiarazione dal 01/02 al 30/04 [N] | Stima della liquidazione, scadenzario fiscale | M / B (soglie) | [Normattiva DL 78/2010](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:2010-05-31;78) |
| N21 | Una Srl è **sempre in contabilità ordinaria**. La prima nota **non è un libro obbligatorio**. Registri tenuti in elettronico: regolari se aggiornati e stampati su richiesta dei verificatori (art. 7 c.4-quater DL 357/94) [N] | I registri del software sono gestionali. Quelli ufficiali li tiene lo studio (da confermare) | M | [Normattiva DL 357/94](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:1994-06-10;357) |
| N22 | **Testo unico IVA, D.Lgs. 10/2026**: pubblicato in GU il 30/01/2026, **efficace dal 01/01/2027**, 171 articoli, natura compilativa (vedi 5.2) | Riferimenti normativi e diciture in tabelle datate. Possibile nuova versione delle specifiche [I] | A (pubblicazione) / B (corrispondenze) | [FiscoeTasse](https://www.fiscoetasse.com/normativa-prassi/13548-nuovo-testo-unico-iva-in-vigore-dal-2027-il-testo-pubblicato-in-gu.html); [ANCE](https://ance.it/2026/02/testo-unico-iva-ecco-come-cambia-la-normativa-di-riferimento-sul-valore-aggiunto/); [QuotidianoPiù](https://www.quotidianopiu.it/dettaglio/16440001/testo-unico-iva-impatti-operativi-su-gestionali-registri-ed-e-fattura) |
| N23 | **ViDA**: Dir. (UE) 2025/516 in vigore dal 14/04/2025. Dal **01/07/2030** il B2B intra-UE richiede e-fattura EN 16931 e comunicazione digitale dei dati (DRR). I sistemi nazionali precedenti al 2024, come lo SdI, si allineano entro il **01/01/2035**. Finestre DRR in conflitto (10 giorni o 2 giorni lavorativi) | Modello dati EN 16931 fin dal MVP | M | [KPMG](https://kpmg.com/av/fr/avocats/eclairages/2025/04/vida-publication-de-la-directive-et-des-reglements.html); [eConnect](https://econnect.eu/en/docs/knowledge/regulations/europe/vida/timeline); [MDDP](https://www.mddp.pl/vida-package-published-should-we-be-afraid-of-the-eu-schema/) |
| N24 | Sanzioni per violazioni dal 01/09/2024: 70% dell'imposta con minimo **300 € o 500 € (fonti in conflitto)**. Da 250 a 2.000 € se non incide sulla liquidazione. 5% per operazioni non imponibili o esenti. Tabelle di ravvedimento discordanti | Prevenzione con avvisi; nessun calcolatore senza tabelle validate | B | [Orefattura](https://www.orefattura.it/fattura-elettronica/invio-tardivo-fattura-elettronica); [Fiscomania](https://fiscomania.com/tardiva-emissione-della-fattura-elettronica-sanzioni/); [Cosmocode](https://www.cosmocode.it/blog/sanzioni-invio-tardivo-fattura-elettronica-guida-completa-2026/) |
| N25 | Contante: pagamento vietato da 5.000 € in su (dal 01/01/2023) [N]. Dal 2025 trasferte e rappresentanza sono deducibili solo se pagate in modo tracciabile [N] | Controlli sul mezzo di pagamento (C2) | M | [Normattiva D.Lgs. 231/2007](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2007-11-21;231) |
| N26 | Bonus casa ed ecobonus **2026: 50%** abitazione principale / **36%** altri immobili; **2027: 36% / 30%**. Sconto in fattura e cessione del credito non praticabili per i nuovi interventi [N] | Promemoria al cliente, feature flag "legacy" per lo sconto | M | [Ediltecnico](https://ediltecnico.it/bonus-edilizi-2026-legge-di-bilancio/) |
| N27 | Conservazione delle scritture per 10 anni dall'ultima registrazione e comunque fino alla definizione degli accertamenti [N] | Nessuna cancellazione prima della scadenza; flag "contenzioso aperto" | M-A | [Normattiva Codice civile](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:regio.decreto:1942-03-16;262) |
| N28 | GDPR: **art. 28** (contratto con intermediario SdI, hosting, Dropbox, assistenza), **art. 30** (registro: la fatturazione non è occasionale), **art. 32** (misure "tenuto conto dello stato dell'arte"), **art. 33** (notifica entro 72 ore). DPIA non obbligatoria (provv. Garante 467/2018). NIS2 non applicabile a una piccola impresa | Sezione 7.7 | M | [GDPR EUR-Lex](https://eur-lex.europa.eu/legal-content/IT/TXT/?uri=CELEX:32016R0679); [Assolombarda DPIA](https://www.assolombarda.it/servizi/privacy/gdpr-valutazione-dimpatto-privacy-dpia-elenco-dei-trattamenti-); [Cybersecurity360](https://www.cybersecurity360.it/legal/nis2-cose-quali-aziende-interessa-obblighi-e-sanzioni/) |
| N29 | Pagamenti: tracciato bonifici **pain.001.001.09 CBI v00.04.01 dal 17/03/2024**. Danea ha adeguato bonifici e SDD a **nuovi tracciati in vigore dal 15/11/2026** (contenuto della modifica non verificato) | Generatore di distinte aggiornabile (C8) | M / B | [EOS Solutions](https://docs.eos-solutions.it/it/docs/apps-func/bank-files-for-italy-cbi/fiscal-update-bnk.html); [readme Easyfatt](https://www.danea.it/assistenza/readme.asp?codart=ef09) |
| N30 | PA: codice ufficio IPA a 6 caratteri, CIG/CUP in DatiOrdineAcquisto/DatiContratto. Dal 27/01/2026 c'è un servizio per integrare il CUP su fatture già trasmesse (attribuzione incerta) | Solo se Energenia fattura alla PA | M / B | [Commercialista Telematico](https://www.commercialistatelematico.com/articoli/2026/03/fattura-elettronica-verso-la-pa.html) |

### 5.2 Due contraddizioni tra le note, risolte

**Split payment.** La nota sulla normativa SdI afferma due cose: l'autorizzazione UE (Decisione 2023/1552) valeva **fino al 30/06/2026**, e l'approvazione del Consiglio sulla proposta COM(2026) 281 del 17/06/2026, che estende al 30/06/2029, **non era verificata**. La ricerca si era fermata per esaurimento del budget ([Assolombarda](https://www.assolombarda.it/servizi/fisco/informazioni/split-payment-2013-proposta-di-proroga-al-30-giugno-2026-con-esclusione-delle-societa-quotate-dal-1deg-luglio-2025)). La nota sulla normativa IVA ha trovato evidenze successive:
- la **Decisione di esecuzione (UE) 2026/1728 del Consiglio**, adottata il 10/07/2026 e pubblicata in GUUE il 15/07/2026, con effetto dal **01/07/2026 al 30/06/2029** senza interruzioni;
- il **comunicato MEF n. 77 del 30/06/2026**, che aveva già consentito di proseguire.

Quattro fonti secondarie concordano: [Namirial](https://focus.namirial.com/it/split-payment-proroga-2029-cosa-cambia-per-imprese-pa/), [MySolution](https://www.mysolution.it/fisco/approfondimenti/commenti/2026/07/split-payment-confermato-fino-al-30-giugno-2029-proroga-ue-e-quadro-operativo-della-disciplina-setti/), [FiscoeTasse](https://www.fiscoetasse.com/new-rassegna-stampa/4127-split-payment-prorogato-al-30-giugno-2029.html), [Orizzonte Scuola](https://www.orizzontescuola.it/split-payment-prorogato-fino-al-30-giugno-2029-confermata-la-procedura-per-le-scuole/). In più c'è [MySolution sul comunicato MEF](https://www.mysolution.it/fisco/informazioni/news/2026/07/01/split-payment-dopo-il-30-06.-indicazioni-del-mef).

Le due note quindi **non si contraddicono sui fatti**: una si ferma alla proposta, l'altra registra l'adozione. **Conclusione: split payment in vigore fino al 30/06/2029, confidenza medio-alta.** Le fonti concordanti sono più d'una, ma il testo su EUR-Lex non è stato letto e il numero dell'atto compare anche nella variante "172872026". La Commissione la presenta come **ultima deroga** ([Studio Pizzano](https://www.studiopizzano.it/split-payment-proroga-2029-ultimo-rinnovo-e-nodo-rimborsi-iva/)). Il software deve tenere la data di fine come parametro e avvisare nel 2029.

**Testo unico IVA.** La nota sulla normativa SdI documenta con cinque fonti concordanti il **D.Lgs. 19/01/2026 n. 10**: pubblicato in GU il 30/01/2026, efficace dal 01/01/2027, di natura compilativa. La nota sulla normativa IVA dichiara di non averlo potuto verificare. Anche qui non c'è conflitto, solo una ricerca non eseguita. **Conclusione: esistenza e decorrenza ad alta confidenza.** Resta **non verificata la tavola di corrispondenza** tra i vecchi riferimenti (art. 17 c.6 lett. a-ter, art. 21, Tab. A n. 127-quinquies) e la nuova numerazione. Le diciture in fattura e i RiferimentoNormativo vanno quindi gestiti come dati con validità, aggiornabili dal 01/01/2027 senza rilasciare nuovo codice.

Le altre discordanze sono minori ma vanno tenute presenti.

| Tema | Versione A | Versione B | Trattamento |
|---|---|---|---|
| Decorrenza ritenuta 11% | Ipotesi del brief: 01/03/2025 | Fonti: **01/03/2024** | Vale il 01/03/2024 (A) |
| Proprietario di Reviso | Brief: Zucchetti | Fonti: **TeamSystem** ("Contabilità in Cloud") | Vale TeamSystem (A) |
| Pubblicazione della 1.9.1 | 31/03/2026 (AdE, stampa) | 15/04/2026 (PwC) | Irrilevante: l'efficacia dal 15/05/2026 è concorde |
| Minimo della sanzione per omessa fattura | 300 € | 500 € | Verificare l'art. 6 D.Lgs. 471/97 su Normattiva |
| Sanzione per omesso versamento del bollo | 25% (dopo D.Lgs. 87/2024) | 30% (fonti 2021-22) | Verificare |
| Termine di conservazione delle fatture 2024 | 31/12/2025 (una guida) | 31/01/2026 [NV] | Verificare l'art. 3 DM 17/06/2014 |
| Durata dell'accordo di conservazione AdE | Triennale con rinnovo | Fino a recesso per le adesioni dal 04/06/2021 | Verificare sull'area riservata |
| Termine TD19 | 15 del mese successivo | 12 giorni | Verificare |
| Windows Server 2025, fine supporto esteso | 14/11/2034 | 10/10/2034 | Verificare sul ciclo di vita Microsoft |
| ESU consumer di Windows 10 fino al 12/10/2027 | Non confermato (nota ERP) | Confermato da tre fonti secondarie (nota architettura) | Media confidenza; comunque non è una base di conformità per un'azienda |
| Easyfatt e TD26 | Readme: TD26 associato alle "parcelle" | Specifiche: TD26 = beni ammortizzabili | Errore di sintesi dell'estratto |
| Codici destinatario Openapi | JKKZDGR | PIC7CPS | Due prodotti diversi: verificare |

### 5.3 Fotovoltaico, impianti e reverse charge: la tabella decisionale

Il motore IVA deve **proporre** il trattamento e chiedere conferma, mai imporlo [I]. Le regole vanno validate per iscritto dal commercialista.

| Caso | Cliente / immobile | Trattamento proposto | Base e confidenza |
|---|---|---|---|
| FV nuovo (moduli, inverter, strutture, posa), anche con accumulo installato insieme | Privato, qualunque immobile | 10% | n. 127-quinquies/sexies/septies; circ. 36/E/2013 [V] (M) |
| FV su edificio di impresa con contratto d'appalto o installazione | Soggetto IVA | **Reverse charge N6.7**; il committente integra al 10% | art. 17 c.6 a-ter; circ. 37/E/2015 [V parziale] (M) |
| FV su edificio di impresa come cessione con posa (prevale la fornitura) | Soggetto IVA | 10% con IVA in fattura | Qualificazione contrattuale [I] (B) |
| FV a terra non funzionale a un edificio, agrivoltaico | Soggetto IVA | 10% con IVA in fattura, niente reverse charge | ECnews, Fiscomania [V] (M) |
| Wallbox installata insieme al FV | Qualunque | 10% | risposta 218/2020 [V] (M) |
| Wallbox autonoma | Qualunque | 22% (10% come manutenzione su abitativo: incerto) | risposta 218/2020 [V] (M/B) |
| Accumulo aggiunto a FV esistente | Abitazione | 10% come manutenzione straordinaria (prassi) | Solo opinioni professionali (B) |
| Solare termico | Qualunque | 10% | Solo il titolo di un articolo Eutekne (B) |
| Pompa di calore, climatizzatore, caldaia in sostituzione | Abitazione (A1-A11, escluso A10) | 10% con regola dei beni significativi | L. 488/1999 art. 7 [N] (M) |
| Pompa di calore, impianto elettrico, domotica | Non abitativo, cliente privato | 22% | [N] (M) |
| Stessi interventi su edificio, cliente soggetto IVA | Soggetto IVA | N6.7 (N6.3 se in subappalto verso impresa edile con ATECO F) | [N]/[V] (M) |
| Impianti in nuova costruzione "prima casa" in appalto | Privato | 4% con dichiarazione | Tab. A parte II n. 39 [N] (M) |

Fonti principali: [ANCE Mantova](https://mantova.ance.it/2014/01/31/impianti-fotovoltaici-chiarimenti-dell-agenzia-delle-entrate-c-m-36-e-2013/?print=pdf); [Fiscomania agrivoltaico](https://fiscomania.com/impianti-agrivoltaici-esclusi-reverse-charge/); [QualEnergia](https://www.qualenergia.it/pro/articoli-pro/aliquota-iva-al-10-per-le-colonnine-di-ricarica-ma-solo-se-installate-insieme-a-un-impianto-fotovoltaico/); [AdE risposta 8/2018](https://www.agenziaentrate.gov.it/portale/documents/20143/307350/Interpello+8+2018_Risposta+n.+8.pdf/bb6dad88-cdaa-e4f8-2974-c9c05728dfeb); [Eutekne solare termico](https://www.eutekne.info/Sezioni/Art_800757_impianto_termico_a_energia_solare_con_iva_del_10.aspx); [L. 488/1999](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:1999-12-23;488).

**Algoritmo dei beni significativi** [I]. Siano T l'imponibile complessivo dell'intervento e S il valore dei beni significativi.
- Se S ≤ T/2, tutto va al 10%.
- Altrimenti la base al 22% è 2S − T e la base al 10% è T − (2S − T).

Esempio: T = 10.000 €, S = 6.000 € (pompa di calore). Base al 22% = 2 × 6.000 − 10.000 = **2.000 €**; base al 10% = 10.000 − 2.000 = **8.000 €**. La fattura deve indicare il servizio e, separatamente, i beni significativi (L. 205/2017 c.19 [N]).

### 5.4 Ritenuta dell'11% sui bonifici parlanti: come registrarla

La ritenuta la opera la banca all'accredito. **Il software non deve ricalcolarla in teoria: deve leggere il netto dall'estratto conto e imputare la differenza** [I].

Esempio: fattura FV di 10.000 € + IVA 10% = 11.000 €, pagata dal cliente con bonifico parlante.

| Ipotesi di scorporo applicata dalla banca | Base imponibile | Ritenuta 11% | Netto accreditato |
|---|---|---|---|
| Al 22% (aliquota più alta, la banca non conosce quella effettiva) | 11.000 / 1,22 = 9.016,39 € | 991,80 € | 10.008,20 € |
| Aliquota effettiva 10% | 10.000,00 € | 1.100,00 € | 9.900,00 € |

La scrittura è sempre la stessa: **Banca c/c (D) per il netto accreditato + Erario c/ritenute subite (D) per la differenza, contro Crediti v/clienti (A) per 11.000 €** ([ECnews rilevazione ritenute](https://www.ecnews.it/fiscale/societa-e-bilancio/contabilita/rilevazione-delle-ritenute-sui-bonifici-ristrutturazioni-edilizie/); [FiscoeTasse base al netto IVA](https://www.fiscoetasse.com/rassegna-stampa/13513-per-il-36-e-55-ritenuta-al-netto-iva.html)).

Con acconti multipli si calcola una ritenuta per ogni bonifico. A fine anno il saldo si scomputa dall'IRES nella dichiarazione. Quale scorporo applichi davvero la banca di Energenia va verificato **su una contabile reale** (confidenza B). Verso lo studio questi movimenti sono proprio uno dei dati che il cassetto fiscale **non** contiene, e vanno esportati (sezione 6.5).

### 5.5 Calendario delle scadenze che vincolano il progetto

| Data | Evento | Impatto sul progetto |
|---|---|---|
| 13/10/2026 | Fine del supporto mainstream di Windows Server 2022; fine supporto di Windows 10 Enterprise LTSB 2016 | Verifica dell'infrastruttura |
| 10/11/2026 | Fine supporto di .NET 8 LTS e .NET 9 STS | Usare .NET 10 LTS |
| 12/11/2026 | Fine supporto di PostgreSQL 14 | Usare PostgreSQL 17 o 18 |
| 15/11/2026 | Nuovi tracciati per bonifici e SDD (readme Danea) | Distinte di pagamento (C8) |
| 30/11/2026 | Bollo del III trimestre 2026 e LIPE del III trimestre | Bollo virtuale (A6) |
| 01/01/2027 | **Testo unico IVA efficace** | Diciture e riferimenti in tabella |
| 12/01/2027 | Fine supporto esteso di Windows Server 2016 | Migrare o ESU tramite Azure Arc |
| 31/01/2027 | Termine di conservazione delle fatture 2025 [NV] | Adesione al servizio AdE |
| 01/03/2027 | Bollo del IV trimestre 2026 | |
| 12/10/2027 | Fine ESU consumer di Windows 10 | PC client |
| Ottobre 2028 | Fine ESU commerciale di Windows 10 (terzo anno) | PC client |
| 14/11/2028 | Fine supporto di .NET 10 LTS | Migrare al successivo LTS |
| 2028 / 2029 | Ritenuta tra imprese allo 0,5% / 1% | D7 |
| 30/06/2029 | Fine dello split payment (Decisione 2026/1728) | A1 |
| 01/07/2030 | ViDA: e-fattura EN 16931 e DRR per il B2B intra-UE | D8 |
| Novembre 2030 | Fine supporto di PostgreSQL 18 | |
| 01/01/2035 | Allineamento dello SdI a ViDA | |

---

## 6. Integrazioni: un intermediario API da circa 100 € l'anno batte SDICoop, e lo studio usa già il cassetto

### 6.1 Canale verso lo SdI

I canali diretti sono quattro: PEC, SDICoop (web service SOAP), SDIFTP e il portale o l'app dell'AdE.

**SDICoop e SDIFTP** sono dichiaratamente rivolti a operatori con **"alto grado di maturità informatica e alto volume di file"** ([fatturapa.gov.it](https://www.fatturapa.gov.it/it/SistemaAccreditamento/cose-il-sistema-di-accreditamento/)). Richiedono:
- due CSR con chiavi RSA distinte;
- la richiesta firmata in CAdES-BES;
- endpoint SOAP esposti su Internet con TLS reciproco;
- test di interoperabilità.

Sul forum di settore i problemi con le catene di certificati sono ricorrenti ([Medium, accreditamento SDICoop](https://massimomorchio.medium.com/fattura-elettronica-accreditamento-canale-sdicoop-ef6afb65cacb)). Per una sola Srl è un onere sproporzionato. Esporre endpoint pubblici contraddice inoltre l'architettura "nessuna porta aperta" (sezione 7).

**La PEC non richiede accreditamento** e ha un messaggio massimo di 30 MB ([NT+ Fisco](https://ntplusfisco.ilsole24ore.com/art/gestione-fattura-elettronica-piu-canali-AEeFY5nE)). Automatizzarla però costa: bisogna interpretare le buste PEC e i p7m, l'indirizzo di risposta dello SdI cambia dopo il primo invio, e la lettura via IMAP non è reattiva.

| Provider | Prezzo pubblico (IVA esclusa) | Punti chiave | Conf. |
|---|---|---|---|
| **Invoicetronic** | Per transazione (invio, ricezione o validazione): 0,10 € a 1.000; 0,055 € a 5.000; 0,040 € a 20.000. Gli scaglioni **non scadono**. Firma .p7m a 0,02 € | REST, sandbox gratuita, webhook, registro eventi e stato gratuiti, cifratura a riposo. Codice destinatario **7HD37X0**. Prerequisito poco chiaro: "attivazione della conservazione a norma". DPA e hosting non trovati | M |
| **Openapi** | Senza canone. Cifre incoerenti: da 0,015 €, da 0,025 € oppure **0,07 €** per invio; **0,105 €** con conservazione | Ricezione quasi gratuita entro le soglie giornaliere (da verificare). Codice JKKZDGR o PIC7CPS | B |
| **fatturaelettronica-api.it** | 0,09 € per fattura inviata o ricevuta | Tutto incluso, senza canone | B |
| **fattura-elettronica-api.it** | Da 10 €/mese per 50 fatture fino a 850 €/mese per 50.000. Le ricevute contano | REST 2.0, XML o JSON | M |
| **A-Cube** | Nessun listino pubblico, quotazione | SdI, Peppol, open banking, **download dal cassetto** | M |
| **InfoCert Legalinvoice** | Business 86 € (400 fatture), +9,76 € ogni 50 | API o FTP per le grandi aziende: inclusione nel piano da verificare | M |
| **Aruba Premium** | Circa 600-900 €/anno (dati 2019-2023) | Le API richiedono il pacchetto Premium | B |
| **Fatture in Cloud** | Piano a pagamento obbligatorio | **Non accetta XML esterni**: il documento va creato dentro FIC | A |

Fonti: [Invoicetronic pricing](https://invoicetronic.com/en/pricing/); [Invoicetronic prerequisiti](https://invoicetronic.com/en/docs/prerequisites/); [Openapi](https://openapi.com/products/italian-electronic-invoicing); [Openapi console pricing](https://console.openapi.com/apis/sdi/pricing); [fatturaelettronica-api.it](https://www.fatturaelettronica-api.it/); [fattura-elettronica-api.it](https://www.fattura-elettronica-api.it/piani-e-prezzi/); [A-Cube su e-invoice.app](https://www.e-invoice.app/vendors/a-cube-api); [Legalinvoice Business](https://www.infocert.it/fatturazione/legalinvoice-business); [Aruba API](https://fatturazioneelettronica.aruba.it/apidoc/docs_EN.html); [FIC guida e-invoice](https://developers.fattureincloud.it/docs/guides/e-invoice-management/).

**Raccomandazione.** Usare un intermediario API a consumo, al 10/10/2026 **Invoicetronic**: prezzo pubblico chiaro, sandbox, firma per la PA a 0,02 €. Va inserito dietro un'interfaccia `SdiChannel` (invia, stato, ricevi) che permetta di passare a Openapi, a un altro provider o alla PEC senza riscrivere il dominio applicativo.

Tre avvertenze oneste:
1. **Il provider vede tutte le fatture attive e passive.** Il DPA ex art. 28 e l'ubicazione dei datacenter **non sono stati trovati per nessuno dei provider API** e vanno chiesti prima del contratto.
2. **Registrare il codice destinatario dell'intermediario convoglia tutte le passive** verso quel fornitore. Lo SdI considera sempre prevalente l'indirizzo registrato ([CDA Studio](https://www.cdastudio.it/news/news-fiscalita/241-fattura-elettronica-e-codice-destinatario)). Al 10/10/2026 quel ruolo lo ha presumibilmente M5UXCR1 (TS Digital, per Easyfatt). Il cambio di registrazione è quindi l'atto che **spegne la ricezione in Easyfatt**, e va fissato all'inizio di un periodo di liquidazione [I].
3. **Con il server dietro VPN e senza porte aperte, i webhook in ingresso non arrivano.** Conviene interrogare periodicamente il provider in uscita (stato e registro eventi) [I].

Lo storico già conservato tramite TS Digital resta disponibile per 10 anni anche se si smette di pagare Easyfatt, secondo Danea ([Danea fattura elettronica](https://www.danea.it/software/easyfatt/fattura-elettronica/)).

### 6.2 Cassetto fiscale: lo usa già lo studio, il software lo usa per quadrare

L'AdE **non offre API ufficiali** per scaricare le fatture. L'unica via automatizzata e documentata è la **Delega Unica** a un soggetto abilitato, operativa dall'08/12/2025 (provv. n. 321918 del 07/08/2025) ([FiscoeTasse](https://www.fiscoetasse.com/new-rassegna-stampa/2660-delega-unica-agli-intermediari-nuove-modalita-dall8-dicembre-2025.html); [PwC](https://blog.pwc.it/delega-unica-dal-8-dicembre-2025-nuove-regole-per-la-gestione-delle-deleghe-agli-intermediari/)). Le fonti riportano un **massimo di due intermediari** delegati per contribuente. A-Cube offre lo scarico giornaliero con delega, a prezzo su richiesta ([A-Cube guida tecnica](https://www.acubeapi.com/blog/scarico-massivo-dal-cassetto-fiscale-tramite-api-guida-tecnica)).

Il fatto **confermato dall'utente il 10/10/2026** cambia le priorità. Lo studio scarica già attive e passive dal portale con la propria delega, e GB fa la stessa cosa con "Verifica fatture" e il download massivo ([softwaregb.it download massivo](https://www.softwaregb.it/download-massivo-fatture-elettroniche-da-fatture-e-corrispettivi-n-2/)). La completezza delle fatture **a livello contabile** è quindi già garantita dallo studio.

Il software di Energenia ha bisogno del cassetto solo per la **quadratura gestionale**, cioè per accorgersi di fatture recapitate altrove o con codice errato.
- **Nel MVP**: import manuale mensile di uno ZIP scaricato dal portale.
- **In fase 2**: automazione tramite provider con delega, solo dopo aver verificato quante deleghe sono già occupate (lo studio ne usa almeno una).

### 6.3 Conservazione a norma

Il servizio **gratuito dell'AdE** conserva **per 15 anni** le fatture transitate dallo SdI, sia attive sia passive, anche dopo il recesso, e ammette **adesione retroattiva** ([FAQ AdE 2021](https://www.agenziaentrate.gov.it/portale/documents/20143/287582/14+Tutte+le+faq+(aggiornate+al+28+aprile+2021)+.pdf/948335b1-0f5f-eab4-a3d7-9c0525395af1?version=1.0); [Studio Zanovello](https://www.studioassociatozanovello.it/notizie/rinnovo-delle-adesioni-alla-conservazione-delle-fatture-dellagenzia-delle-entrate/)). Ha però limiti precisi:
- **non ha API**: il recupero è manuale ([FatturaPro.click](https://fatturapro.click/conservazione-automatica-fatture-elettroniche-rischi-e-soluzioni/));
- **copre solo i file SdI**: restano fuori libro giornale, registri IVA, contratti e documenti non SdI.

L'archivio applicativo del software (XML, notifiche, hash SHA-256, metadati) è **utile per l'operatività ma non è conservazione a norma**. Fare conservazione "in proprio" significherebbe:
- manuale di conservazione e responsabile;
- pacchetti di versamento, archiviazione e distribuzione con indice UNI SInCRO;
- firma e marca temporale.

È un onere sproporzionato ([AgID Allegato A](https://www.agid.gov.it/sites/default/files/repository_files/allegato_a_.pdf)). Se i registri ufficiali li tiene lo studio in GB, la loro conservazione segue i processi dello studio [I]. Va chiesto (sezione 11).

### 6.4 Banche: i file prima dell'open banking

Il mercato dell'open banking per una PMI che legge **i propri** conti è peggiorato nel 2025:
- **GoCardless Bank Account Data (ex Nordigen) non accetta nuove registrazioni** da metà 2025 ([Actual Budget](https://actualbudget.org/docs/advanced/bank-sync/gocardless/));
- il piano gratuito di **Enable Banking esclude espressamente l'uso business** ([Enable Banking ToS](https://enablebanking.com/terms/));
- Tink, Salt Edge, Yapily e TrueLayer trattano solo con il commerciale. Per Tink fonti terze parlano di 0,50 €/utente/mese ([Finexer](https://blog.finexer.com/tink-pricing/));
- **Fabrick** (Gruppo Sella) mette la propria licenza AISP a disposizione anche di aziende non finanziarie, a prezzo su richiesta ([Fabrick AISP](https://www.fabrick.com/it-it/prodotti/aisp/));
- **CBI Globe** è un gateway lato banche e terze parti, non un servizio per l'utente finale ([CBI Globe](https://www.cbi-org.eu/CBI-Globe-en)).

Il consenso va rinnovato con autenticazione forte (SCA) **ogni 180 giorni** ([EBA](https://www.eba.europa.eu/publications-and-media/press-releases/eba-publishes-final-report-amendment-its-technical-standards)). Un'azienda che accede ai propri conti tramite un AISP autorizzato non ha bisogno di licenza: il vincolo è solo contrattuale [I].

La strada più robusta e riservata per il MVP sono i **file**:
- **CBI RH** dall'home banking ([EduPass](https://www.edupass.it/Resources/Edupass-Manuali/Manuali/pdf/pillole/Riconciliazione%20bancaria.pdf));
- **camt.053** in profilo CBI, che contiene solo movimenti contabilizzati ([CBI RND](https://babons.it/wp-content/uploads/CBI-RND.pdf));
- CSV come ultima risorsa.

Per i pagamenti il software genera **pain.001.001.09 CBI v00.04.01**, da caricare nel corporate banking ([EOS Solutions](https://docs.eos-solutions.it/it/docs/apps-func/bank-files-for-italy-cbi/fiscal-update-bnk.html)). Per il tracciato RiBa non sono state trovate fonti. La copertura PSD2 delle banche di Energenia (Banca Popolare di Puglia e Basilicata, BCC?) non è verificata.

### 6.5 GB Software: lo studio legge il cassetto, il software esporta solo ciò che il cassetto non contiene

Il quadro è più semplice di quanto le note ipotizzassero. **Lo studio scarica fatture attive e passive direttamente dall'AdE e le importa in GB (confermato dall'utente il 10/10/2026).** GB è progettato per questo flusso:
- importa XML FatturaPA "indipendentemente che siano fatture di acquisto o di vendita", anche prodotti con altri gestionali;
- assegna la **causale contabile in base ai sezionali** configurati e le **causali IVA in base all'anagrafica** di cliente o fornitore;
- blocca le importazioni duplicate ([guidegbsoftware import FE](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/); [softwaregb.it Import Fatture e Corrispettivi](https://www.softwaregb.it/software-contabilita-commercialisti/software-import-fatture-corrispettivi-studi/)).

Ne seguono tre conseguenze progettuali.

**Primo: il software non invia fatture allo studio.** Non con il File Xml GB, non con ZIP periodici come canale ordinario. La nota su GB aveva già segnalato che cassetto e File Xml GB insieme espongono lo studio alla **doppia registrazione** ([softwaregb.it File Xml GB](https://www.softwaregb.it/importazione-nota-file-xml-rilascio-utility-archivio/)). Lo ZIP degli XML resta solo come riserva per lo storico (fino a 500 file per lotto nella Console, [softwaregb.it Console](https://www.softwaregb.it/software-fatturazione-elettronica-commercialisti/console-fatturazione/)).

**Secondo: verso lo studio il compito principale è la qualità dell'XML.** Significa:
- **sezionali concordati**, perché la causale automatica ne dipende;
- **Natura corrette** (N6.7 per il reverse charge sulle installazioni, N6.3, N2/N3/N4);
- blocco **DatiPagamento** completo (modalità, IBAN, scadenze);
- P.IVA/CF sempre presenti: GB scarta i file con dati obbligatori mancanti, come il CF del cessionario ([softwaregb.it caso pratico](https://www.softwaregb.it/caso-pratico-registrazione-fatture-elettroniche-prodotte-con-altri-software-archivio/)).

Per le passive la qualità dipende dal fornitore. Lì contano le causali e i conti predefiniti che lo studio imposta in GB per ciascun fornitore.

**Terzo: il software esporta ciò che il cassetto non contiene.** Cioè:
- incassi e pagamenti con riferimento alla fattura;
- movimenti bancari;
- movimenti non IVA: F24, **ritenute subite dell'11% sui bonifici parlanti**, giroconti, spese bancarie.

Le opzioni sono due, da confermare con lo studio:
- **File Xml GB** (Prima Nota > Importa registrazioni), che gestisce anagrafiche, prime note di vendite, acquisti e non IVA e "relativi pagamenti". Le specifiche (istruzioni, linee guida, esempio XML) sono **in uno .zip dentro la procedura e non sono pubbliche**. Resta **non verificato** se si possa usare per i soli pagamenti e movimenti non IVA, senza le fatture.
- **Estratto conto** importato con Riconcilia GB, che legge xls, xlsx, csv e txt con modelli per banca e regole sul testo della descrizione. Non c'è evidenza di supporto nativo CBI o camt né di chiusura automatica delle partite aperte ([guidegbsoftware estratto conto](https://guidegbsoftware.it/contabilita/prima-nota/importazione-estratto-conto/); [softwaregb.it Riconcilia GB Studio](https://www.softwaregb.it/software-contabilita-commercialisti/software-import-estratto-conto-studi/)). Riconcilia GB Studio costa **110 € + IVA l'anno** allo studio.

Va chiarito un punto. GB ha un'utility che **legge direttamente l'archivio `.eft` di Easyfatt** e ne importa anagrafiche, prime note e **pagamenti** ([guidegbsoftware importazione Danea](https://guidegbsoftware.it/contabilita/prima-nota/importazione-danea-easyfatt/)). Se attualmente lo studio prende i pagamenti di Energenia da lì, **quel canale sparisce** con il passaggio al nuovo software e va sostituito. È la prima domanda da fare al commercialista. **Da evitare**: generare tracciati TeamSystem (TRAF2000/GeCom) o finti `.eft` senza conferma esplicita dello studio. Nessuna fonte prova che GB li usi per i movimenti di un cliente esterno.

### 6.6 Assetto raccomandato

| Componente | Scelta MVP | Alternativa "massima riservatezza" | Costo (dalle note) |
|---|---|---|---|
| Invio e ricezione SdI | Intermediario API (Invoicetronic) dietro `SdiChannel`, interrogato periodicamente in uscita | PEC aziendale registrata come indirizzo telematico e usata come canale verso lo SdI | 50-165 €/anno (sezione 9) contro canone PEC (n.t.) più sviluppo del modulo PEC |
| Firma per la PA | Firma tramite intermediario (0,02 €/fattura) | Dispositivo del legale rappresentante; firma remota 40 € + IVA per 3 anni | Trascurabile |
| Conservazione | Servizio AdE gratuito con adesione retroattiva, più archivio applicativo con hash | Uguale | 0 € |
| Quadratura con il cassetto | Import ZIP manuale mensile | Uguale | 0 € |
| Banca | File CBI RH / camt.053 / CSV; distinte pain.001 | Uguale | 0 € (inclusione nel canone del corporate banking non verificata) |
| Fatture verso lo studio | **Cassetto fiscale, già in uso dallo studio (confermato dall'utente il 10/10/2026)**; nessun invio dal software | Uguale | 0 € |
| Pagamenti e movimenti non IVA verso lo studio | File Xml GB solo per pagamenti e non IVA (se ammesso), altrimenti CSV normalizzato o estratto conto originale per Riconcilia GB | Uguale | Riconcilia GB Studio 110 €/anno lato studio, se non già attivo |

---

## 7. Architettura: web app sul server aziendale, PostgreSQL, VPN; Dropbox solo per backup cifrati

### 7.1 Windows 10 e Windows Server: i fatti di piattaforma

| Componente | Stato al 10/10/2026 | Conf. | Fonte |
|---|---|---|---|
| Windows 10 | **Fuori supporto dal 14/10/2025** | A | [Petri](https://petri.com/windows-10-extended-security-updates-price/) |
| ESU commerciale per Windows 10 | **61 $/dispositivo il 1° anno, 122 $ il 2°, 244 $ il 3°**. È cumulativo (circa 427 $ in tre anni) e arriva fino a ottobre 2028. 45 $ il 1° anno con Intune/Autopatch | M | [Petri](https://petri.com/windows-10-extended-security-updates-price/); [Windows Central](https://www.windowscentral.com/microsoft/windows-11/microsoft-preps-esu-for-windows-10-ltsb-releases-retiring-in-2026) |
| ESU consumer per Windows 10 | Esteso fino al **12/10/2027** (documentazione aggiornata il 25/06/2026), gratuito nel SEE con account Microsoft. È pensato per dispositivi personali: **area grigia per uso aziendale** | M | [Help Net Security](https://www.helpnetsecurity.com/2026/06/26/microsoft-windows-10-free-security-updates-esu-program/); [Licensing School](https://www.licensingschool.co.uk/licensing-blog/2026/07/08/windows-10-esus-for-consumers/) |
| Windows Server 2016 | Supporto esteso fino al **12/01/2027**. ESU tramite Azure Arc annunciato a febbraio 2026 | M | [endoflife.ai](https://endoflife.ai/article-windows-server-2016-eol); [Flamingo](https://www.flamingo.run/blog/windows-server-2016-end-of-life) |
| Windows Server 2019 | Supporto esteso fino al 09/01/2029 | M | [endoflife.ai](https://endoflife.ai/article-windows-server-2019-eol) |
| Windows Server 2022 | Mainstream fino al 13/10/2026, esteso fino al 14/10/2031 | M | [endoflife.ai](https://endoflife.ai/article-windows-server-2022-eol) |
| Windows Server 2025 | Supporto esteso fino al 14/11/2034 oppure 10/10/2034 (in conflitto) | B | [endoflife.ai](https://endoflife.ai/article-windows-server-eol); [TrustedTech](https://trustedtechteam.com/blogs/windows-server/compare-windows-server-2019-2022-2025) |
| SQL Server 2025 | Richiede Windows 10 o superiore, solo x64 | A | [Microsoft Learn](https://learn.microsoft.com/it-it/sql/sql-server/install/hardware-and-software-requirements-for-installing-sql-server-2025?view=sql-server-ver17) |

La richiesta di una "piattaforma Windows 10" va letta così. **Il server non deve essere Windows 10.** I PC client possono usare un browser su Windows 10 solo con ESU commerciale attivo, oppure vanno portati a Windows 11. Un PC Windows 10 senza patch che tratta codici fiscali, IBAN e indirizzi di clienti privati è difficilmente difendibile come misura "adeguata allo stato dell'arte" ai sensi dell'art. 32 GDPR [I].

L'architettura web riduce la dipendenza dal sistema operativo del client, ma non la annulla: furto di credenziali e keylogger restano possibili. **Prima di ogni altra decisione** va verificata la versione del Windows Server in ufficio (edizione e build). Se è la 2016, la migrazione o l'ESU vanno pianificati **entro il 12/01/2027**.

### 7.2 Sei modelli di distribuzione a confronto

| Modello | Riservatezza | Disponibilità | Manutenzione | Costo | Verdetto |
|---|---|---|---|---|---|
| (a) Desktop con database locale su ogni PC | Dati sparsi su N PC | Nessuna condivisione; numerazione non condivisibile | Alta | Basso | Escluso |
| (b) Desktop con database embedded (SQLite, Access, Firebird) su cartella di rete SMB | Dati centralizzati | **Rischio di corruzione**; WAL non funziona in rete | Media, ma gli incidenti sono gravi | Basso | **Escluso** |
| (c) Client desktop con DBMS sul server (PostgreSQL / SQL Server Express) | Buona | Buona in LAN, VPN da remoto | Media: installer e aggiornamenti dello schema coordinati sui client | Basso | Valido |
| (d) **Web app sul server aziendale con VPN** | **Ottima**: dati in casa, nessun dato sui client | Buona; dipende da server, UPS e linea | Un solo punto da aggiornare | Basso | **Raccomandato** |
| (e) VPS o cloud UE (Aruba, Hetzner, OVH, Azure Italy North) | Buona con DPA art. 28 e cifratura | Alta | Media-alta (IaaS) | 10-60 €/mese indicativi (non verificati) | Alternativa se manca chi gestisce il server |
| (f) File di database sincronizzato con Dropbox | Dati presso un terzo, in chiaro | **Inaffidabile**: conflitti e copie "conflicted" | Corruzione silenziosa | Basso | **Escluso** |

Fonti: [sqlite.org useovernet](https://sqlite.org/useovernet.html); [sqlite.org WAL](https://sqlite.org/wal.html); [Dropbox Forum](https://www.dropboxforum.com/discussions/101001014/sharing-in-quickbooks/768742); [Azure Italy North](https://azure.microsoft.com/nb-no/updates/general-availability-microsoft-azure-now-available-from-new-cloud-region-in-italy/). Danea stessa definisce l'archivio in una cartella sincronizzata in cloud "**Da non fare!**" ([help Danea](https://help.danea.it/easyfatt/html/Archivi_Copie_di_sicurezza.htm)). Una pagina ufficiale del Dropbox Help Center sul tema non è stata trovata.

### 7.3 Database

| Database | Pro | Contro | Verdetto |
|---|---|---|---|
| **PostgreSQL 18** | `numeric` esatto, ruoli, row-level security, trigger per l'audit. **Supporto fino a novembre 2030** | **pgBackRest non gira nativamente su Windows**: si usano pg_dump e l'archiviazione del WAL | **Raccomandato** |
| SQL Server Express 2025 | Ecosistema .NET/Windows. Limite del database portato a **50 GB** | Massimo 1 socket o 4 core, circa 1,4 GB di buffer | Alternativa valida: i volumi di una PMI sono MB |
| SQLite (+ SQLCipher) | Cifratura AES-256 (SQLCipher, BSD-3) | Nessun decimale nativo; WAL solo sullo stesso host | Solo all'interno del processo, sullo stesso server |
| Firebird / Access | Firebird è il formato di Easyfatt (utile per la migrazione) | Ecosistema ridotto; Access senza audit | Sconsigliati |

Fonti: [HeroDevs PostgreSQL EOL](https://www.herodevs.com/blog-posts/postgresql-eol-dates-every-versions-release-end-of-life-timeline); [PGConf.DE 2025](https://www.postgresql.eu/events/pgconfde2025/sessions/session/6563/slides/655/Andras_in_Windowsland.pdf); [DatabaseMart SQL Express](https://www.databasemart.com/blog/sql-server-express-2019-2022-2025); [SQLCipher](https://github.com/sqlcipher/sqlcipher).

La numerazione delle fatture senza buchi né duplicati richiede un vincolo `UNIQUE(anno, sezionale, numero)` e un lock transazionale sul contatore. **Su un database a file condiviso in rete non si può garantire** [I].

### 7.4 Stack applicativo

Per uno sviluppatore singolo, anche assistito da AI, lo stack più manutenibile è un **monolite web** [I].

**Opzione raccomandata: .NET 10 LTS** (supporto fino al 14/11/2028) con ASP.NET Core (Razor Pages, MVC o Blazor Server), EF Core e PostgreSQL. I motivi:
- è nativo su Windows Server/IIS;
- ha il tipo `decimal`;
- c'è la libreria **FatturaElettronica.NET** (C#, aggiornata il 06/07/2026, validazione offline), dello stesso autore di Invoicetronic. Il README cita però le specifiche 1.8 e la licenza risulta "NOASSERTION" su GitHub: **supporto alla 1.9.x e licenza da verificare** ([GitHub](https://github.com/FatturaElettronica/FatturaElettronica.NET)).

Due avvertenze sullo stack:
- **.NET 8 e .NET 9 escono dal supporto il 10/11/2026** e non vanno usati ([.NET support policy](https://dotnet.microsoft.com/en-us/platform/support/policy/dotnet-core)).
- **QuestPDF**, con la Community License v3.0 in vigore dal 06/07/2026, è gratuito solo sotto **1 milione di dollari di fatturato annuo**. Energenia probabilmente lo supera (da confermare), quindi per i PDF conviene un HTML convertito in PDF ([QuestPDF](https://questpdf.com/license/community.html)).

**Alternativa equivalente: Python/Django + PostgreSQL + WeasyPrint** (BSD-3) ([WeasyPrint](https://github.com/Kozea/WeasyPrint)). La libreria Python storica per la FatturaPA, python-a38, è ferma al 10/01/2024 ([GitHub](https://github.com/Truelite/python-a38)): l'XML andrebbe generato e validato in proprio. Su Windows il deploy è meno naturale (meglio una VM Linux o WSL2).

**Da evitare**: client desktop (WPF, WinUI, MAUI, Electron). Aggiungono distribuzione e aggiornamento su ogni PC senza benefici per 2-5 utenti.

### 7.5 Accesso remoto

**Mai esporre su Internet il desktop remoto (porta 3389) o il database.** L'RDP esposto resta un vettore d'ingresso comune negli attacchi alle aziende ([Darktrace](https://darktrace.com/en/blog/remote-desktop-protocol-rdp-attack-analysis); [SC World](https://scworld.com/native/hindsight-2-block-public-facing-remote-desktop-protocol-rdp)).

L'accesso da fuori ufficio passa da **WireGuard** (sul router o firewall, oppure in un container sul server) o da **Tailscale**. Con Tailscale il traffico è cifrato tra i dispositivi e il server di coordinamento vede solo metadati. Per la massima sovranità c'è **Headscale**, server di coordinamento self-hosted, BSD-3, attivo ([Headscale](https://github.com/juanfont/headscale)). In tutti i casi serve la **MFA applicativa**.

**Cloudflare Tunnel** è comodo, ma termina il TLS sul proprio bordo e **vede il traffico HTTP in chiaro**: diventerebbe un responsabile ai sensi dell'art. 28 ([forum Nextcloud](https://help.nextcloud.com/t/is-cloudflare-tunnel-safe-privacy-focused/150268), fonte di comunità). L'RDP verso il server resta solo per l'amministratore e solo da VPN.

### 7.6 Backup e Dropbox

Lo schema consigliato è **3-2-1-1-0** [I]:
- dump notturno di PostgreSQL (`pg_dump -Fc`) più archiviazione del WAL, insieme agli XML e ai PDF;
- copia su NAS o disco locale diverso dal server;
- copia fuori sede **cifrata lato client** con restic, Kopia o Duplicati ([restic](https://github.com/restic/restic); [Kopia](https://github.com/kopia/kopia); [Duplicati](https://github.com/duplicati/duplicati)) verso Dropbox;
- **chiave di cifratura conservata offline**;
- **prova di ripristino trimestrale documentata**.

La cronologia delle versioni Dropbox (Rewind) arriva a 30 giorni con Plus e a 180 con Professional ([Dropbox Rewind](https://experience.dropbox.com/resources/dropbox-rewind)). Secondo lo staff Dropbox sul forum non si può cancellare a mano ([Dropbox Forum](https://dropboxforum.com/discussions/101001013/dropbox-rewind---can-a-malicious-attacker-delete-the-version-history/705879)). Non è però verificato se un amministratore o un attaccante con credenziali di amministratore possa eliminare file e versioni in modo definitivo: Dropbox **non va considerato immutabile**.

Il server **non deve avere la cartella Dropbox montata in chiaro con permessi di scrittura** per l'account di backup. Meglio una destinazione in sola aggiunta.

### 7.7 GDPR e controlli di sicurezza

| Area | Misura minima | Base |
|---|---|---|
| Identità | Account nominali, ruoli, privilegio minimo, **MFA** (obbligatoria da remoto), disattivazione all'uscita del personale | Art. 25, 32 |
| Audit | Tabella in sola aggiunta con `hash = SHA-256(hash_precedente ‖ payload)`. Al ruolo applicativo vanno revocati UPDATE e DELETE. L'ultimo hash si esporta periodicamente | Art. 5.2, 32; art. 2219 c.c. [N] |
| Cifratura | BitLocker su server e PC, TLS anche in LAN. Cifratura per colonna di IBAN e CF solo se il modello di minaccia lo giustifica | Art. 32 |
| Backup | 3-2-1-1-0, prova di ripristino trimestrale | Art. 32.1 lett. c-d |
| Ransomware | Patching mensile, Defender/EDR, nessun RDP esposto, destinazione di backup in sola aggiunta | Art. 32 |
| Conservazione dei dati | 10 anni per fatture e scritture; poi cancellazione o anonimizzazione dei privati senza rapporti attivi | Art. 5.1 lett. e; art. 2220 c.c. |
| Log | Accessi riusciti e falliti, IP, MFA; conservazione per 6-12 mesi (scelta da motivare) | Art. 32 |
| Violazioni dei dati | Procedura scritta, registro delle violazioni, modello di notifica al Garante entro 72 ore | Art. 33-34 |
| Documenti | **Registro dei trattamenti** (art. 30). **Contratti art. 28** con intermediario SdI, eventuale VPS, Dropbox, assistenza IT. Nota di pre-valutazione che spiega perché la DPIA non è obbligatoria | Art. 28, 30, 35; provv. 467/2018 |

Fonti: [GDPR](https://eur-lex.europa.eu/legal-content/IT/TXT/?uri=CELEX:32016R0679); [Assolombarda DPIA](https://www.assolombarda.it/servizi/privacy/gdpr-valutazione-dimpatto-privacy-dpia-elenco-dei-trattamenti-).

**NIS2 non si applica**: Energenia è una piccola impresa e un installatore non è un operatore energetico dell'Allegato I ([Cybersecurity360](https://www.cybersecurity360.it/legal/nis2-cose-quali-aziende-interessa-obblighi-e-sanzioni/)). Clienti soggetti a NIS2 possono però imporre requisiti contrattuali.

**Confronto con lo stato attuale.** Il file `.eft` di Easyfatt si apre con le credenziali Firebird di default (SYSDBA/masterkey), che usa anche il connettore di terzi. La protezione è quindi solo applicativa e il file probabilmente non è cifrato a riposo [I] ([PyPI](https://pypi.org/project/easyfatt-db-connector/)).

### 7.8 Architettura raccomandata

```
 PC/tablet in ufficio (browser) ──HTTPS in LAN──┐
 Remoto (browser) ──WireGuard/Tailscale + MFA───┤
                                                ▼
                          Windows Server aziendale (≥ 2019; se 2016 migrare entro 12/01/2027)
                          ├─ Web app monolitica (.NET 10 LTS, ASP.NET Core) su IIS/Kestrel, TLS
                          ├─ PostgreSQL 18 (BitLocker) — eventualmente in VM Linux Hyper-V
                          ├─ Archivio XML/p7m/notifiche SdI (SHA-256, sola aggiunta)
                          ├─ Job: interrogazione dell'intermediario SdI (solo HTTPS in uscita)
                          └─ Job: pg_dump + WAL → restic/Kopia cifrato → NAS locale + Dropbox (versioning)
 Esterni: intermediario SdI (DPA art. 28) · AdE (conservazione gratuita; cassetto letto dallo studio)
          · banca (file CBI RH/camt.053, distinte pain.001) · studio GB (fatture dal cassetto;
            pagamenti e non IVA via File Xml GB o CSV/estratto conto)
```

Se la gestione del server è un problema, si usa lo stesso disegno su un **VPS in Italia o nell'UE** (es. Azure Italy North), con DPA e backup cifrati anche fuori dal provider.

---

## 8. Costruire o adottare: il perimetro ridotto rende sostenibile il custom, a una condizione

| Criterio | Costruire da zero (snello) | OpenSTAManager (Devcode) | Odoo 18 Community + OCA l10n-italy 18.0 |
|---|---|---|---|
| Copertura del MVP pronta all'uso | Nulla all'inizio | FE, contabilità, documenti di vendita e acquisto, interventi. Prima nota, registri e liquidazione **da provare** | La più ampia: partita doppia, registri IVA, liquidazione e LIPE, RiBa, cespiti, bollo, TD29, dichiarazioni d'intento |
| Specifiche 1.9.1 | Tramite libreria e validazione dell'intermediario | "Adeguamento tracciato SDI 1.9.1" **solo nella 2.11-beta (giugno 2026), non per produzione**. Ultima stabile: 2.10.4 (aprile) | Modulo core `l10n_it_edi` di Odoo SA più estensioni OCA |
| Canale SdI | Qualsiasi provider tramite adattatore | Non documentato nelle note | **Proxy di Odoo SA** (terzo ex art. 28) oppure `l10n_it_edi_pec` (beta) |
| Aderenza all'uso di Easyfatt | Totale | Gestionale generico con magazzino e interventi da nascondere | ERP generico, curva di apprendimento ripida |
| Lacune di mercato (cassetto, approvazioni, commessa, IVA FV, 11%, export GB) | Progettate dentro | Moduli PHP su misura | Moduli Python su misura |
| Installazione su Windows | Nativa (.NET/IIS) | PHP ≥ 8.3 e MariaDB ≥ 10.5: meglio VM o container Linux | Python/PostgreSQL: VM Linux |
| Manutenzione normativa | **Tutta a carico di Energenia** (un solo sviluppatore come punto di rottura) | Comunità piccola (circa 152 stelle, circa 10.950 commit) più le proprie modifiche | Odoo SA più OCA. Ogni anno una nuova versione principale; OCA arriva con 1-2 anni di ritardo (la 19.0 è ancora parziale) |
| Licenza | Proprietaria di Energenia | GPL-3.0 | OCA AGPL-3.0 |
| Riservatezza | Solo l'intermediario scelto | Self-hosted | Con il proxy core, anche Odoo SA vede le fatture |
| Rischio principale | Conformità e continuità nel tempo | Qualità del codice e copertura contabile ignote | Complessità e migrazioni sproporzionate allo scopo |

Fonti: [OpenSTAManager](https://github.com/devcode-it/openstamanager); [release OpenSTAManager](https://github.com/devcode-it/openstamanager/releases); [OCA 18.0](https://github.com/OCA/l10n-italy/tree/18.0); [OCA 19.0](https://github.com/OCA/l10n-italy/tree/19.0); [documentazione Odoo Italia](https://www.odoo.com/documentation/latest/applications/finance/fiscal_localizations/italy.html); [odoo/odoo](https://github.com/odoo/odoo).

Dolibarr ed ERPNext sono esclusi. In Dolibarr la FE italiana passa da un modulo commerciale ferma alle specifiche 1.8.x ([shop.19.coop](https://shop.19.coop/prodotto/fatture-elettroniche-ita-light-plus)). Per ERPNext esistono solo un'app del 2020 e offerte "su ordinazione" ([ERPNext](https://github.com/frappe/erpnext)).

**Raccomandazione motivata.** La nota sull'open source conclude per "adotta e personalizza", ma con una riserva esplicita: costruire da zero ha senso se il perimetro resta piccolo e la contabilità "vera" la tiene il commercialista. Per Energenia valgono **entrambe le condizioni**:
- il perimetro chiesto esclude il magazzino;
- lo studio **già** importa le fatture dal cassetto e tiene i libri in GB (confermato dall'utente il 10/10/2026).

Il software non deve quindi produrre libro giornale né bilancio. Il peso della conformità si riduce a tre cose: **XML corretti, stati SdI, registri gestionali**. In più, quattro delle sei lacune di mercato (approvazioni, commessa, regole IVA del FV, ritenuta 11%) non esistono in nessuna delle opzioni open source e andrebbero sviluppate comunque come moduli su misura dentro un codice altrui.

Odoo porta una contabilità completa che **non serve** e la paga con migrazioni annuali e un terzo (Odoo SA) nel flusso delle fatture. OpenSTAManager è il candidato più vicino al dominio di un installatore (interventi, impianti) e merita una prova seria. A ottobre 2026 ha però l'adeguamento alla 1.9.1 solo in una beta "da non usare in produzione" e una comunità piccola.

La condizione per costruire è **chi mantiene il software**. Con un solo sviluppatore, la documentazione, i test automatici sui calcoli (IVA, arrotondamenti, totali) e la validazione XSD di ogni XML prodotto sono il vero patrimonio. Serve anche un piano B: un export completo di dati e XML leggibile da un altro gestionale.

**Proposta di prova di OpenSTAManager in due settimane** [I]. Installarlo in una VM Linux sul server con dati di prova di Energenia e verificare i punti seguenti:

| # | Criterio di accettazione |
|---|---|
| 1 | Versione **stabile** conforme alla 1.9.1 |
| 2 | Fattura TD01 al 10% FV e TD01 con N6.7 verso impresa; nota di credito TD04 |
| 3 | Import di passive XML/p7m con reverse charge e doppia annotazione |
| 4 | Prima nota cassa/banca e scadenzario con incassi parziali |
| 5 | Registri IVA e liquidazione per sezionale |
| 6 | Import dell'estratto conto e riconciliazione |
| 7 | Ruoli utente, registro di audit, backup |
| 8 | Canale SdI usato e terzi coinvolti |

Se i punti 1-6 sono coperti **senza modificare il codice**, adottarlo e sviluppare come moduli le lacune di mercato. Altrimenti costruire il nucleo snello descritto nelle sezioni 4 e 7. Odoo va rivalutato solo se Energenia decide di internalizzare la contabilità generale.

---

## 9. Costi di esercizio: 50-165 € l'anno di canale SdI, ma il vero costo è lo sviluppo

**Ipotesi.**
- T = transazioni SdI annue (fatture attive inviate più passive ricevute): 500, 1.500 o 3.000.
- Metà attive e metà passive.
- **Validazione eseguita in locale**, quindi senza consumare crediti dell'intermediario. Se si usasse anche la validazione di Invoicetronic, le attive costerebbero il doppio.
- Nessuna fattura alla PA nel caso base.
- Prezzi IVA esclusa, come riportati nelle note.
- Server e Dropbox già esistenti.
- **Esclusi** sviluppo, hardware, energia, personale e assistenza: le note non contengono cifre per stimarli.

**Canale SdI (costo medio annuo a consumo).**

| Opzione | Formula | 500 | 1.500 | 3.000 |
|---|---|---|---|---|
| Invoicetronic, pacchetti da 1.000 (0,10 €) | T × 0,10 | 50 € (esborso 100 € ogni 2 anni) | 150 € | 300 € |
| Invoicetronic, pacchetto da 5.000 (0,055 €) | T × 0,055 | 27,50 € (esborso 275 € ogni 10 anni: sconsigliato) | **82,50 €** (275 € ogni ~3,3 anni) | **165 €** (275 € ogni ~1,7 anni) |
| Openapi, solo attive a 0,07 € | T/2 × 0,07 | 17,50 € | 52,50 € | 105 € |
| Openapi, anche passive a 0,07 € | T × 0,07 | 35 € | 105 € | 210 € |
| fatturaelettronica-api.it | T × 0,09 | 45 € | 135 € | 270 € |
| Legalinvoice Business | 86 + ((T − 400)/50) × 9,76 | 86 + 2 × 9,76 = 105,52 € | 86 + 22 × 9,76 = 300,72 € | 86 + 52 × 9,76 = 593,52 € |
| Aruba Premium (API) | Canone | 600-900 € | 600-900 € | 600-900 € |

**Altre voci.**

| Voce | Costo | Nota |
|---|---|---|
| Conservazione AdE | 0 € | Solo file SdI |
| Quadratura con il cassetto | 0 € (manuale); A-Cube n.d. | Lo studio scarica già dal cassetto |
| File bancari CBI/camt.053 | 0 € (assunto) | Inclusione nel canone del corporate banking non verificata |
| Open banking PSD2 | n.d. | Una fonte del 2021, non autorevole, stima 2-15 €/mese per consenso |
| Firma PA | 0,02 € per fattura via intermediario, oppure 40 €/3 anni ≈ 13,33 €/anno | Solo se ci sono clienti PA |
| Software di base (PostgreSQL, .NET, restic/Kopia/Duplicati, Headscale) | 0 € | Open source o gratuito |
| ESU commerciale Windows 10, per ogni PC non migrato | 61 $ (1° anno), 122 $ (2°), 244 $ (3°) | Esempio: 3 PC = 3 × 61 = 183 $ il primo anno |
| VPS UE (solo con il modello e) | 10-60 €/mese = 120-720 €/anno | Prezzi non verificati |
| Riconcilia GB Studio (lato studio) | 110 €/anno | Se lo studio non lo ha già |

**Totale dell'assetto raccomandato** (Invoicetronic, AdE, file bancari, server già esistente):
- **500 transazioni**: circa **50 €/anno** (pacchetti da 1.000);
- **1.500 transazioni**: circa **82,50 €/anno** (pacchetto da 5.000);
- **3.000 transazioni**: circa **165 €/anno**;
- più l'eventuale firma remota (13,33 €/anno).

**Confronto con Easyfatt (solo licenza).**
- A **500 transazioni** si supera la soglia di Professional (400): serve **Enterprise One a 288-300 €**. Differenza: 288 − 50 = **238 €** fino a 300 − 50 = **250 €** l'anno.
- A **1.500 e 3.000 transazioni** serve **Enterprise a 420-480 €**, l'unica edizione senza soglia e la sola multiutente. Differenza a 1.500: da 420 − 150 = **270 €** (pacchetti da 1.000) a 480 − 82,50 = **397,50 €** (pacchetto da 5.000); 420 − 165 = **255 €** fino a 480 − 165 = **315 €** a 3.000.

Come riferimenti di mercato: Fatture in Cloud Premium costa 252 € e Premium Plus 348 € ([FIC costo](https://www.fattureincloud.it/costo/)); Contabilità GB per aziende va da 329 a 499 € + IVA ([softwaregb.it](https://www.softwaregb.it/software-contabilita-aziende/)).

**Lettura onesta.** Il risparmio di circa **240-400 € l'anno** sulle licenze non basta a finanziare sviluppo e manutenzione normativa. Le note non quantificano né l'uno né l'altra, e Easyfatt include assistenza, aggiornamenti normativi e conservazione tramite TS Digital. **La convenienza va argomentata su altro**:
- controllo e riservatezza dei dati;
- nessuna soglia di volume o di utenti;
- accesso remoto senza i limiti di Easyfatt Cloud;
- funzioni verticali che al 10/10/2026 Energenia non ha a nessun prezzo in questa fascia.

---

## 10. Cosa verificare su fonti primarie prima di decidere o scrivere codice

Priorità: **P1** = blocca la decisione o il MVP; **P2** = da chiudere prima di programmare il modulo interessato; **P3** = da chiudere prima della fase 2 o 3.

| # | Da verificare | Stato nelle note | Fonte primaria | Priorità |
|---|---|---|---|---|
| V1 | Allegato A v1.9.1, XSD ed **Elenco controlli** (00327, 00404 duplicati, codici per CIG/CUP 00411 o 00432) | PDF non letto; XSD invariato solo ipotizzato | [AdE Allegato A 1.9.1](https://www.agenziaentrate.gov.it/portale/documents/d/guest/allegato-a-specifiche-tecniche-vers-1-9-1); fatturapa.gov.it | P1 |
| V2 | Guida AdE alla compilazione (TD16-TD29, blocchi di TD29), specifiche SdI aggiornate oltre la v1.8.1, indirizzo PEC sdi01 | [NV] | AdE / fatturapa.gov.it | P2 |
| V3 | Versione del **Windows Server** aziendale e cicli di vita Microsoft (Server 2025; ESU commerciale anni 2-3) | Server sconosciuto; date da fonti terze | Server in ufficio; Microsoft Learn lifecycle | P1 |
| V4 | **Invoicetronic**: natura dei pacchetti prepagati, **DPA e hosting**, cosa significa il prerequisito "conservazione a norma", ragione sociale | Non trovati | Contratto e DPA del fornitore | P1 |
| V5 | **Specifica File Xml GB** (zip interno alla procedura); se ammette solo pagamenti e non IVA; supporto CBI/camt e chiusura delle partite in Riconcilia GB | Non pubblica | Commercialista / supporto GB | P1 |
| V6 | Circolari 14/E e 37/E/2015 (reverse charge su impianti e FV), 36/E/2013 (10% FV), 15/E/2018 (beni significativi); risposta 218/2020 (wallbox); prassi su accumulo, pompe di calore, solare termico; numero della risposta sull'agrivoltaico | Secondarie o [N] | agenziaentrate.gov.it; validazione scritta dello studio | P1 |
| V7 | Scorporo IVA della ritenuta 11% applicato dalla banca di Energenia; come la banca certifica le ritenute | B | Contabile bancaria reale | P2 |
| V8 | Split payment: testo della Decisione 2026/1728 su EUR-Lex; elenchi MEF 2027 | M-A (secondarie) | EUR-Lex; finanze.gov.it | P2 |
| V9 | Testo unico IVA: tavola di corrispondenza degli articoli (art. 17, 21, Tab. A) | Esistenza A, mappatura n.t. | GU 30/01/2026; [QuotidianoPiù](https://www.quotidianopiu.it/dettaglio/16440001/testo-unico-iva-impatti-operativi-su-gestionali-registri-ed-e-fattura) | P1 (prima del 01/01/2027) |
| V10 | Bollo: soglia di differimento 5.000 €, sanzione 25% o 30%, date degli elenchi | B | Guida AdE di giugno 2026 | P2 |
| V11 | Conservazione: termine per le fatture 2025 (31/01/2027?), condizioni e durata dell'accordo AdE, eventuale scadenza di adesione al servizio di consultazione al 30/09/2026 (dichiarazione di uno studio, non verificata) | Conflitti | Area riservata Fatture e Corrispettivi; DM 17/06/2014 | P2 |
| V12 | Sanzioni art. 6 D.Lgs. 471/97 (minimo 300 o 500 €) e tabelle di ravvedimento | Conflitto | Normattiva | P3 |
| V13 | Termine del TD19; esclusione per acquisti non territoriali fino a 5.000 € | Conflitto / [NV] | Normattiva; AdE | P2 |
| V14 | Ritenuta tra imprese 2028: decreti attuativi; ritenuta condominiale 4% con bonifico parlante | Attuativi n.t. | Normattiva; AdE | P3 |
| V15 | Soglie della liquidazione trimestrale (500/800 mila €), minimo di versamento IVA, scadenza di Redditi SC | [N] | Normattiva; studio | P2 |
| V16 | Licenza e supporto 1.9.x di FatturaElettronica.NET; fatturato di Energenia rispetto alla soglia QuestPDF | n.t. | Repository GitHub; bilancio | P2 |
| V17 | OpenSTAManager: release stabile con la 1.9.1, copertura di prima nota, registri e liquidazione, canale SdI | Beta a giugno 2026 | Prova pratica (sezione 8) | P1 |
| V18 | Odoo: dove è ospitato il proxy SdI, che DPA prevede, se è gratuito per la Community; copertura OCA 18 di ritenute, split e reverse charge | n.t. | odoo.com; OCA | P3 |
| V19 | Banche di Energenia: disponibilità di CBI RH e camt.053, copertura PSD2; contenuto dei nuovi tracciati SEPA del 15/11/2026; tracciati RiBa e SDD CBI correnti | n.t. | Banche; cbi-org.eu | P2 |
| V20 | Delega Unica: limite di 2 intermediari, delegati attuali di Energenia | Riportato, non confermato | Area riservata AdE; studio | P3 |
| V21 | Dropbox: piano, Rewind, cancellazione definitiva da parte dell'amministratore | Non verificato | Console Dropbox | P2 |
| V22 | Prezzi ufficiali 2026: Easyfatt (Enterprise, Cloud), Openapi (0,015, 0,025 o 0,07 €), A-Cube, inclusione delle API in Legalinvoice | Incoerenti | Listini o preventivi | P2 |
| V23 | ViDA: finestre di emissione e comunicazione DRR (10 giorni o 2 giorni lavorativi) | Conflitto | EUR-Lex Dir. 2025/516 | P3 |
| V24 | Conto Termico 3.0 e iperammortamento 2026: requisiti di fattura e bonifico | Non verificato | gse.it; MIMIT; L. 199/2025 | P3 |

---

## 11. Decisioni aperte e domande per Giovanni e per il commercialista

### 11.1 Decisioni aperte

| # | Decisione | Opzioni | Orientamento provvisorio | Dipende da |
|---|---|---|---|---|
| D1 | Costruire o adottare | Da zero / OpenSTAManager / Odoo | Da zero snello, salvo esito positivo della prova di OpenSTAManager | V17; chi sviluppa (G15) |
| D2 | Profondità contabile | Prima nota gestionale con registro a partita doppia "nascosto" / contabilità generale interna | Prima nota gestionale; libri ufficiali allo studio | C14, C15 |
| D3 | Canale SdI | Intermediario API / PEC / SDICoop | Intermediario dietro adattatore; PEC come piano B | V4; G17 |
| D4 | Indirizzo telematico e data di passaggio | Codice dell'intermediario / PEC; data | Inizio di un periodo di liquidazione, con Easyfatt in sola lettura | G2, G20, C14 |
| D5 | Ospitalità | Server in ufficio / VPS UE | Server in ufficio con VPN | V3; G9 |
| D6 | Stack | .NET 10 / Django | .NET 10 | G15 |
| D7 | Pagamenti e non IVA verso lo studio | File Xml GB ristretto / CSV o estratto conto per Riconcilia GB | Da concordare; nessun invio di fatture (canale cassetto confermato il 10/10/2026) | C2-C6 |
| D8 | Banca | File / PSD2 | File nel MVP | V19 |
| D9 | PC client | Windows 11 / ESU commerciale | Passaggio a Windows 11, ESU come ponte | G10 |
| D10 | Codifica di commesse e cantieri | Codice libero / legato al contratto | Legato al contratto, con "tipo contratto" (appalto o cessione con posa) obbligatorio | G6, G18 |

### 11.2 Domande per Giovanni

| # | Domanda | Cosa sblocca |
|---|---|---|
| G1 | Quante fatture attive e passive nel 2025 (incluse note di credito, autofatture e integrazioni)? | Dimensionamento dei costi (sezione 9) |
| G2 | Che edizione di Easyfatt usate, quando scade il rinnovo, avete raggiunto la soglia, usate Easyfatt Cloud? Quale codice destinatario è attualmente registrato in Fatture e Corrispettivi? | Data di passaggio (D4) |
| G3 | Quanti utenti, con quali ruoli? Chi lavora da remoto e da quali dispositivi? | Multiutenza, VPN, MFA |
| G4 | Che quota di clienti sono privati, imprese, PA, esteri? Lavorate per condomini? | Priorità di A10, A11, N6.7, split payment, ritenuta 4% |
| G5 | Avete fornitori esteri (UE o extra-UE) o servizi SaaS esteri? | TD17/TD18/TD19 (B8) |
| G6 | I contratti tipici sono appalto/installazione o vendita con posa? Come gestite acconti e SAL? | IVA, reverse charge, momento d'imposta |
| G7 | Quali incentivi gestite (bonus casa/ecobonus con bonifico parlante, Conto Termico 3.0 con mandato all'incasso, altri)? | A14, C6 |
| G8 | Con quali banche lavorate? Il corporate banking esporta CBI RH o camt.053? Emettete RiBa o SDD? | C4, C8, V19 |
| G9 | Che versione ed edizione ha il Windows Server? Chi lo gestisce? C'è un UPS? Che backup fate attualmente? Che connettività avete (upload, IP statico)? | D5, V3 |
| G10 | Quanti PC sono ancora su Windows 10? Sono compatibili con Windows 11? Avete l'ESU attivo? | D9, art. 32 |
| G11 | Che licenze Microsoft 365 avete (Basic, Standard, Premium)? | Entra ID come fornitore di identità, MFA, Intune |
| G12 | Che piano Dropbox avete (Plus, Professional, Business), con quale cronologia, e chi è l'amministratore? | Backup (V21) |
| G13 | Chi gestisce la PEC aziendale e quanto la usate? | Canale PEC, indirizzo telematico |
| G14 | Che firma digitale ha il legale rappresentante (smart card o remota)? | Firma per la PA |
| G15 | **Chi svilupperà e manterrà il software** (interno, freelance, sviluppo assistito da AI, partner)? Con quale budget e in quali tempi? | D1, D6, rischio di continuità |
| G16 | Il fatturato annuo supera 1 milione di dollari? | Licenza QuestPDF |
| G17 | È accettabile che un intermediario SdI, con contratto art. 28, veda tutte le fatture? | D3 |
| G18 | Come codificate attualmente commesse e cantieri, e chi approva i costi? | B3, B5, D10 |
| G19 | In Easyfatt usate preventivi, DDT e proforma? Servono nel nuovo prodotto? | Perimetro di A2 e A13 |
| G20 | Che data di avvio vorreste? Siete disposti a un periodo di funzionamento in parallelo con Easyfatt? | D4 |
| G21 | Oltre al commercialista, qualcun altro ha la delega al cassetto fiscale di Energenia? | Spazio per un provider di download (B10, V20) |

### 11.3 Domande per il commercialista (studio con GB Software)

Le domande su *se e come* lo studio acquisisce le fatture sono superate dal fatto **confermato dall'utente il 10/10/2026**: lo studio scarica attive e passive dal cassetto fiscale con delega e le importa in GB. Restano aperte queste.

| # | Domanda | Cosa sblocca |
|---|---|---|
| C1 | Quale prodotto e versione GB usate (INTEGRATO GB / Contabilità GB per studi)? Quali moduli aggiuntivi sono attivi: Import Fatture e Corrispettivi, Servizi Massivi AdE, Riconcilia GB Studio e/o PRO? | Formati accettati |
| C2 | Oltre alle fatture dal cassetto, **leggete anche l'archivio `.eft` di Easyfatt** (Prima nota > Importa registrazioni > Danea Easyfatt) per incassi e pagamenti? Oppure li prendete dall'estratto conto o li inserite a mano? | Cosa va sostituito al passaggio |
| C3 | Potete inviarci lo **.zip con istruzioni, linee guida ed esempio del File Xml GB** e dirci la versione? | E2, D7 |
| C4 | Il File Xml GB permette di importare **solo pagamenti e movimenti non IVA** collegati a fatture già acquisite dal cassetto, senza duplicarle? | Evitare la doppia registrazione |
| C5 | Per i movimenti bancari preferite l'**estratto conto originale** (in quale formato: xls, csv, CBI?) o un nostro CSV normalizzato? Avete già modelli e regole di Riconcilia GB per i conti di Energenia? | C4, E2 |
| C6 | Riconcilia GB chiude in automatico le **partite aperte** delle fatture, o dobbiamo indicare noi il riferimento fattura in ogni movimento? | Contenuto dell'export |
| C7 | Ci mandate il **piano dei conti** di Energenia (banca, cassa, clienti, fornitori, principali costi e ricavi) e i **codici e le causali IVA** che usate? | Tabelle di raccordo |
| C8 | Come volete numerati i **sezionali** (ordinarie, reverse charge art. 17 c.6, split payment, note di credito, autofatture TD16-TD19) perché GB attribuisca la causale in automatico? | A3, qualità dell'XML |
| C9 | Le integrazioni **TD16/TD17** che invieremo allo SdI compariranno anche nel cassetto: come le tratta GB, per non contabilizzare due volte il reverse charge? | B7, B8 |
| C10 | Con che **frequenza** e entro quale giorno volete pagamenti e movimenti (mensile o trimestrale)? Con quale canale (email/PEC, cartella condivisa)? | Calendario degli export |
| C11 | Liquidazione IVA mensile o trimestrale? Come classificate l'attività rispetto alle soglie (800.000 € "altre attività")? Chi elabora liquidazione, LIPE ed F24? | D2, D3, D4 |
| C12 | Chi tiene libro giornale e registri IVA **ufficiali** e come li conservate (conservatore, stampa)? | Natura dei registri del software (D1), conservazione |
| C13 | Come registrate le **ritenute dell'11%** subite sui bonifici parlanti e la **ritenuta condominiale del 4%**? Quali dati e documenti vi servono? | C6, E2 |
| C14 | Potete **validare per iscritto** la tabella decisionale IVA (sezione 5.3: FV, N6.7, agrivoltaico, wallbox, accumulo, pompe di calore, beni significativi)? | A5 |
| C15 | Energenia ha aderito al **servizio di conservazione gratuito dell'AdE**? Da quando, e con decorrenza retroattiva? | Conservazione (6.3) |

---

## Conclusione

La ricerca sposta la questione. Non si tratta di costruire un Easyfatt migliore, ma di decidere **dove deve stare la complessità**. Il mercato la distribuisce in modo prevedibile:
- Easyfatt e i cloud leggeri vendono funzioni finanziarie a scalini e trattengono i clienti con soglie e codici destinatario proprietari;
- gli ERP hanno la profondità contabile ma costano e invecchiano;
- nessuno serve davvero la logica verticale di un installatore: aliquote del fotovoltaico, reverse charge N6.7, beni significativi, ritenuta dell'11%, commessa di cantiere.

Il fatto confermato il 10/10/2026, cioè che lo studio legge già le fatture dal cassetto, toglie al software di Energenia gran parte del peso contabile. Il suo valore si concentra in tre cose:
- **XML impeccabili**;
- **dati di cassa ricchi** (incassi, pagamenti, ritenute subite, movimenti non IVA) che il cassetto non contiene;
- **governo operativo** di approvazioni, scadenze e margini di commessa.

Questo è anche l'unico perimetro in cui costruire da zero è razionale.

Il costo vero non è l'infrastruttura, che resta sotto i 200 € l'anno, ma il **debito normativo ricorrente**: una revisione delle specifiche ogni 12-18 mesi, la rinumerazione delle norme dal 01/01/2027, la ritenuta tra imprese dal 2028, il formato europeo dal 2030. Il prodotto quindi è sostenibile solo se nasce con regole in tabelle datate, test automatici e un adattatore SdI sostituibile. Serve anche qualcuno con un mandato esplicito a mantenerlo.

Prima di tutto questo restano tre verifiche che nessuna ricerca può sostituire:
- la versione del server in ufficio;
- la specifica del File Xml GB in mano allo studio;
- una contabile bancaria reale con la ritenuta dell'11%.

---

## Fonti

**Danea Easyfatt**
- [Danea – Caratteristiche Easyfatt](https://www.danea.it/software/easyfatt/caratteristiche/)
- [Danea – FAQ 585 (soglie FE)](https://www.danea.it/software/easyfatt/supporto/faq/?id=585)
- [Gestionale Ideale (prezzi da rivenditore)](https://gestionaleideale.it/)
- [Centrofiscale – TeamSystem Fatture in Cloud vs Danea Easyfatt 2026](https://centrofiscale.com/teamsystem-fatture-cloud-vs-danea-easyfatt-2026/)
- [Danea – Prima nota](https://www.danea.it/software/easyfatt/prima-nota/)
- [Garda Informatica – Easyfatt pro e contro](https://www.gardainformatica.it/blog/consulenza/danea-easyfatt-pro-e-contro)
- [help.danea.it – Multiutenza](https://help.danea.it/easyfatt/html/Si_pu_usare_EasyFatt_in_rete_da_pi_computer_.htm)
- [help.danea.it – Copie di sicurezza](https://help.danea.it/easyfatt/html/Archivi_Copie_di_sicurezza.htm)
- [help.danea.it – Easyfatt Cloud](https://help.danea.it/easyfatt/Easyfatt_Cloud.htm)
- [help.danea.it – Registri e liquidazione IVA](https://help.danea.it/easyfatt/html/Registri_e_Liquidazione_Iva.htm)
- [help.danea.it – Import FE d'acquisto](https://help.danea.it/easyfatt/Importazione_fatture_elettroniche_d_acquisto.htm)
- [help.danea.it – Export al commercialista](https://help.danea.it/easyfatt/Esportare_dati_vs_Commercialisti.htm)
- [help.danea.it – Integrazioni e reverse charge](https://help.danea.it/easyfatt/Integrazioni_autofatture_elettroniche_per_acquisti_esteri_e_reverse_charge.htm)
- [Danea – Novità database Firebird](https://www.danea.it/blog/danea-easyfatt-novita-db/)
- [Danea – Readme versioni](https://www.danea.it/assistenza/readme.asp?codart=ef09)
- [Danea – Fattura elettronica e conservazione](https://www.danea.it/software/easyfatt/fattura-elettronica/)
- [Danea – Easyfatt-Xml](https://www.danea.it/software/easyfatt/xml/)
- [GitHub – easyfatt-db-connector](https://github.com/LukeSavefrogs/easyfatt-db-connector/)
- [PyPI – easyfatt-db-connector](https://pypi.org/project/easyfatt-db-connector/)
- [Trustpilot – Danea](https://it.trustpilot.com/review/danea.it?page=2)
- [Capterra – Fatture in Cloud vs Easyfatt](https://www.capterra.it/compare/199642/209315/fatture-in-cloud/vs/easyfatt)

**Concorrenti cloud**
- [Fatture in Cloud – Costo](https://www.fattureincloud.it/costo/)
- [FIC – Riconciliazione](https://www.fattureincloud.it/software-fatturazione/riconciliazione/)
- [FIC – News riconciliazione](https://news.fattureincloud.it/riconciliazione-bancaria-pi%C3%B9-semplice-e-veloce-che-mai!-326474)
- [FIC – Ricezione FE](https://www.fattureincloud.it/guida-fatturazione-elettronica/ricezione-fattura-elettronica/)
- [FIC – Help cassetto fiscale](https://help.fattureincloud.it/help/articolo/532-scarica-documenti-elettronici-ricevute-cassetto-fiscale-agenzie-entrate)
- [FIC – Scadenzario Plus](https://help.fattureincloud.it/help/articolo/145-scadenzario-scadenzario-plus)
- [FIC Developers – Webhook](https://developers.fattureincloud.it/docs/webhooks/subscriptions/)
- [FIC Developers – E-invoice](https://developers.fattureincloud.it/docs/guides/e-invoice-management/)
- [Fattura24 – Prezzi](https://www.fattura24.com/prezzi/)
- [Fattura24 – Riconciliazione](https://www.fattura24.com/manuale/altri-documenti/riconciliazione-bancaria/)
- [Fattura24 – API](https://www.fattura24.com/api/crea-fattura-elettronica/)
- [Aruba – Listino FE](https://www.aruba.it/listino-fatturazione-elettronica.aspx)
- [Aruba – Modulo Incassi e Pagamenti](https://www.pec.it/modulo-incassi-e-pagamenti.aspx)
- [TeamSystem – Contabilità in Cloud prezzi](https://www.teamsystem.com/store/fatturazione-e-contabilita/contabilita-in-cloud/prezzi/)
- [InfoCert – Legalinvoice Business](https://www.infocert.it/fatturazione/legalinvoice-business)
- [A-Cube – Download cassetto fiscale](https://www.acubeapi.com/prodotti/api-download-cassetto-fiscale)
- [A-Cube – Guida tecnica scarico massivo](https://www.acubeapi.com/blog/scarico-massivo-dal-cassetto-fiscale-tramite-api-guida-tecnica)

**ERP desktop**
- [EduPass – Nozioni generali Mexal](https://www.edupass.it/StreamFile/Resources/Documenti/Manuali/Mexal-Businesspass/NozioniGenerali.pdf)
- [EduPass – Riconciliazione](https://www.edupass.it/StreamFile/Resources/materialevideocorsiriservati/corso_riconciliazione.pdf)
- [EduPass – Cruscotto fatture](https://prova-edupass.passweb.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=fatturazione-elettronica-con-servizio-invio-e-ricezione/cruscotto-fatture)
- [EduPass – Import fatture](https://prova-edupass.passweb.it/manuali/pillole/archivio-pillole-mexal/dettaglio-pillola-mexal?a=fatture-ricevute-con-ritenuta/registrazione-fattura-e-pagamento/import-fatture)
- [EduPass – Controllo di gestione](https://www.edupass.it/manuali/manualistica-mexal/manuale-prodotto?a=manuale-prodotto%2Fazienda%2Fcontrollo-di-gestione%2Fintroduzione)
- [Ingest – Mexal contabilità](https://ingest.it/soluzioni-gestionali/passepartout-mexal/gestione-contabilita/)
- [Help Zucchetti – Causale contabile](https://help.zucchetti.it/dms/ticpro/help/sam/ahrw_standard/gscg/gscg_acc.html)
- [Help Zucchetti – Primanota](https://help.zucchetti.it/dms/ticpro/help/sam/ahrw_standard/gscg/gscg_mpn.html)
- [PmiSoftware – Arca Evolution](https://www.pmisoftware.it/software-gestionale-arca-evolution/)
- [Bluenext – Autofattura TD16](https://helpdesk.bluenext.it/it/support/solutions/articles/32000032181-autofattura-td16)
- [Acut – Gestione prima nota](https://learning.acut.it/tutorial/gestione-prima-nota)
- [Capterra – Mexal](https://www.capterra.com/p/199649/Mexal/)

**Normativa SdI e FatturaPA**
- [AdE – Allegato A v1.9.1](https://www.agenziaentrate.gov.it/portale/documents/d/guest/allegato-a-specifiche-tecniche-vers-1-9-1)
- [AdE – Normativa e regole tecniche](https://www.agenziaentrate.gov.it/portale/normativa-prassi-e-regole-tecniche-fatture-elettroniche)
- [IPSOA 02/04/2026](https://www.ipsoa.it/documents/quotidiano/2026/04/02/e-fattura-nuove-specifiche-tecniche-15-maggio-2026)
- [PMI.it – 1.9.1](https://www.pmi.it/tecnologia/software-e-web/493394/fattura-elettronica-specifiche-tecniche-sdi-1-9-1.html)
- [ApriDigitale – Guida sviluppatori 1.9.1](https://www.apridigitale.it/fatturazione-elettronica/guida-sviluppatori-1-9-1)
- [Fabersystem – v1.9](https://www.fabersystem.it/novita-dal-1-aprile-2025-nuove-specifiche-tecniche-per-la-fatturazione-elettronica-ecco-cosa-cambia/)
- [Informazione Fiscale – TD29](https://www.informazionefiscale.it/Fattura-elettronica-2025-specifiche-tecniche-codice-TD29)
- [Specifiche tecniche SdI v1.8.1](https://www.fatturapa.gov.it/export/documenti/Specifiche_tecniche_SdI_v1.8.1.pdf)
- [AdE – Circ. 13/E/2018](https://www.agenziaentrate.gov.it/portale/-/cs-02072018-cs-circolare-13-fattura-elettronica)
- [AdE – FAQ emissione](https://www.agenziaentrate.gov.it/portale/schede/comunicazioni/fatture-e-corrispettivi/faq-fe/risposte-alle-domande-piu-frequenti-categoria/emissione-delle-fatture-elettroniche)
- [AdE – Bollo giugno 2026](https://www.agenziaentrate.gov.it/portale/documents/d/guest/l-imposta_di_bollo_sulle_fatture_elettronichegiugno2026)
- [Mastro.tax – Bollo 2026](https://mastro.tax/guida-imposta-bollo-fattura-elettronica-2026)
- [Money.it – Esterometro](https://www.money.it/esterometro-2026-come-funziona-e-soggetti-obbligati)
- [AdE – Conservazione](https://www.agenziaentrate.gov.it/portale/aree-tematiche/fatturazione-elettronica/guida-fatturazione-elettronica/come-predisporre-inviare-ricevere-fe/come-si-conservano-fe)
- [Commercialista Telematico – FE verso PA](https://www.commercialistatelematico.com/articoli/2026/03/fattura-elettronica-verso-la-pa.html)
- [Orefattura – Sanzioni](https://www.orefattura.it/fattura-elettronica/invio-tardivo-fattura-elettronica)
- [Fiscomania – Sanzioni](https://fiscomania.com/tardiva-emissione-della-fattura-elettronica-sanzioni/)
- [FiscoeTasse – Testo unico IVA](https://www.fiscoetasse.com/normativa-prassi/13548-nuovo-testo-unico-iva-in-vigore-dal-2027-il-testo-pubblicato-in-gu.html)
- [ANCE – Testo unico IVA](https://ance.it/2026/02/testo-unico-iva-ecco-come-cambia-la-normativa-di-riferimento-sul-valore-aggiunto/)
- [KPMG – ViDA](https://kpmg.com/av/fr/avocats/eclairages/2025/04/vida-publication-de-la-directive-et-des-reglements.html)
- [eConnect – ViDA timeline](https://econnect.eu/en/docs/knowledge/regulations/europe/vida/timeline)

**Normativa IVA e settore**
- [Normattiva – DPR 633/72](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1972-10-26;633)
- [Normattiva – DPR 600/73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.presidente.della.repubblica:1973-09-29;600)
- [Normattiva – DL 357/94](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:1994-06-10;357)
- [Normattiva – L. 488/1999](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:1999-12-23;488)
- [Namirial – Split payment 2029](https://focus.namirial.com/it/split-payment-proroga-2029-cosa-cambia-per-imprese-pa/)
- [MySolution – Split payment 2029](https://www.mysolution.it/fisco/approfondimenti/commenti/2026/07/split-payment-confermato-fino-al-30-giugno-2029-proroga-ue-e-quadro-operativo-della-disciplina-setti/)
- [FiscoeTasse – Split payment 2029](https://www.fiscoetasse.com/new-rassegna-stampa/4127-split-payment-prorogato-al-30-giugno-2029.html)
- [Assolombarda – Split payment](https://www.assolombarda.it/servizi/fisco/informazioni/split-payment-2013-proposta-di-proroga-al-30-giugno-2026-con-esclusione-delle-societa-quotate-dal-1deg-luglio-2025)
- [ECnews – Agrivoltaico e reverse charge](https://www.ecnews.it/fiscale/fisco-e-patrimonio/iva/limpianto-agrivoltaico-non-ricade-nel-regime-del-reverse-charge-2/)
- [ANCE – Circ. 37/E/2015](https://ance.it/2015/12/estensione-del-reverse-charge-c-m-37-e-2015/?print=pdf)
- [ANCE Mantova – Circ. 36/E/2013](https://mantova.ance.it/2014/01/31/impianti-fotovoltaici-chiarimenti-dell-agenzia-delle-entrate-c-m-36-e-2013/?print=pdf)
- [QualEnergia – Wallbox](https://www.qualenergia.it/pro/articoli-pro/aliquota-iva-al-10-per-le-colonnine-di-ricarica-ma-solo-se-installate-insieme-a-un-impianto-fotovoltaico/)
- [CNA Bologna – IVA](https://bo.cna.it/wp-content/uploads/2025/03/Maletti_310321_IVA.pdf)
- [ECnews – Ritenuta bonifici parlanti](https://www.ecnews.it/fiscale/in-pratica/guida-agli-adempimenti/la-ritenuta-sui-bonifici-parlanti/)
- [Eutekne – Ritenuta 11%](https://www.eutekne.info/Sezioni/Art_993635_aumento_della_ritenuta_all_11_per_i_bonifici_parlanti_da_domani.aspx)
- [MySolution – Ritenuta B2B 2028](https://www.mysolution.it/fisco/informazioni/news/2026/01/02/nuova-ritenuta-dacconto-tra-imprese-dal-2028/)
- [Ediltecnico – Bonus 2026](https://ediltecnico.it/bonus-edilizi-2026-legge-di-bilancio/)

**Integrazioni**
- [Invoicetronic – Pricing](https://invoicetronic.com/en/pricing/)
- [Invoicetronic – Prerequisiti](https://invoicetronic.com/en/docs/prerequisites/)
- [Openapi – E-invoicing](https://openapi.com/products/italian-electronic-invoicing)
- [Openapi – Console pricing](https://console.openapi.com/apis/sdi/pricing)
- [fatturaelettronica-api.it](https://www.fatturaelettronica-api.it/)
- [fattura-elettronica-api.it – Piani](https://www.fattura-elettronica-api.it/piani-e-prezzi/)
- [e-invoice.app – A-Cube](https://www.e-invoice.app/vendors/a-cube-api)
- [fatturapa.gov.it – Sistema di accreditamento](https://www.fatturapa.gov.it/it/SistemaAccreditamento/cose-il-sistema-di-accreditamento/)
- [Medium – Accreditamento SDICoop](https://massimomorchio.medium.com/fattura-elettronica-accreditamento-canale-sdicoop-ef6afb65cacb)
- [NT+ Fisco – Canali](https://ntplusfisco.ilsole24ore.com/art/gestione-fattura-elettronica-piu-canali-AEeFY5nE)
- [CDA Studio – Codice destinatario](https://www.cdastudio.it/news/news-fiscalita/241-fattura-elettronica-e-codice-destinatario)
- [FiscoeTasse – Delega Unica](https://www.fiscoetasse.com/new-rassegna-stampa/2660-delega-unica-agli-intermediari-nuove-modalita-dall8-dicembre-2025.html)
- [FAQ AdE 2021](https://www.agenziaentrate.gov.it/portale/documents/20143/287582/14+Tutte+le+faq+(aggiornate+al+28+aprile+2021)+.pdf/948335b1-0f5f-eab4-a3d7-9c0525395af1?version=1.0)
- [AgID – Allegato A](https://www.agid.gov.it/sites/default/files/repository_files/allegato_a_.pdf)
- [Actual Budget – GoCardless](https://actualbudget.org/docs/advanced/bank-sync/gocardless/)
- [Enable Banking – ToS](https://enablebanking.com/terms/)
- [Fabrick – AISP](https://www.fabrick.com/it-it/prodotti/aisp/)
- [CBI Globe](https://www.cbi-org.eu/CBI-Globe-en)
- [EBA – SCA 180 giorni](https://www.eba.europa.eu/publications-and-media/press-releases/eba-publishes-final-report-amendment-its-technical-standards)
- [EOS Solutions – Tracciati CBI](https://docs.eos-solutions.it/it/docs/apps-func/bank-files-for-italy-cbi/fiscal-update-bnk.html)

**GB Software**
- [softwaregb.it – Contabilità commercialisti](https://www.softwaregb.it/software-contabilita-commercialisti/)
- [softwaregb.it – Import Fatture e Corrispettivi](https://www.softwaregb.it/software-contabilita-commercialisti/software-import-fatture-corrispettivi-studi/)
- [guidegbsoftware – Importa fatture elettroniche](https://guidegbsoftware.it/contabilita/prima-nota/importazione-file-xml-fatturazione-elettronica/)
- [softwaregb.it – File Xml GB](https://www.softwaregb.it/importazione-nota-file-xml-rilascio-utility-archivio/)
- [guidegbsoftware – Importazione Danea Easyfatt](https://guidegbsoftware.it/contabilita/prima-nota/importazione-danea-easyfatt/)
- [guidegbsoftware – Import estratto conto](https://guidegbsoftware.it/contabilita/prima-nota/importazione-estratto-conto/)
- [softwaregb.it – Riconcilia GB Studio](https://www.softwaregb.it/software-contabilita-commercialisti/software-import-estratto-conto-studi/)
- [softwaregb.it – Download massivo](https://www.softwaregb.it/download-massivo-fatture-elettroniche-da-fatture-e-corrispettivi-n-2/)
- [softwaregb.it – Console Fatturazione](https://www.softwaregb.it/software-fatturazione-elettronica-commercialisti/console-fatturazione/)
- [softwaregb.it – Caso pratico FE da altri software](https://www.softwaregb.it/caso-pratico-registrazione-fatture-elettroniche-prodotte-con-altri-software-archivio/)
- [softwaregb.it – Contabilità per aziende](https://www.softwaregb.it/software-contabilita-aziende/)

**Architettura, sicurezza e open source**
- [Petri – ESU Windows 10](https://petri.com/windows-10-extended-security-updates-price/)
- [Help Net Security – ESU consumer 2027](https://www.helpnetsecurity.com/2026/06/26/microsoft-windows-10-free-security-updates-esu-program/)
- [Windows Central – LTSB ed ESU](https://www.windowscentral.com/microsoft/windows-11/microsoft-preps-esu-for-windows-10-ltsb-releases-retiring-in-2026)
- [endoflife.ai – Windows Server 2016](https://endoflife.ai/article-windows-server-2016-eol)
- [endoflife.ai – Windows Server 2022](https://endoflife.ai/article-windows-server-2022-eol)
- [sqlite.org – Uso in rete](https://sqlite.org/useovernet.html)
- [HeroDevs – PostgreSQL EOL](https://www.herodevs.com/blog-posts/postgresql-eol-dates-every-versions-release-end-of-life-timeline)
- [PGConf.DE 2025 – Windows](https://www.postgresql.eu/events/pgconfde2025/sessions/session/6563/slides/655/Andras_in_Windowsland.pdf)
- [DatabaseMart – SQL Server Express](https://www.databasemart.com/blog/sql-server-express-2019-2022-2025)
- [.NET – Support policy](https://dotnet.microsoft.com/en-us/platform/support/policy/dotnet-core)
- [QuestPDF – Community License](https://questpdf.com/license/community.html)
- [GitHub – FatturaElettronica.NET](https://github.com/FatturaElettronica/FatturaElettronica.NET)
- [GitHub – OpenSTAManager](https://github.com/devcode-it/openstamanager)
- [GitHub – OCA l10n-italy](https://github.com/OCA/l10n-italy)
- [Odoo – Localizzazione Italia](https://www.odoo.com/documentation/latest/applications/finance/fiscal_localizations/italy.html)
- [GitHub – Headscale](https://github.com/juanfont/headscale)
- [GitHub – restic](https://github.com/restic/restic)
- [Dropbox – Rewind](https://experience.dropbox.com/resources/dropbox-rewind)
- [Forum Nextcloud – Cloudflare Tunnel](https://help.nextcloud.com/t/is-cloudflare-tunnel-safe-privacy-focused/150268)
- [Reg. UE 2016/679 (GDPR)](https://eur-lex.europa.eu/legal-content/IT/TXT/?uri=CELEX:32016R0679)
- [Assolombarda – DPIA](https://www.assolombarda.it/servizi/privacy/gdpr-valutazione-dimpatto-privacy-dpia-elenco-dei-trattamenti-)
- [Cybersecurity360 – NIS2](https://www.cybersecurity360.it/legal/nis2-cose-quali-aziende-interessa-obblighi-e-sanzioni/)
- [Darktrace – RDP](https://darktrace.com/en/blog/remote-desktop-protocol-rdp-attack-analysis)
