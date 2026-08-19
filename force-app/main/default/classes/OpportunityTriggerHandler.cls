public class OpportunityTriggerHandler {
    public static void afterInsert(List<Opportunity> newRecords){
        Set<Id> accIds = new Set<Id>();
        for(Opportunity opp : newRecords){
            if(opp.AccountId!=null){
                accIds.add(opp.AccountId);
            }
        }
        processAccounts(accIds);
    }
    
    public static void afterUpdate(List<Opportunity> newRecords, Map<Id, Opportunity> oldMap){
        Set<Id> accIds = new Set<Id>();
        for(Opportunity opp : newRecords){
            // account change
            if(opp.AccountId != oldMap.get(opp.Id).AccountId){
                if(opp.AccountId != null) accIds.add(opp.AccountId);
                if(oldMap.get(opp.Id).AccountId != null) accIds.add(oldMap.get(opp.Id).AccountId); 
            }
            //if amount is changed on the record
            else if(opp.Amount != oldMap.get(opp.Id).Amount){
                if(opp.AccountId != null) accIds.add(opp.AccountId);
            }
        }
        processAccounts(accIds);
    }
    
    public static void afterDelete(List<Opportunity> oldRecords){
        Set<Id> accIds = new Set<Id>();
        for(Opportunity opp : oldRecords){
            if(opp.AccountId!=null){
                accIds.add(opp.AccountId);
            }
        }
        processAccounts(accIds);
    }
    
    public static void processAccounts(Set<Id> accIds){
        if(accIds.isEmpty()) return;
        
        List<AggregateResult> aggrList = [Select AccountId, SUM(Amount) totalSum from Opportunity 
                                      where AccountId IN :accIds group by AccountId];
        
        List<Account> updateAccs = new List<Account>();
        for(AggregateResult aggr : aggrList){
            Id accId = (Id)aggr.get('AccountId');
            Decimal totalAmt = (Decimal)aggr.get('totalSum');
            Account acc = new Account(Id=accId, Total_Opp_Sum__c=totalAmt);
            updateAccs.add(acc);
          //  updateAccs.add(new Account(Id=(Id)aggr.get('AccountId'), Total_Opp_Sum__c=(Decimal)aggr.get('totalSum')));
        }
        if(!updateAccs.isEmpty()) update updateAccs;
    }
}