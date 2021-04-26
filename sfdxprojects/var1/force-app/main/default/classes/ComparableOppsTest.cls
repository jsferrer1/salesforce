@isTest
public class ComparableOppsTest {

    @isTest static void noComparablesFound() {
        // this is a negative test case
        // given
        // 1. create all required records (Account, Opportunity)
        Account acc = new Account();
        acc.Name = 'Winterfell Hotels';
        acc.Industry = 'Hospitality';
        insert acc;

        Opportunity opp = new Opportunity();
        opp.Name = 'Winterfell Hotels';
        opp.AccountId = acc.Id;
        opp.Amount = 100;
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        insert opp;

        // 2. use SOQL to find any junctionObject
        List<Comparable__c> comparables = [SELECT Id
                                             FROM Comparable__c
                                            WHERE Base_Opportunity__c = :opp.Id];

        // 3. assert that the results are as expected
        System.assertEquals(0, comparables.size());
    }

    @isTest static void multipleComparablesFound() {
        // given
        // 1. create all required records (Account, Opportunity)
        Account acc = new Account();
        acc.Name = 'Winterfell Hotels';
        acc.Industry = 'Hospitality';
        insert acc;

        List<Opportunity> compOpps = new List<Opportunity>();
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'Winterfell Hotels';
        opp1.AccountId = acc.Id;
        opp1.Amount = 105;
        opp1.StageName = 'Closed Won';
        opp1.CloseDate = Date.today().addDays(-1);
        compOpps.add(opp1);

        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Winterfell Hotels';
        opp2.AccountId = acc.Id;
        opp2.Amount = 95;
        opp2.StageName = 'Closed Won';
        opp2.CloseDate = Date.today().addDays(-100);
        compOpps.add(opp2);
        insert compOpps;

        Opportunity baseOpp = new Opportunity();
        baseOpp.Name = 'Winterfell Hotels';
        baseOpp.AccountId = acc.Id;
        baseOpp.Amount = 100;
        baseOpp.StageName = 'Prospecting';
        baseOpp.CloseDate = Date.today();
        insert baseOpp;

        // 2. use SOQL to find any junctionObject
        List<Comparable__c> comparables = [SELECT Id,
                                                  Comparable_Opportunity__c
                                             FROM Comparable__c
                                            WHERE Base_Opportunity__c = :baseOpp.Id
                                         ORDER BY Comparable_Opportunity__r.CloseDate DESC];

        // 3. assert that the results are as expected
        System.assertEquals(opp1.Id, comparables.get(0).Comparable_Opportunity__c);
        System.assertEquals(opp2.Id, comparables.get(1).Comparable_Opportunity__c);
    }

}