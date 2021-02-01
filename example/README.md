# Wso2 Esb Example

Questo progetto contiene codice di esempio dei principali mediator e oggetti esb.
Qui di seguito una breve descrizione per ogni file.

## api
- **api-corso.xml** 4 api semplici (hello world)
- **api-corso-mediators.xml** Api associate a sequence di esempio dei principali mediators

## proxy-services
- **corso-sample-proxy.xml** esempio di proxy con riferimento a wsdl del repo

## sequence
- **corso-clone-seq.xml** sequence che utilizza il mediator clone e aggregate
- **corso-enrichforeach-seq.xml** sequence che effettua un foreach di un array e un enrich per aggiunta elemento
- **corso-filter-seq.xml** sequence mediator filter
- **corso-filterregex-seq.xml** sequence mediator filter con regex
- **corso-foreach-seq.xml** sequence che effettua un foreach di un array modificando il payload di uscita
- **corso-helloworld-jsonplaceholder-seq.xml** semplice chiamata a un endoint
- **corso-helloworld-seq.xml** risposta con mock payloadFactory
- **corso-helloworlduser-seq.xml** risposta con mock payloadFactory input da query param
- **corso-iterate-seq.xml** utilizzo di iterate per eseguire chiamate in un ciclo
- **corso-payloadfactoryjson-seq.xml** utilizzo di payloadFactory con media-type=json
- **corso-payloadfactoryxml-seq.xml** utilizzo di payloadFactory con media-type=xml
- **corso-property-seq.xml** property mediator
- **corso-scriptjs-seq.xml** scriptjs mediator
- **corso-switch-seq.xml** utilizzo switch mediator

## template
- **errorhandler-tm.xml** template usato in error handler
- **errorresponse-tm.xml** template usato per restituire errore
- **jsonplaceholder-posts-filter-tm.xml** template per chiamata endpoint posts con filtro
- **jsonplaceholder-posts-tm.xml** template per chiamata endpoint posts
- **jsonplaceholder-user-tm.xml** template per chiamata endpoint utente
- **jsonplaceholder-users-tm.xml** template per chiamata endpoint lista utenti
- **response-tm.xml** template per formattazione risposta

## endpoint registro
- **jsonplaceholder-posts-ep.xml** endpoint di registro elenco posts
- **jsonplaceholder-posts-filter-ep.xml** endpoint di registro elenco posts con filtro
- **jsonplaceholder-user-ep.xml** endoint di registro utente
- **jsonplaceholder-users-ep.xml** endpoint di registro elenco utenti
