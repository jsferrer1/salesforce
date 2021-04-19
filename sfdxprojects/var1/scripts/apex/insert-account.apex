for (Integer i = 1; i <= 10; i++) {
  Account acc = new Account();
  acc.Name = 'SFDC' + i;
  acc.Website = 'sfdc' + i + '.com';
  System.debug(acc);
  // insert acc;
}