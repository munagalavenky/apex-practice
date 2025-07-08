public class GetDataFromAnimalService {
    public static void getAnimalsfromService(){
		Http http = new http();
		HttpRequest request = new HttpRequest();
		request.setMethod('GET');
		request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
		HttpResponse response = http.send(request);
			if(response.getStatusCode() == 200){
    			Map<String, object > results =(Map<String, object >)JSON.deserializeUntyped(response.getBody());
    			List<Object> animals = (List<Object>) results.get('animals');
    			System.debug('received the following animals');
    			for(Object animal : animals){
        		system.debug(animal);
    		}
		}
    }
}