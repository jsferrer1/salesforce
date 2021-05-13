public with sharing class RecipeTriggers {

    public static void checkDuplicates(List<Recipe__c> lstNewRecipes) {

        List<string> lstNames = new List<string>();
        for( Recipe__c r: lstNewRecipes ) {
            lstNames.add(r.Name);
            system.debug('...trigger on: ' + r.Name);
        }

        List<Recipe__c> lstRecipesToUpdate = [SELECT Id, Name from Recipe__c WHERE Name IN :lstNames];

        for(Recipe__c r : lstRecipesToUpdate) {
            system.debug('...potential duplicate: ' + r.Name);
            r.Status__c = 'potential duplicate';
        }
        update lstRecipesToUpdate;
    }
}
