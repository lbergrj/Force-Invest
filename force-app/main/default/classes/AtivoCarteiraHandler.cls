public class AtivoCarteiraHandler {  
    
    /*
     //Calcular o custo Total de compra do Ativo de Carteira
    public static AtivoCarteira__c calculaCustoTotal(Ordem__c ordem, AtivoCarteira__c atc){
        //AtivoCarteira__c atcSaida = new AtivoCarteira__c();
        Double quant = 0 ;   
        Double valorInvestido = 0 ;	
        
        //Soma o valor de ordem de compra ao valor total do ativo de carteira
        if(ordem.Tipo__c == 'Compra'){
          quant = atc.Quantidade__c + ordem.Quantidade__c;     
          valorInvestido =  atc.ValorInvestido__c + ordem.Quantidade__c * ordem.Preco__c;
          atc.PrecoMedio__c =  valorInvestido / quant;
			
        }
        
        //Debita quantidade  e o valor total  de ordem de venda na carteira
        else if (ordem.Tipo__c == 'Venda'){
            quant = atc.Quantidade__c - ordem.Quantidade__c;  
            valorInvestido =  atc.PrecoMedio__c * quant;
        }
        atc.Quantidade__c = quant;
        atc.ValorInvestido__c = valorInvestido;
        return atc;
    } 
    
   
    
    public static List<AtivoCarteira__c> calculaPrecoMedioCompra(List<Ordem__c> ordens){
        Map<Id,AtivoCarteira__c> mapAtivoCarteiras = new Map<Id,AtivoCarteira__c>();
        List<AtivoCarteira__c>ativosCarteiras = new List<AtivoCarteira__c>();
        
        for(Ordem__c o:ordens){
             AtivoCarteira__c atc = new AtivoCarteira__c();            
             if(o.Status__c == 'Executada'){
				//Se o ativo de carteira não for encontrado no mapa é usado são usados os valores do banco como referência;				         
            	if (mapAtivoCarteiras.get(o.AtivoCarteira__r.Id) == null){
                    atc = o.AtivoCarteira__r;
                    atc.Quantidade__c = atc.QuantidadeCalculada__c;
                    atc.PrecoMedio__c = atc.PrecoMedioCalculado__c;
                } 
                 
               	//Se o ativo de carteira  for encontrado no mapa é realizado o cálculo com o mesmo e a ordem de entrada 	
            	else{
                	atc = mapAtivoCarteiras.get(o.AtivoCarteira__r.Id);
            	}                 
                // Calcula os valores de quantidade e preço médio de compra dos ativos de carteira e salva no Mapa
            	mapAtivoCarteiras.put(atc.Id,calculaCustoTotal(o,atc));
             }               
        }
        
        for(AtivoCarteira__c ac: mapAtivoCarteiras.values()){
            ativosCarteiras.add(ac);
        }
        return ativosCarteiras;
    }
     */
    
    
    
    
}