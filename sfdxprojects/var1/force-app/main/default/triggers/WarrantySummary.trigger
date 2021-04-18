trigger WarrantySummary on Case (before insert) {
  String endingStatement = 'Have a nice day!';
  for (Case myCase : Trigger.new) {
    String purchaseDate = Date.today().format(); // myCase.Product_Purchase_Date__c;
    String createdDate = DateTime.now().format(); // myCase.CreatedDate.format();
    Integer warrantyDays = 30; // myCase.Product_Total_Warranty_Days__c.intValue();
    // percentage = (Date.today() - purchaseDate) / warrantyDays;
    // Decimal warrantyPercentage = (100 * ((Date.today().daysBetween(Date.today())) / warrantyDays));
    Decimal warrantyPercentage = 30.00;
    Boolean hasExtendedWarranty = false; // myCase.Product_Has_Extended_Warranty__c;

    myCase.Description = 'Product purchased on ' + purchaseDate + ''
      + 'and case created on ' + createdDate + '.\n'
      + 'Warranty is for ' + warrantyDays + ' '
      + 'days and is ' + warrantyPercentage + ''
      + '% through its warranty period.\n '
      + 'Extended warranty: ' + hasExtendedWarranty + '\n'
      + endingStatement;
  }
}

    /*
    Product purchased on <<Purchase Date>> and case created on <<Case Created Date>>.
    Warranty is for <<Warranty Total Days>> days and is <<Warranty Percentage>> through its warranty period.
    Extended warranty: <<Has Extended Warranty>>
    Have a nice day!
    */
    //  Decimal warrantyPercentage = (100 * (myCase.Product_Purchase_Date__c.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c)).setScale(2);
