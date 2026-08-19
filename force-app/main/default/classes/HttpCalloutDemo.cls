public class HttpCalloutDemo {
    public static void makecallout(){
        //remote site setting
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Meal_API/api/json/v1/1/filter.php?c=Seafood');
        req.setMethod('GET');
        HttpResponse resp = http.send(req);
        System.debug(resp.getstatuscode());
        System.debug(resp.getBody());
        String response = resp.getBody();
		/*Object wrapper = JSON.deserialize(response, WrapperClass.class); 
        WrapperClass wr = (WrapperClass)wrapper;
        
        System.debug(wr.meals);
        System.debug(wr.meals.size());
        System.debug(wr.meals[0]);
        System.debug(wr.meals[0].strMeal);*/
        
        Object rawResponse = JSON.deserializeUntyped(response);
        Map<String, Object> responseMap = (Map<String, Object>)rawResponse;
        System.debug('rawResponse '+rawResponse);
        System.debug('responseMap '+responseMap);
        System.debug('responseMap meals '+responseMap.get('meals'));
        Object[] resArr = (Object[])responseMap.get('meals');
        for(Object obj : resArr){
            Map<String, Object> m = (Map<String, Object>)obj;
            System.debug('strMeal '+(String)m.get('strMeal'));
            System.debug('strMealThumb '+(String)m.get('strMealThumb'));
            System.debug('idMeal '+(String)m.get('idMeal'));
            System.debug('strArea '+(String)m.get('strArea'));
            System.debug('strCountry '+(String)m.get('strCountry'));
        }
    }
    
    class WrapperClass{ //inner class
        public Meal[] meals{get; set;}
    }
    
    class Meal{
        public String strMeal{get; set;}
        public String strMealThumb{get; set;}
        public String idMeal{get; set;}
        public String strArea{get; set;}
        public String strCountry{get; set;}
    }
}