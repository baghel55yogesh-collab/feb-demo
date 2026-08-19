public class AccountTriggerHandler {
    public static boolean hasRun = false;
    public static void updateRelatedContactsDesc(List<Account> newRecords, Map<Id, Account> oldMap){
        Set<Id> validAccIds = new Set<Id>();
        for(Account acc : newRecords){
           // if(acc.Description != oldMap.get(acc.Id).Description){
                validAccIds.add(acc.Id);
          //  }
        }
        
        if(validAccIds.isEmpty()) return;
        
        List<Contact> relatedContacts = [Select Id, Description, AccountId, Account.Description from Contact where AccountId in :validAccIds];
        for(Contact cont : relatedContacts){
            cont.Description = cont.Account.Description;
        }
        
        if(!relatedContacts.isEmpty()) update relatedContacts;
    }
    
    
    public static void resursiveTriggerExample(List<Account> newRecords){
        List<Account> accList = new List<account>();
        for(Account acc : newRecords){
            accList.add(new Account(Id=acc.Id, Description='Hello'));
        }
        if(!accList.isEmpty()) update accList;
        
    }
}