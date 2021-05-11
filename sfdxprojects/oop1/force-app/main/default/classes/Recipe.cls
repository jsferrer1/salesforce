public class Recipe {
  private string name;
  private string instructions;
  private List<Ingredient> lstIngredients;

  public final integer MAX_TEMP = 550;

  /**
   * inner classes
   */

  private class Ingredient {
      private string name;
      private string quantity;

      public Ingredient(string pName, string pQuantity) {
          name = pName;
          quantity = pQuantity;
      }

      public void printDescription() {
          system.debug('...' + name + ', ' + quantity);
      }
  }

  /**
   * constructors
   */

  public Recipe(string pName) {
    this(pName, '');
  }

  public Recipe(string pName, string pInstructions) {
    name = pName;
    instructions = pInstructions;
    lstIngredients = new List<Ingredient>();
  }

  /**
   * properties (getters/setters)
   */

  private boolean hasInstructions {
    get {
      return string.isNotEmpty(instructions);
    }
  }

  /**
   * methods
   */

  public void addIngredient(string pName, string pQuantity) {
      lstIngredients.add(new Ingredient(pName, pQuantity));
  }

  public void printDescription() {
    if (hasInstructions) {
        system.debug('name: ' + name + ', instructions: ' + instructions);
    } else {
        system.debug('name: ' + name);
    }
    for (Ingredient i : lstIngredients) {
        i.printDescription();
    }
  }

  public void printDescription(string prefix) {
    system.debug(prefix + 'name: ' + name + ', instructions: ' + instructions);
  }
}