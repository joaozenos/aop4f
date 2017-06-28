package aspects;
import java.util.Date;

import core.Servico;
import core.Funcionario;
import core.Produto;

public aspect Tracing {
	
	pointcut change(): execution(* *.set*(..));
	
	pointcut changeProduct(): change() && within(Produto);
	
	before(): change() {
		System.out.println("Entering: " + thisJoinPoint);
	}
	
	after(): change() {
		System.out.println("Exit: "+thisJoinPoint);
	}
	
	 before(): call(* *.set*(..)) {
	     System.out.println("*****************************************************");
	       System.out.println("calling: " + thisJoinPoint );
	        System.out.println("*****************************************************\n");
	      }
	    
     after(): changeProduct() {
	     System.out.println("*****************************************************");
	       System.out.println("change product: " + thisJoinPoint);
	        System.out.println("*****************************************************\n");
      }

}
