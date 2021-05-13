trigger RecipeTrigger1 on Recipe__c (before insert) {
  for(Recipe__c r : trigger.new) {
      r.status__c = 'check for duplicates';
      system.debug('trigger 1');
  }
}