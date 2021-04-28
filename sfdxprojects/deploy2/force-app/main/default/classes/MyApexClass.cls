public with sharing class MyApexClass {

	// This method will be used to demonstrate a positive test
	public static String doSomethingAwesome() {
		return doSomethingAwesome(false);
	}

	// This method will be used to demostrate how to test a thrown exception
	public static String doSomethingAwesome(Boolean throwException) {
		if (throwException) {
			throw new MyApexClassException('Something bad happened');
		}
		return 'Awesome';
	}

	// This method will be used to demonstrate how to test database queries
	public static Account queryAccount() {
		return [SELECT Name FROM Account LIMIT 1];
	}

	// This annotation makes a normally private method visible to unit tests
	@TestVisible
	private static String privateAwesome() {
		return 'Still Awesome';
	}

	public class MyApexClassException extends Exception {}
}