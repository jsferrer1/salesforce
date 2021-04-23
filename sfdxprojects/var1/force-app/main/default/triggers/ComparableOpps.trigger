trigger ComparableOpps on Opportunity (after insert) {
  for (Opportunity opp : Trigger.new) {
    // retrieve the opp.Account data - shortcut: LIMIT 1
    Opportunity oppAccount = [SELECT Id,
                                     Account.Industry
                                FROM Opportunity
                               WHERE Id = :opp.Id
                               LIMIT 1];
    System.debug('oppAccount.Industry: ' + oppAccount.Account.Industry);

    // define the bind variables
    Decimal minAmount = opp.Amount * 0.9;
    Decimal maxAmount = opp.Amount * 1.1;

    // find records based on criteria
    List<Opportunity> comparableOpps = [SELECT Id
                                          FROM Opportunity
                                         WHERE Amount >= :minAmount
                                           AND Amount <= :maxAmount
                                           AND Account.Industry = :oppAccount.Account.Industry
                                           AND StageName = 'Closed Won'
                                           AND CloseDate >= LAST_N_DAYS:365
                                           AND Id != :opp.Id];
    System.debug('comparable opp(s) found: ' + comparableOpps);

    // for each comparable opp, insert into Comparable__c
    List<Comparable__c> junctionObjToInsert = new List<Comparable__c>();
    for (Opportunity comp : comparableOpps) {
      Comparable__c junctionObj = new Comparable__c();
      junctionObj.Base_Opportunity__c = opp.Id;
      junctionObj.Comparable_Opportunity__c = comp.Id;
      junctionObjToInsert.add(junctionObj);
    }
    insert junctionObjToInsert;
  }
}