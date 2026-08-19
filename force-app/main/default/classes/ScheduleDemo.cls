public class ScheduleDemo implements System.Schedulable {
    public void execute(System.SchedulableContext sc){
        System.debug('Hello my name is Yogesh');
        FutureDemo.futureMethod();
    }
}