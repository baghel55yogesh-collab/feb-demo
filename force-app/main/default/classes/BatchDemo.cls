public class BatchDemo implements Database.Batchable<sObject>, Database.stateful{
    Integer count = 0;
   /* public Database.QueryLocator start(Database.Batchablecontext bc){
        //return Database.getqueryLocator('Select Id from Account');
        System.debug('batch class has started');
        return Database.getqueryLocator([Select Id, Name from Account]); //50 million
    }*/
    
    public Iterable<sObject> start(Database.Batchablecontext bc){
        return [Select Id, Name from Account]; //50k
    }
    
    public void execute(Database.Batchablecontext bc, List<sObject> scope){
        
        System.debug('hello the record came into this chunk is '+scope);
        System.debug('size of this chunk is '+scope.size());
        
        count += scope.size();
        System.debug('Value for count is '+count);
        //insert scope;
       /* []
        update
            
            no crossing of govenor 
            50k records
            no of soql => 200
            
            dml> 150
            no fo record dml => 10k*/
    }
    
    public void finish(Database.Batchablecontext bc){
        System.debug('This batch is completed and processed '+count+' records in this batch');
        Database.executeBatch(new BatchDemo());
        
    }
}