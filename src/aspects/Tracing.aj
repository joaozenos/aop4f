package aspects;
import java.util.Date;

import core.Servico;
import core.Funcionario;
import core.Produto;

public aspect Tracing {
	
	pointcut change(): execution(* *.set*(..));
	
	pointcut annotationCut(): @annotation(setCategoriaAnnotation) && execution(* *(..));
	
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
	      }
	    
     after(): changeProduct() {
	     System.out.println("-----------------------------------------------------");
	       System.out.println("change product: " + thisJoinPoint);
      }

     after(): annotationCut(){
    	 System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
    	 System.out.println("Annotation: categoria");
     }
     
     before(): preinitialization(*.new(..)) && !within(Tracing){
    	 System.out.println("#####################################################");
    	 System.out.println(thisJoinPointStaticPart);
     }
}
