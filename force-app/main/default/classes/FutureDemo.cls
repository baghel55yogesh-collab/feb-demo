public class FutureDemo {
    public static void method1(){
        System.debug('Hello this is method line 1');
        futureMethod();
        System.debug('Hello this is method line 2');
        System.debug('Hello this is method line 3');
        System.debug('Hello this is method line 4');
        callQueueable();
        System.debug('Hello this is method line 5');
    }
    
   	@future
    public static void futureMethod(){
        System.debug('future method called line 1');
        System.debug('future method called line 2');
        System.debug('future method called line 3');
    }
    
    public static void callQueueable(){
        System.enqueueJob(new QueueableDemo());
    }
}