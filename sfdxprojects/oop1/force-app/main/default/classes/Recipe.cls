public class Recipe {
  private string name;
  private string instructions;

  public final integer MAX_TEMP = 550;

  /**
   * constructors
   */

  public Recipe(string pName) {
    this(pName, '');
  }

  public Recipe(string pName, string pInstructions) {
    name = pName;
    instructions = pInstructions;
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

  public void printDescription() {
    if (hasInstructions) {
        system.debug('name: ' + name + ', instructions: ' + instructions);
    } else {
        system.debug('name: ' + name);
    }
  }

  public void printDescription(string prefix) {
    system.debug(prefix + 'name: ' + name + ', instructions: ' + instructions);
  }
}