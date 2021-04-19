trigger CheckSecretInformation on Case (after insert, before update) {
  String childCaseSubject = 'Warning: Parent Case may contain secret info';

  // Step 1: Create a collection of our secret keyeords
  Set<String> secretKeywords = new Set<String>();
  secretKeywords.add('Credit Card');
  secretKeywords.add('Social Security');
  secretKeywords.add('SSN');
  secretKeywords.add('Passport');
  secretKeywords.add('Bodyweight');

  // Step 2 : Check to see if any of our case contains secret secretKeywords
  List<Case> casesWithSecretInfo = new List<Case>();
  for (Case c: Trigger.new) {
    if (c.Subject != childCaseSubject) {
      for (String keyword: secretKeywords) {
        if (c.Description != null && c.Description.containsIgnoreCase(keyword)) {
          casesWithSecretInfo.add(c);
          System.debug('Case ' + c.Id + ' include secret keyword ' + keyword);
          break;
        }
      }
    }
  }
  // Step 3: IF our case contains a secret keyword, Create a child case
  List<Case> casesToCreate = new List<Case>();
  for (Case caseWithSecretInfo: casesWithSecretInfo) {
    Case childCase = new Case();
    childCase.subject = childCaseSubject;
    childCase.ParentId = caseWithSecretInfo.Id;
    childCase.IsEscalated = true;
    childCase.Priority = 'High';
    childCase.Description = 'At least one of the following keywords are found ' + secretKeywords;
    System.debug('insert childCase: ' + childCase);
    casesToCreate.add(childCase);
    // insert childCase; -- single record
  }
  // bulk insert
  insert casesToCreate;
}