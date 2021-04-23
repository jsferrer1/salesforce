@isTest
public class MultiSelectCounterTest {

    @isTest static void createCase() {
        // given
        Account acc = new Account();
        acc.Name = 'Small Company';
        acc.Location__c = 'East;West';
        insert acc;
    }
}