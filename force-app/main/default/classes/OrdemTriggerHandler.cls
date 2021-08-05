public with sharing class OrdemTriggerHandler extends TriggerHandler { 
    
	protected override void beforeInsert(){
          System.debug('Before Insert' );
          Set<Id>SetIdAtvc= new Set<Id>();
          Map<Id,AtivoCarteiraModel> mapAtivoCarteiraModel = new Map<Id,AtivoCarteiraModel>();          
          
          //Define os IDs de Ativos de carteira para montar a query para recuperar dados dos ativos de carteira
          for(Ordem__c o: (List<Ordem__c>) trigger.new){
               SetIdAtvc.add(o.Ativocarteira__c) ;     
          }
          System.debug('Size SetId = ' + SetIdAtvc.size() );
          //Cria um mapa de modelo de ativo de carteira com dados recuparados do banco
          mapAtivoCarteiraModel = AtivoCarteiraModel.getMapFromDataBank(SetIdAtvc);
          
          //Implementa as regas de negócio para as ordens
          for (Ordem__c o : (List<Ordem__c>) trigger.new){
             System.debug(o.Tipo__c);
             if(o.Status__c == 'Executada'){
               AtivoCarteiraModel atvm = mapAtivoCarteiraModel.get(o.AtivoCarteira__c);
               if(o.Tipo__c == 'Compra'){
                   //Para teste
                    OrdemHandler.handlerCompra(o,atvm );
               }
               else if (o.Tipo__c == 'Venda'){
                    //Para teste
                    OrdemHandler.handlerVenda(o,atvm );
               }
               //Salva as alterações no modelo de ativo de carteira no mapa
               if (atvm != null){  
                    mapAtivoCarteiraModel.put(atvm.Id,atvm) ;
               } 
             }             
          } 
          
      }
     
     
    
}