trigger LeadingCompetitor on Opportunity (before insert, before update) {

  for (Opportunity opp : Trigger.new) {
    // add all prices in a list in order of competitor
    List<Decimal> competitorPrices = new List<Decimal>();
    competitorPrices.add(opp.Competitor_1_Price__c);
    competitorPrices.add(opp.Competitor_2_Price__c);
    competitorPrices.add(opp.Competitor_3_Price__c);

    // create the list to store all the competitors
    List<String> competitors = new List<String>();
    competitors.add(opp.Competitor_1__c);
    competitors.add(opp.Competitor_2__c);
    competitors.add(opp.Competitor_3__c);

    // loop through our prices and find the lowest one
    Decimal lowestPrice;
    Integer lowestPricePosition;
    for (Integer i = 0; i < competitorPrices.size(); i++) {
      Decimal currentPrice = competitorPrices.get(i);
      if (lowestPrice == null || currentPrice < lowestPrice) {
        lowestPrice = currentPrice;
        lowestPricePosition = i;
      }
    }

    // set the leading competitor field
    opp.Leading_Competitor__c = competitors.get(lowestPricePosition);
  }
}