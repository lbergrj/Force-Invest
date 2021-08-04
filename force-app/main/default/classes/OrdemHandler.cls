public class OrdemHandler {

    //Busca as informações dos ativos de carteira de uma lista de ordem 
    // e retorna em um map de modelo de ativo de carteira
    public static List<Ordem__c> validaOrdens (List<Ordem__c> ordens){
        //Alimentar o Map de ativos de carteira
        Map<Id,AtivoCarteira__c> mapAtivoCarteira = new Map<Id,AtivoCarteira__c> ();
        Map<Id,AtivoCarteiraModel> mapAtivoCarteiraModel = new Map<Id,AtivoCarteiraModel>();
        List<Ordem__c> salvarOrdens = new List<Ordem__c>();
        
        for(Ordem__c o : ordens){
            mapAtivoCarteira.put(o.AtivoCarteira__c, o.AtivoCarteira__r);
        }

        for (AtivoCarteira__c atc : (List<AtivoCarteira__c>)[Select Id , QuantidadeCalculada__c, 
                ValorInvestidoCalculado__c,CarteiraInvestimentos__r.Saldo__c
                from  AtivoCarteira__c where Id in : mapAtivoCarteira.keySet()]){

            AtivoCarteiraModel atcm = new AtivoCarteiraModel(atc);
            System.debug('Total Investido: ' + atcm.totalInvestido);
            mapAtivoCarteiraModel.put(atcm.Id, atcm);
        }

        //Definir se a ordem será salva  e recalcular os valores no Map de modelo de ativo de carteira
        for(Ordem__c ordem: ordens){
            if(ordem.Status__c == 'Executada'){
                AtivoCarteiraModel atcm = mapAtivoCarteiraModel.get(ordem.AtivoCarteira__c);
                System.debug('Total Investido: ' + atcm.totalInvestido);
                //Tratamentos de ordenes de compra
                if(ordem.Tipo__c == 'Compra'){
                     //Verifica se há saldo na carteira para compra de ativos
                     if(ordem.ValorTotal__c <= atcm.saldoTotalCarteira){
                         atcm.saldoTotalCarteira = atcm.saldoTotalCarteira - ordem.ValorTotal__c;
                         atcm.totalInvestido = atcm.totalInvestido + ordem.ValorTotal__c;
                         atcm.quantidadeAtivo = atcm.quantidadeAtivo + ordem.Quantidade__c;                         
                         ordem.PrecoMedioCompra__c =  atcm.totalInvestido / atcm.quantidadeAtivo;

                         salvarOrdens.add(ordem);
                         mapAtivoCarteiraModel.put(atcm.Id, atcm);
                         System.debug('Ordem de compra salva');
                     }
                     else{
                         System.debug('Saldo insufuciente para realizar a compra');
                     }
                }
                //Tratamentos de ordenes de venda
                else{

                    //Verifica se há lastro na carteira para venda de ativos
                    if(ordem.Quantidade__c <= atcm.quantidadeAtivo){
                        atcm.saldoTotalCarteira = atcm.saldoTotalCarteira + ordem.ValorTotal__c;
                        ordem.PrecoMedioCompra__c =  atcm.totalInvestido / atcm.quantidadeAtivo;
                        atcm.quantidadeAtivo = atcm.quantidadeAtivo - ordem.Quantidade__c;
                        atcm.totalInvestido = atcm.totalInvestido - (ordem.PrecoMedioCompra__c * ordem.Quantidade__c);  

                        salvarOrdens.add(ordem);
                        mapAtivoCarteiraModel.put(atcm.Id, atcm);
                        System.debug('Ordem de venda salva');
                    }
                    else{
                        System.debug('Lastro insufuciente para realizar a venda');
                    }

                }
                

            }
            else{
                //Ordens não execultadas
                salvarOrdens.add(ordem);
            }
        }
        
        
        return salvarOrdens;         
        
    }    
   
    
    
    
    

}