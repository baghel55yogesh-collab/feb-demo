public class SOQLDemoClass {
    public static void callSOQL(){
        List<Account> accList = [Select ID, Name from Account];
        List<Contact> contList = [Select ID, Name from Contact];
        List<Opportunity> oppList = [Select Id, Name from Opportunity];
        System.debug('Acc => '+accList);
        System.debug('Acc size => '+accList.size());
        System.debug('Opp => '+oppList);
        System.debug('Opp size => '+oppList.size());
        System.debug('Cont => '+contList);
        System.debug('cont size => '+contList.size());
        
    }
    
    public static void soqlLimit(){
        for(Integer i=0; i<101; i++){
            List<Account> accList = [Select ID, Name from Account];
        }
    }
}