@isTest
public class CountNewDeveloperSignUpsTest {

    @isTest static void createLeadWithSignUps() {
        // given
        Lead l = new Lead();
        l.FirstName = 'Ron';
        l.LastName = 'Artest';
        l.Company = 'Artest';
        l.Email = 'ron@artest.com';
        insert l;
    }
}