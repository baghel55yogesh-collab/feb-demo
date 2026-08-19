public class QueueableDemo implements Queueable{
    
    public void execute(System.QueueableContext qc){
        System.debug('Heelo this is my queeubale');
        System.enqueueJob(new QueueableDemo());
    }
}