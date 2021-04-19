trigger MostExpensiveCompetitor on Opportunity (before insert, before update) {

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
    Decimal highestPrice;
    Integer highestPricePosition;
    for (Integer i = 0; i < competitorPrices.size(); i++) {
      Decimal currentPrice = competitorPrices.get(i);
      if (highestPrice == null || currentPrice > highestPrice) {
        highestPrice = currentPrice;
        highestPricePosition = i;
      }
    }

    // set the most expensive competitor field
    opp.Most_Expensive_Competitor__c = competitors.get(highestPricePosition);
    opp.Most_Expensive_Price__c = highestPrice;
  }
}