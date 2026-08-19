@RestResource(urlMapping='/yogesh2/*')
global class CustomAPI {
	@HttpGet
    global static void handleGet(){
        RestRequest req = RestContext.request;
        RestResponse resp = RestContext.response;
        System.debug(req.params);
        System.debug('Request uri '+req.requestURI);
        Integer pos = req.requestURI.lastIndexOf('/');
        String stId = req.requestURI.substring(pos+1);
        System.debug(stId);
        Student__c student = [Select Id, DOB__c, Name, createddate, lastmodifieddate from Student__c where Id=:stId];
        String st = JSON.serialize(student);
        resp.responseBody = Blob.valueOf(st);
    }
    
	@HttpPost
    global static ResponseData handlePost(){
        RestRequest req = RestContext.request;
        String reqBody = req.requestBody.toString();
        Data data = (Data)JSON.deserialize(reqBody, Data.class);
        //Student + phone
        //student name, dob__c, model
        Student__c st = new Student__c(Name=data.name, DOB__c=Date.parse(data.dob));
        insert st;
        
        Phone__c phone = new Phone__c(Model__c = data.model, Student__c=st.Id);
        insert phone;

       /* Map<String, String> responseMap = new Map<String, String>();
        responseMap.put('Student Name', st.Name);
        responseMap.put('Student Id', st.Id);
        responseMap.put('Student DOB', (st.DOB__c).toString());
        responseMap.put('Phone Id', phone.Id);
        responseMap.put('Phone Model', phone.Model__c); */
        
        ResponseData respData = new ResponseData();
        respData.studentId = st.Id;
        respData.name = st.Name;
        respData.dob = st.DOB__c;
        respData.phoneId = phone.Id;
        respData.model = phone.Model__c;
        return respData; 
    }
    
    @HttpPut
    global static String handlePut(){
        return 'API is working fine, PUT method successfully called';
    }

    @HttpPatch
    global static String handlePatch(){
        return 'API is working fine, PATCH method successfully called';
    }
    
    @HttpDelete
    global static String handleDelete(){
        return 'API is working fine, DELETE method successfully called';
    }

    global class Data{
        global String name{get; set;}
        global String dob{get; set;}
        global String model{get; set;}
    }
    
    global class ResponseData{
        global String studentId{get; set;}
        global String name{get; set;}
        global Date dob{get; set;}
        global String phoneId{get; set;}
        global String model{get; set;}
    }
}