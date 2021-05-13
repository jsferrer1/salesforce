public with sharing class RecipeTriggers {

    private static Set<Id> setUpdating = new Set<Id>();

    public static void processBeforeInsert(Map<Id, Recipe__c> mapUpdatedRecipes) {
        // check for duplicates
        // check for errors
        // check price
    }

    public static void processBeforeUpdate(Map<Id, Recipe__c> mapUpdatedRecipes) {
        checkDuplicates(mapUpdatedRecipes);
    }

    public static void checkDuplicates(Map<Id, Recipe__c> mapUpdatedRecipes) {

        for( Recipe__c r: mapUpdatedRecipes.values() ) {
            system.debug('...trigger on: ' + r.Name);
            setUpdating.add(r.Id);
        }

        Set<Id> oldRecords = mapUpdatedRecipes.keySet();
        List<Recipe__c> lstRecipesToCheck = [SELECT Id, Name from Recipe__c WHERE Id NOT IN :oldRecords];
    	List<Recipe__c> lstRecipesToUpdate = new List<Recipe__c>();

        for(Recipe__c r : lstRecipesToCheck) {
            if( !setUpdating.contains(r.Id)) {
                system.debug('...potential duplicate: ' + r.Name);
                r.Status__c = 'potential duplicate';
				lstRecipesToUpdate.add(r);
            }
        }

        update lstRecipesToUpdate;
    }
}
