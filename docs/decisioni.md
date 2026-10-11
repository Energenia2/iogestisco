# Registro delle decisioni e dei fatti confermati

Fatti confermati da Giovanni D'Argento (Energenia Srl) e decisioni di progetto.
Ogni voce riporta la data (ora italiana) e la conseguenza sul gestionale.

| # | Data | Fatto o decisione | Fonte | Conseguenza sul progetto |
|---|---|---|---|---|
| F1 | 10/10/2026 | Il commercialista usa GB Software | Giovanni | Gli export verso lo studio vanno pensati per GB |
| F2 | 10/10/2026 | Il commercialista scarica fatture attive e passive direttamente dall'Agenzia delle Entrate (cassetto fiscale) e le importa in GB | Giovanni | Il gestionale non invia fatture allo studio; deve produrre XML corretti |
| F3 | 10/10/2026 | Il commercialista ricava incassi e pagamenti bancari dagli estratti conto delle banche; i movimenti in contanti li prende dalla prima nota che Energenia gli invia | Giovanni | Verso lo studio serve solo l'export della prima nota di cassa (contanti); i movimenti bancari non vanno esportati |
| D1 | 10/10/2026 | Nessun costo ricorrente per un intermediario SdI se evitabile | Giovanni | Canale proposto: PEC aziendale (invio e ricezione) con il portale Fatture e Corrispettivi come riserva manuale; intermediario a pagamento escluso salvo ripensamenti |
| D2 | 11/10/2026 | Sviluppo e manutenzione del gestionale affidati a Claude, in sessioni come questa | Giovanni | Si costruisce da zero, senza adottare un open source; tutto il contesto deve stare nel repository (decisioni, istruzioni per le sessioni, test automatici), perché ogni sessione riparte senza memoria; l'installazione degli aggiornamenti sul server resta a una persona di Energenia e deve essere semplice |
| F4 | 11/10/2026 | Il server aziendale SERVER-ENER è Windows Server 2012 R2 Standard (6.3, build 9600): controller di dominio e cartelle condivise V: e Z:. Aggiornamenti gratuiti finiti nell'ottobre 2023; quelli a pagamento finiscono a metà ottobre 2026 | Sessione Claude del 09/10/2026 "Claude Code su Windows Server aziendale" (lettura dal registro del dominio) | Il gestionale NON va installato su questo server (fuori supporto, rischio GDPR art. 32). Candidati: PC Dell con Ubuntu Server previsto come "lavoratore automatico" (piano del 09/10/2026) oppure il futuro server sostitutivo |
| M1 | 10/10/2026 | Le domande di progetto vanno poste una alla volta, in chat (botta e risposta, niente moduli a scelta), passando alla successiva solo dopo la risposta | Giovanni | Metodo di lavoro |
