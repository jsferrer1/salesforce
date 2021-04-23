@isTest
public class CheckSecretInformationTest {

    @isTest static void createCaseWithSecretInfo() {
        // given

        // 1. create or update a case
        // 2. case subject can't begin with `Warning`
        // 3. case description can't be null
        // 4. case description contains a secret keyword
        Case myCase = new Case();
        myCase.Subject = 'danger';
        myCase.Description = 'my credit card was stolen';
        insert myCase;
        System.debug('Case ' + myCase.id + ' created with description ' + myCase.Description);
    }
}