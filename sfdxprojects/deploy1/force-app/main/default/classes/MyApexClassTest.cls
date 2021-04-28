@isTest
private class MyApexClassTest {

	// This test shows a postive path.
	@isTest static void verifyAwesome() {
		System.assertEquals('Awesome', MyApexClass.doSomethingAwesome(), 'The awesome method was not so awesome.');
	}

	// This test shows how to cause an exception to be thrown and catch it.
	@isTest static void exceptAwesome() {
		try {
			MyApexClass.doSomethingAwesome(true);
		} catch (MyApexClass.MyApexClassException e) {
			return;
		}
		System.assert(false, 'A MyApexClassException was expected, but not thrown.');
	}

	// This test shows how to setup test data to be used in your methods.
	@isTest static void queryAccountTest() {
		Account a = (Account) TestFactory.createSObject(new Account());
		insert a;

		Test.startTest(); // Resets all limits (DML, SOQL, etc)
		Account testAccount = MyApexClass.queryAccount();
		Test.stopTest();

		System.assertEquals(a.Name, testAccount.Name, 'The wrong account was returned.');
	}

	// This test is calling a private method decorated with @TestVisible
	@isTest static void verifyPrivateAwesome() {
		System.assertEquals('Still Awesome', MyApexClass.privateAwesome());
	}

}