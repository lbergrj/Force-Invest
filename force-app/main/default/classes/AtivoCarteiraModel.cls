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
    
    

}