public with sharing class LWCController {
    @AuraEnabled(cacheable=true)
    public static List<Student__c> fetchStudents(){
        List<Student__c> students =  [SELECT Id, Name, Class__c, DOB__c from Student__c limit 10];
        return students;
    }
}