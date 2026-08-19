public class Bus implements Vehicle{
	public void start(){
        System.debug('Bus is getting started');
    }
    
    public void stop(){
        System.debug('Bus is stopping');
    }
    
    public void horn(){
        System.debug('Bus is honking');
    }
}