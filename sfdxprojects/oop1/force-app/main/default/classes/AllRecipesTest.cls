@isTest(seeAllData=true)
public class AllRecipesTest {
	static testmethod void testSharing() {
        List<User> lstUsers = new List<User>();
        lstUsers = [SELECT Id, Name from User where FirstName='User' or FirstName='User'];

        for( User u : lstUsers ) {
            system.runAs(u) {
            	system.debug(u.Name);
	        	AllRecipes.printAllRecipes();
        	}
        }
    }
}