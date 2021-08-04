trigger OrdemTrigger on Ordem__c (before insert) {
	new OrdemTriggerHandler().run();
}