trigger MultiSelectCounter on Account (before insert, before update) {

  List<Task> tasksToCreate = new List<Task>();
  for (Account acc : Trigger.new) {
    String accLoc = acc.Location__c;
    acc.Counter__c = 0;
    if (accLoc != null && accLoc != '') {
      String[] sLoc = accLoc.split(';');
      acc.Counter__c = sLoc.size();

      for (String loc : sLoc) {
        Task t = new Task();
        t.Subject = loc;
        t.Status = 'Not Started';
        t.Priority = 'Normal';
        t.WhatId = acc.Id;
        tasksToCreate.add(t);
      }
    }
  }

  // bulk insert
  insert tasksToCreate;
}