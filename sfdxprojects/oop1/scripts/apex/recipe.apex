// Recipe recip = new Recipe('sundried tomatoes', 'set tomatoes in the sun for 5 very long days');
// DrinkRecipe drink = (DrinkRecipe) recip;


try {
    Recipe recip = new Recipe('sundried tomatoes', 'set tomatoes in the sun for 5 very long days');
    DrinkRecipe drink = (DrinkRecipe) recip;
}
catch( Recipe.RecipeException e ) {
    system.debug('message: ' + e.getMessage());
    system.debug('cause: ' + e.getCause());
    system.debug('stacktrace: ' + e.getStackTraceString());
}
catch( System.Exception e ) {
    system.debug('message: ' + e.getMessage());
    system.debug('cause: ' + e.getCause());
    system.debug('stacktrace: ' + e.getStackTraceString());
}
