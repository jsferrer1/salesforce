trigger RecipeTrigger on Recipe__c (before insert, before update) {

	system.debug('-----------In trigger-----------');
  switch on trigger.operationType {
      when BEFORE_INSERT {
        RecipeTriggers.processBeforeInsert(trigger.newMap);
      }
      when BEFORE_UPDATE {
        RecipeTriggers.processBeforeUpdate(trigger.newMap);
      }
  }
	system.debug('-----------Exiting trigger-----------');
}