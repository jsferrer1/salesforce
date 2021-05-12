public inherited sharing class AllRecipes {

    public static void printAllRecipes() {
        List<Recipe__c> lstRecipes = [select Id, Name from Recipe__c];

        for( Recipe__c recip : lstRecipes ) {
            system.debug('...' + recip.Name);
        }
    }
}