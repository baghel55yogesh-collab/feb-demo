public class Car {
    //properties, member variables
    private String name; 
    private Integer wheels;
    private String model;
    private String color;
    private Boolean radio;
    private String gear;
    private Integer seat;
    private Integer speed;
    public static String tyre = 'ABC';
    
    public Car(){ //non-parameterized constuctor
        this.name = 'Mercedes';
        this.wheels = 4;
        this.model = 'ABC';
        this.color = 'Red';
        this.radio = true;
        this.gear = 'Automatic';
        this.seat = 4;
        this.resetSpeed();
        tyre = 'MRF';
    }
    
    public Car(String name, Integer seat, String model){ //parameterized consturctor
        this.name = name;
        this.seat = seat;
        this.model = model;
        this.color = 'Red';
        this.radio = true;
        this.gear = 'Automatic';
        this.wheels = 4;
        this.resetSpeed();
        tyre = 'Apollo';
    }
    
    public Car(String name, Integer seat, String model, String color){ //parameterized consturctor
        this.name = name;
        this.seat = seat;
        this.model = model;
        this.color = color;
        this.radio = true;
        this.gear = 'Automatic';
        this.wheels = 4;
        this.speed = 0;
        tyre = 'XYZ';
    }
    
    
    
    public void start(){
        System.debug('Engine started... '+this.name+' Car is started');
        this.resetSpeed();
    }
    
    public void increaseSpeed(){
        this.speed +=20;
    }
    
    public void stop(){
        System.debug('Brake Applied... '+this.name+' Car got stopped');
        this.resetSpeed();
    }
    
    public void horn(){
         System.debug('P P P ... '+this.name+' Car is honking');
    }
    
    public String getGear(){
        return this.gear;
    }
    
    public void setGear(String gear){
        this.gear = gear;
    }
    
    public Integer getSpeed(){
        return this.speed;
    }
    
    private void resetSpeed(){
        this.speed = 0;
    }
}