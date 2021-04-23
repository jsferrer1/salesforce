trigger DedupeLeadBasic on Lead (before insert, before update) {
  // insert into the queue
  List<Group> dataQ = [SELECT Id
                         FROM Group
                        WHERE developerName = 'Data_Quality'
                        LIMIT 1];

  for (Lead myLead : Trigger.new) {
    if (myLead.Email != null && myLead.firstName != null) {
      // search for the email
      List<Contact> myContacts = [SELECT Id,
                                         FirstName,
                                         LastName,
                                         Account.Name
                                    FROM Contact
                                   WHERE email = :myLead.Email];
      System.debug('contact(s) found: ' + myContacts.size());

      // check if there is a match or use .size()
      if (!myContacts.isEmpty()) {
        // assign the lead to the data quality name
        if (!dataQ.isEmpty()) {
          myLead.OwnerId = dataQ.get(0).Id;
        }

        // set the description
        String dupeContactsMessage = 'Duplicate contact(s) found.\n';
        for (Contact con : myContacts) {
          dupeContactsMessage += '(' + con.Id + ') '
                              + con.FirstName + ' '
                              + con.LastName + ' '
                              + con.Account.Name + '\n';
        }

        if (myLead.Description != null) {
          myLead.Description = dupeContactsMessage + '\n' + myLead.Description;
        }
      }
    }

  }
}