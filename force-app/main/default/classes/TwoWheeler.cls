public abstract class TwoWheeler implements Vehicle{
    public Integer speed = 100;
    public void stop(){
        System.debug('Brake is applied two wheeler is stopped');
    }
    
    public abstract void accelerate();
    
    
    public virtual void hello(){
        System.debug('Hello from Two Wheeler');
    }
}