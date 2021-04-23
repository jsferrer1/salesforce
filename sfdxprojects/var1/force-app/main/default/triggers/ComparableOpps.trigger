trigger ComparableOpps on Opportunity (after insert) {
  for (Opportunity opp : Trigger.new) {

    // find records based on criteria

    // check if records exists

    // insert into the junction/mapping object

  }
}