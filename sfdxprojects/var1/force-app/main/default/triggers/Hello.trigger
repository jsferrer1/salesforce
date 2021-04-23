trigger Hello on Lead (before insert) {
  System.debug('This is awesome!');
}