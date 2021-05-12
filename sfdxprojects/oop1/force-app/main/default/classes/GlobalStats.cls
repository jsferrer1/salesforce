public without sharing class GlobalStats {

    public static integer getTotalRecipes() {
        return [SELECT Count() from Recipe__c];
    }
}