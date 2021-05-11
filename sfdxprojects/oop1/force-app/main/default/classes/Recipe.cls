public class Recipe {
  string name;
  string instructions;

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

  public boolean hasInstructions {
    get {
      return string.isNotEmpty(instructions);
    }
  }

  /**
   * methods
   */

  public void printDescription() {
    system.debug('name: ' + name + ', instructions: ' + instructions);
  }

  public void printDescription(string prefix) {
    system.debug(prefix + 'name: ' + name + ', instructions: ' + instructions);
  }
}