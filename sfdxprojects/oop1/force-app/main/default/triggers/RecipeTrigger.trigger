trigger RecipeTrigger on Recipe__c (before insert) {

	system.debug('-----------In trigger-----------');
	RecipeTriggers.checkDuplicates(trigger.new);
	system.debug('-----------Exiting trigger-----------');
}