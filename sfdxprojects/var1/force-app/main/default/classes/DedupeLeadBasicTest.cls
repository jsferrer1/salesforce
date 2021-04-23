@isTest
public class DedupeLeadBasicTest {

    @isTest static void createLeadNoDupes() {
        // this is a negative test case
        // given
        String leadOwner = UserInfo.getUserId();

        // 1. create all required records (Lead)
        Lead myLead = new Lead();
        myLead.FirstName = 'Bruce';
        myLead.LastName = 'Stark';
        myLead.Company = 'Winterfell Hotels';
        myLead.Email = 'stark@outlook.com';
        myLead.Description = 'The North Remembers';
        myLead.OwnerId = leadOwner;
        insert myLead;

        // 2. use SOQL to find the latest values
        Lead updLead = [SELECT OwnerId,
                               Description
                          FROM Lead
                         WHERE Id = :myLead.Id];

        // 3. assert that the results are as expected
        System.assertEquals(leadOwner, updLead.OwnerId);
        System.assertEquals(myLead.Description, updLead.Description);
    }

    @isTest static void createLeadMultipleDupes() {
        // given
        // 1. create all required records (Lead)
        String email = 'stark@outlook.com';

        List<Contact> dupeContacts = new List<Contact>();
        Contact firstDupe = new Contact();
        firstDupe.FirstName = 'Bruce';
        firstDupe.LastName = 'Stark';
        firstDupe.Email = email;
        dupeContacts.add(firstDupe);

        Contact secondDupe = new Contact();
        secondDupe.FirstName = 'Bruce';
        secondDupe.LastName = 'Stark';
        secondDupe.Email = email;
        dupeContacts.add(secondDupe);
        insert dupeContacts;

        Lead myLead = new Lead();
        myLead.FirstName = 'Bruce';
        myLead.LastName = 'Stark';
        myLead.Company = 'Winterfell Hotels';
        myLead.Email = email;
        myLead.Description = 'The North Remembers';
        myLead.OwnerId = UserInfo.getUserId();
        insert myLead;

        // 2. use SOQL to find the latest values
        Lead updLead = [SELECT OwnerId,
                               Description
                          FROM Lead
                         WHERE Id = :myLead.Id];

        Group dataQ = [SELECT Id
                         FROM Group
                        WHERE developerName = 'Data_Quality'
                        LIMIT 1];

        // 3. assert that the results are as expected
        System.assertEquals(dataQ.Id, updLead.OwnerId);
        System.assert(updLead.Description.contains(firstDupe.Id));
        System.assert(updLead.Description.contains(secondDupe.Id));
    }

}