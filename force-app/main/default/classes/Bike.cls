public class Bike extends TwoWheeler{
    public void start(){
        System.debug('starting the bike');
    }
    
    /*

	public void stop(){
        System.debug('Brake is applied two wheeler is stopped');
    }
		*/
    
    public override void accelerate(){
        System.debug('Accelerating the bike');
    }
    
    public void horn(){
        System.debug('Bike horn the bike');
    }
    
    /*
public virtual void hello(){
        System.debug('Hello from Two Wheeler');
    }
*/
 }