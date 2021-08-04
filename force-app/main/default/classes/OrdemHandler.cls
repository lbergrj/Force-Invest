public class OrdemHandler {
    
    public static List<Ordem__c> registraOrdens(List<Ordem__c> ordens){
         List<Ordem__c> ordensSaida = new List<Ordem__c>();
        
        return ordensSaida;
    }
    
    private static Map<Id,AtivoCarteiraModel> getMapAtivoCarteiraModel(){
        Map<Id,AtivoCarteiraModel> mapAtivoCarteiraModel = new Map<Id,AtivoCarteiraModel>();
        
        return mapAtivoCarteiraModel;
        
    }
    
    private static List<AtivoCarteira__c> getAtivoCarteira(Map<Id,AtivoCarteira__c> mapAtc){
       List<AtivoCarteira__c> lista = (List<AtivoCarteira__c>) [Select id from  AtivoCarteira__c where Id in :mapAtc.keySet()];
        return lista;
    }
    
    

}