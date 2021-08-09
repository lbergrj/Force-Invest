public class AtivoCarteiraModel {
    public Id Id;
    public double quantidadeAtivo;
    public double totalInvestido;
    public double saldoTotalCarteira;
    
    public AtivoCarteiraModel(){
        
    }
    
    public AtivoCarteiraModel(AtivoCarteira__c at){
        this.Id = at.Id;
        this.quantidadeAtivo = at.QuantidadeCalculada__c;
        this.totalInvestido = at.ValorInvestidoCalculado__c;
        this.saldoTotalCarteira = at.CarteiraInvestimentos__r.Saldo__c;
    }

    public AtivoCarteiraModel(Ordem__c o){
        this.Id = o.AtivoCarteira__c;
        this.quantidadeAtivo = o.AtivoCarteira__r.QuantidadeCalculada__c;
        this.totalInvestido = o.AtivoCarteira__r.ValorInvestidoCalculado__c;
        this.saldoTotalCarteira = o.AtivoCarteira__r.CarteiraInvestimentos__r.Saldo__c;
    } 
    
    public static Map<Id,AtivoCarteiraModel> getMapFromDataBank(Set<Id> SetId){
        Map<Id,AtivoCarteiraModel> mapSaida = new Map<Id,AtivoCarteiraModel>();
        for (AtivoCarteira__c atc : (List<AtivoCarteira__c>)[Select Id , QuantidadeCalculada__c, 
            ValorInvestidoCalculado__c,CarteiraInvestimentos__r.Saldo__c
                from  AtivoCarteira__c where Id in :SetId]){

            AtivoCarteiraModel atcm = new AtivoCarteiraModel(atc);
            System.debug('Total Investido: ' + atcm.Id);
             mapSaida.put(atcm.Id, atcm);
        }
        return mapSaida;
    }
}