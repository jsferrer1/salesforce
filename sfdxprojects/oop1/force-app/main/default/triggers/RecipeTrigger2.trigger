trigger RecipeTrigger2 on Recipe__c (before insert) {
  for(Recipe__c r : trigger.new) {
      r.status__c = 'calculate price';
      system.debug('trigger 2');
  }
}