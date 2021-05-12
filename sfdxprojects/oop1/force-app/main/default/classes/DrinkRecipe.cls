public class DrinkRecipe extends Recipe {

    public Boolean bKidFriendly = true;
    public DrinkRecipe(string inName, string inInstructions) {
        super(inName, inInstructions);
    }

    // public override void printDescription() {
    //     super.printDescription();

    //     if( bKidFriendly ) {
    //         system.debug('...' + name + ' is fine for kids!');
    //     }
    //     return;
    // }
}
