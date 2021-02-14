# CodeployAcademyWso2
Esercizi wso2esb

Questo progetto contiene esempi relativi all'utilizzo di WSO2 ESB.

- example
Contiene esempi semplici per prendere familiarità con l'ambiente di sviluppo.
- workshop1
Codice per gli esercizi del primo workshop.
- workshop2
Codice per gli esercizi del secondo workshop.

Gli esercizi saranno svolti con la versione WSO2 ESB 5.0.0
Verrà approfondito durante il corso la nuova versione di WSO2 Enterprise Integrator con un focus su ESB
e sulle differenze con la versione 5.0.0.
Vengono utilizzate le Rest Api mock presenti su https://jsonplaceholder.typicode.com/

## setup ambiente
- è necessario avere configurato JAVA sul proprio ambiente
- scaricare la versione server wso2 esb 5.0.0 al link seguente https://wso2.com/integration/previous-releases/
- sempre dallo stesso link scaricare la versione di Tooling full distribution

N.B. Il developer studio (tooling) è un ambiente Eclipse con plugin wso2 già preimpostati.
Ho individuato un errore nell'avvio di tale IDE su MacBookPro Catalina 10.15.7
Per risolvere tale anomalia:
In the Eclipse.app folder:

xattr -d com.apple.quarantine Eclipse.app/

Per avviare l'ambiente in locale avviare wso2esb-5.0.0/bin/wso2server.sh (unix) o wso2esb-5.0.0/bin/wso2server.bat (windows)
La configurazione di base (per 5.0.0) avvia l'ambiente sulla porta 9443 (https://localhost:9443/carbon/admin/login.jsp)

