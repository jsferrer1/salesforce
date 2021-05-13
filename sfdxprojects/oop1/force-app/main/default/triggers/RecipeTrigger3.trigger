trigger RecipeTrigger3 on Recipe__c (before insert) {
  for(Recipe__c r : trigger.new) {
      r.status__c = 'check for quality';
      system.debug('trigger 3');
  }
}
