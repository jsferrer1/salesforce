List<Recipe> recipes = new List<Recipe>();
recipes.add(new Recipe('tinola'));
recipes.add(new Recipe('sinigang', 'catch the fish'));

for (Recipe r : recipes) {
  r.printDescription();
}

// public class Recipe {
//   string name;
//   string instructions;

//   public final integer MAX_TEMP = 550;

//   /**
//    * constructors
//    */

//   Recipe(string pName) {
//     this(pName, '');
//   }

//   Recipe(string pName, string pInstructions) {
//     name = pName;
//     instructions = pInstructions;
//   }

//   /**
//    * properties (getters/setters)
//    */

//   public boolean hasInstructions {
//     get {
//       return string.isNotEmpty(instructions);
//     }
//   }

//   /**
//    * methods
//    */

//   void printDescription() {
//     system.debug('name: ' + name + ', instructions: ' + instructions);
//   }

//   void printDescription(string prefix) {
//     system.debug(prefix + 'name: ' + name + ', instructions: ' + instructions);
//   }
// }

// string name = 'gazpacho';
// string instructions = 'fry garlic and onions, add tomatoes, cook 15 mins, cool';
// Recipe recipe1 = new Recipe(name, instructions);
// recipe1.printDescription();

