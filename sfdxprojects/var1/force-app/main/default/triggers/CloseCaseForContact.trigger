trigger CloseCaseForContact on Case (before insert) {
  for (Case ca : Trigger.new) {
    // check for similar contact
    if (ca.contactId != null) {
      Integer countCase = [SELECT count()
                            FROM Case
                            WHERE contactId = :ca.contactId
                              AND createdDate = TODAY];
      System.debug('count: ' + countCase);
      if (countCase >= 2) {
        ca.Status = 'Closed';
      }
    }

    // check for similar account
    if (ca.accountId != null) {
      Integer countCase = [SELECT count()
                            FROM Case
                            WHERE accountId = :ca.accountId
                              AND createdDate = TODAY];
      System.debug('count: ' + countCase);
      if (countCase >= 3) {
        ca.Status = 'Closed';
      }
    }
  }
}