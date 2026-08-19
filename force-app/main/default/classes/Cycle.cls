public class Cycle extends TwoWheeler{
	public void start(){
        System.debug('starting the bike');
    }
    
    public override void accelerate(){
        System.debug('Cycle has paddle');
    }
    
    public void horn(){
        System.debug('Bike horn the bike');
    }
}