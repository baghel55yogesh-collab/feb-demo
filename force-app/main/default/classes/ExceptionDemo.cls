public class ExceptionDemo {
    public static void method1(){
        System.debug('Method 1 start');
        method2();
        System.debug('Method 1 end');
    }
    
    public static void method2(){
        System.debug('Method 2 start');
        try{
        	method3();
        }
        catch(Exception ex){
            System.debug('ex message '+ex.getMessage());
        }
        System.debug('Method 2 end');
    }
    
    public static void method3(){
        System.debug('Method 3 start');
            System.debug('1');
        	Integer a = 1/0;
            System.debug('2');
            System.debug('3');
       
        System.debug('Method 3 end');
    }
    
    
    
    
}