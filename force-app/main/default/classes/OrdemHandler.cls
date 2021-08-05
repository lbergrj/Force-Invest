public class OrdemHandler {

    //Aplica regra de negócio de Ordem de Compra
    public static AtivoCarteiraModel  handlerCompra(Ordem__c o, AtivoCarteiraModel entrada){       
        if(o.Quantidade__c* o.Preco__c <= entrada.saldoTotalCarteira){
            AtivoCarteiraModel atvm = new AtivoCarteiraModel ();
            atvm.quantidadeAtivo = entrada.quantidadeAtivo + o.Quantidade__c;
            atvm.totalInvestido = entrada.totalInvestido + ( o.Quantidade__c * o.Preco__c);
            atvm.saldoTotalCarteira = entrada.saldoTotalCarteira - ( o.Quantidade__c * o.Preco__c);
            double precoMedio = atvm.totalInvestido / atvm.quantidadeAtivo;
            o.PrecoMedioCompra__c  = precoMedio ;
            return atvm;
        }
        else{
            o.Status__c = 'Cancelada por falta de saldo';
            o.PrecoMedioCompra__c = 0;
            return null;
        }
       
    }
    //Aplica negócio de ordem de Venda
    public static AtivoCarteiraModel handlerVenda(Ordem__c o, AtivoCarteiraModel entrada){    
        if(o.Quantidade__c <= entrada.quantidadeAtivo){
            AtivoCarteiraModel atvm = new AtivoCarteiraModel ();
            double precoMedio = entrada.totalInvestido / entrada.quantidadeAtivo; 
            atvm .quantidadeAtivo = entrada.quantidadeAtivo - o.Quantidade__c;
            atvm .totalInvestido = entrada.totalInvestido - ( o.Quantidade__c * precoMedio);
            atvm.saldoTotalCarteira = entrada.saldoTotalCarteira + ( o.Quantidade__c * o.Preco__c);
            o.PrecoMedioCompra__c =   precoMedio;
            return atvm;
        }
        else{
            o.Status__c = 'Cancelada por falta de saldo';
            o.PrecoMedioCompra__c = 0;            
            return null;
        }
        
    }


}