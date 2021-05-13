trigger RecipeTrigger on Recipe__c (before update) {

	system.debug('-----------In trigger-----------');
	RecipeTriggers.checkDuplicates(trigger.newMap);
	system.debug('-----------Exiting trigger-----------');
}