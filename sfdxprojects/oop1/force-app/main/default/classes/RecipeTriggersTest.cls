@isTest(seeAllData=true)
public class RecipeTriggersTest {
	static testmethod void testUpdate() {
		Recipe__c r = [SELECT Id, Name from Recipe__c WHERE Name = 'tinola' LIMIT 1];
        r.Status__c = 'updating';
        update r;
    }

    static testmethod void testInsert() {
		Recipe__c r = new Recipe__c(Name='greek salad', Instructions__c='tomatoes, feta, peppers, olives');
		insert r;
    }
}