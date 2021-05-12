public with sharing class AllRecipes {

    private without sharing class AllSystemRecipes {
		public integer getTotalRecipes() {
            return [SELECT Count() from Recipe__c];
    	}
    }

    public static void printAllRecipes() {
        List<Recipe__c> lstRecipes = [select Id, Name from Recipe__c];

        AllSystemRecipes allRecipes = new AllSystemRecipes();
        integer totalRecipes = allRecipes.getTotalRecipes();
        integer userRecipes = lstRecipes.size();

        system.debug('Out of ' + totalRecipes + ' recipes, user has ' + userRecipes);
        for( Recipe__c recip : lstRecipes ) {
            system.debug('...' + recip.Name);
        }
    }
}