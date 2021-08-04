public with sharing class OrdemTriggerHandler extends TriggerHandler { 
    
	
     protected override void beforeInsert(){ 
        System.debug('Before Insert' );
         List<Ordem__c> ordens =  (List<Ordem__c>) Trigger.new;         
         insert OrdemHandler.validaOrdens(ordens );
    }
    
    
}