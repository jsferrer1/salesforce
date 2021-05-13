public with sharing class RecipeTriggers {

    private static boolean bInTrigger = false;

    public static void checkDuplicates(Map<Id, Recipe__c> mapUpdatedRecipes) {
        if( bInTrigger )
            return;

        bInTrigger = true;

        for( Recipe__c r: mapUpdatedRecipes.values() ) {
            system.debug('...trigger on: ' + r.Name);
        }

        Set<Id> oldRecords = mapUpdatedRecipes.keySet();
        List<Recipe__c> lstRecipesToUpdate = [SELECT Id, Name from Recipe__c WHERE Id NOT IN :oldRecords];

        for(Recipe__c r : lstRecipesToUpdate) {
            system.debug('...need to check: ' + r.Name);
            r.Status__c = 'potential duplicate';
        }
        update lstRecipesToUpdate;
        bInTrigger = false;
    }
}