@isTest
public class LeadingCompetitorTest {

    @isTest static void createOppWithCompetitors() {
        // given
        // 1. create or update an opportunity
        Opportunity opp = new Opportunity();
        opp.Name = 'Big Deal';
        opp.CloseDate = Date.today();
        opp.StageName = 'Prospecting';

        // 2. populate all 3 competitor price fields
        opp.Competitor_1_Price__c = 10000;
        opp.Competitor_2_Price__c = 5000;
        opp.Competitor_3_Price__c = 7000;

        // 3. populate all 3 competitor fields
        opp.Competitor_1__c = 'Amazon';
        opp.Competitor_2__c = 'Google';
        opp.Competitor_3__c = 'Microsoft';

        insert opp;
        System.debug('Opportunity ' + opp.Name + ' inserted with all competitor fields populated.');
    }
}