trigger CountNewDeveloperSignUps on Lead (before insert) {

  // create a collection of lead email addresses
  Set<String> signUpEmails = new Set<String>();
  for (Lead myLead : Trigger.new) {
    signUpEmails.add(myLead.Email);
  }

  // get the count of unique email addresses
  signUpEmails.size();
}