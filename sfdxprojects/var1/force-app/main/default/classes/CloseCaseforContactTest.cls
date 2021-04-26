@isTest
public class CloseCaseforContactTest {

    @isTest static void noCasesFound() {
        // this is a negative test case
        // given
        // 1. create all required records (Contact, Case)
        Contact con = new Contact();
        con.FirstName = 'John';
        con.LastName = 'Doe';
        insert con;

        Case ca = new Case();
        ca.contactId = con.Id;
        ca.Status = 'New';
        ca.Origin = 'Phone';
        ca.Subject = 'test case';
        insert ca;

        // 2. use SOQL to find cases for this contact
        Case updatedCase = [SELECT Status
                              FROM Case
                             WHERE Id = :ca.Id];

        // 3. assert that the results are as expected
        System.assertEquals('New', updatedCase.Status);
    }

    @isTest static void threeCasesFound() {
        // given
        // 1. create all required records
        //    Contact
        //    2 old cases
        //    1 new case
        Contact con = new Contact();
        con.FirstName = 'John';
        con.LastName = 'Doe';
        insert con;

        List<Case> oldCases = new List<Case>();
        for (Integer i = 0; i < 2; i++) {
            Case oldCase = new Case();
            oldCase.contactId = con.Id;
            oldCases.add(oldCase);
        }
        insert oldCases;

        Case myCase = new Case();
        myCase.contactId = con.Id;
        insert myCase;

        // 2. query the updated case data
        Case updatedCase = [SELECT Status
                              FROM Case
                             WHERE Id = :myCase.Id];

        // 3. assert that the results are as expected
        System.assertEquals('Closed', updatedCase.status);
    }

    @isTest static void fourCasesOnAccount() {
        // given
        // 1. create all required records
        //    Account
        //    2 old cases
        //    1 new case
        Account acc = new Account();
        acc.Name = 'John Doe';
        insert acc;

        List<Case> oldCases = new List<Case>();
        for (Integer i = 0; i < 3; i++) {
            Case oldCase = new Case();
            oldCase.accountId = acc.Id;
            oldCases.add(oldCase);
        }
        insert oldCases;

        Case myCase = new Case();
        myCase.accountId = acc.Id;
        insert myCase;

        // 2. query the updated case data
        Case updatedCase = [SELECT Status
                              FROM Case
                             WHERE Id = :myCase.Id];

        // 3. assert that the results are as expected
        System.assertEquals('Closed', updatedCase.status);
    }
}
