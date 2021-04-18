@isTest
public class WarrantySummaryTest {

    @isTest static void createCase() {
        // given
        Case c = new Case();
        c.Subject = 'swift Deal';
        c.Status = 'New';
        c.Origin = 'Phone';
        insert c;
    }
}
