public with sharing class AllRecipes {

public static void printAllRecipes() {
    List<Recipe__c> lstRecipes = [select Id, Name from Recipe__c];

    integer totalRecipes = GlobalStats.getTotalRecipes();
    integer userRecipes = lstRecipes.size();

    system.debug('Out of ' + totalRecipes + ' recipes, user has ' + userRecipes);
    for( Recipe__c recip : lstRecipes ) {
        system.debug('...' + recip.Name);
    }
}
}