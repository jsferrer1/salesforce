@isTest(seeAllData=true)
public class RecipeTriggersTest {
	static testmethod void testUpdate() {
		Recipe__c r = [SELECT Id, Name, Instructions__c from Recipe__c WHERE Name = 'tinola' LIMIT 1];
        r.Instructions__c = r.Instructions__c + ', lime!';
        update r;
    }
}
