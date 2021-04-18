trigger FindSmallestNewDeal on Opportunity (before insert) {

    // add all opportunity amounts into the collection
    List<Decimal> oppAmounts = new List<Decimal>();
    for (Opportunity opp : Trigger.new) {
      oppAmounts.add(opp.Amount);
    }

    // sort the collection to find the smallest opportunity amount
    oppAmounts.sort();
    oppAmounts.get(0); // this is the smallest amount
}