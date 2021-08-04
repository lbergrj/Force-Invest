public with sharing class OrdemTriggerHandler extends TriggerHandler { 
    
	
     protected override void beforeInsert(){ 
        System.debug('Before Insert' );
         List<Ordem__c> ordens =  (List<Ordem__c>) Trigger.new;
         List<Ordem__c> ordensInserir = OrdemHandler.registraOrdens(ordens);
         insert ordensInserir;
    }
    
   
    
    /*
     protected override void beforeInsert(){ 
        System.debug('Before Insert' );
       List<Ordem__c> ordens =  (List<Ordem__c>)  [Select Id, Tipo__c, Status__c,   Quantidade__c, Preco__c,  
        AtivoCarteira__r.Id, AtivoCarteira__r.Quantidade__c, AtivoCarteira__r.ValorInvestido__c, AtivoCarteira__r.PrecoMedio__c,
          AtivoCarteira__r.QuantidadeCalculada__c, AtivoCarteira__r.ValorInvestidoCalculado__c                                         
          from  Ordem__c where Id in :trigger.New];
          System.debug('Tamanho do Array ' + ordens.size() );
         for (Ordem__c o: ordens){
              System.debug('Valor Investido ' + o.AtivoCarteira__r.ValorInvestidoCalculado__c ); 
         }
        
       List<Ordem__c> ordensSaida = OrdemHandler.calculaCustoTotal(ordens);
      insert ordensSaida;  
       
    }
     */
    
	/*
	  protected override void afterInsert(){         
       List<Ordem__c> ordens =  (List<Ordem__c>)  [Select id, Tipo__c, Status__c,   Quantidade__c, Preco__c,  
        AtivoCarteira__r.id, AtivoCarteira__r.Quantidade__c, AtivoCarteira__r.ValorInvestido__c, AtivoCarteira__r.PrecoMedio__c
        from  Ordem__c where id in :trigger.newMap.keySet()];       
        List<AtivoCarteira__c> atcs = AtivoCarteiraHandler.calculaPrecoMedioCompra(ordens);
        update atcs;	
       
    }    
    
	 */     
   
    
}