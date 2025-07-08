public class AnimalsCallouts {
    Public static HttpResponse makeGetCallOut(){
        Http http = new Http();
        HttpRequest request = New HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            Map<String, object> results = (Map<String, object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = ( List<Object>)results.get('animals');
            system.debug('Recieved the following animals:');
            for(Object animal : animals){
                system.debug(animal);
            }
        }
        return response;
    }
    public static HttpResponse makePostCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        
        HttpResponse response = http.send(request);
        if(response.getStatusCode() != 201){
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        }else{
              System.debug(response.getBody());
        }
        return response;
    }
}