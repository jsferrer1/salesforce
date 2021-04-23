trigger CountNewDeveloperSignUps on Lead (before insert) {

  // create a collection of lead email addresses
  Set<String> signUpEmails = new Set<String>();
  for (Lead myLead : Trigger.new) {
    // names with "test" are Disqualified
    String firstName = myLead.FirstName;
    String lastName = myLead.LastName;
    if ((firstName != null && firstName.toLowerCase() == 'test')
      || (lastName != null && lastName.toLowerCase() == 'test')) {
      myLead.Status = 'Disqualified';
    }

    // if (myLead.Email != null) {
      signUpEmails.add(myLead.Email);
    // }
  }

  // get the count of unique email addresses
  signUpEmails.size();
}