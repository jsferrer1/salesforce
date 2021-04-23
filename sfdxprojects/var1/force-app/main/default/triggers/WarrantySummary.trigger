trigger WarrantySummary on Case (before insert) {
  String endingStatement = 'Have a nice day!';
  for (Case myCase : Trigger.new) {
    String purchaseDate = myCase.Product_Purchase_Date__c != null
      ? myCase.Product_Purchase_Date__c.format()
      : Date.today().format();
    String createdDate = Datetime.now().format(); // myCase.CreatedDate.format();
    Integer warrantyDays = myCase.Product_Total_Warranty_Days__c != null
      ? myCase.Product_Total_Warranty_Days__c.intValue()
      : 30;
    Date pdate = Date.parse(purchaseDate);
    Decimal warrantyPercentage = (100 * (pdate.daysBetween(Date.today()) / warrantyDays));
    warrantyPercentage.setScale(2);
    Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c != null
      ? true
      : false;

    myCase.Description = 'Product purchased on ' + purchaseDate + ''
      + 'and case created on ' + createdDate + '.\n'
      + 'Warranty is for ' + warrantyDays + ' '
      + 'days and is ' + warrantyPercentage + ''
      + '% through its warranty period.\n '
      + 'Extended warranty: ' + hasExtendedWarranty + '\n'
      + endingStatement;
  }
}

    // percentage = (Date.today() - purchaseDate) / warrantyDays;
    // Decimal warrantyPercentage = 30.00;

    /*
    Product purchased on <<Purchase Date>> and case created on <<Case Created Date>>.
    Warranty is for <<Warranty Total Days>> days and is <<Warranty Percentage>> through its warranty period.
    Extended warranty: <<Has Extended Warranty>>
    Have a nice day!
    */
    //  Decimal warrantyPercentage = (100 * (myCase.Product_Purchase_Date__c.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c)).setScale(2);
