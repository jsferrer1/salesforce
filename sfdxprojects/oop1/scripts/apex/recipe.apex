class Recipe {
  string name;
  string instructions;

  Recipe(string recipeName, string recipeInstructions) {
    name = recipeName;
    instructions = recipeInstructions;
  }

  void printDescription() {
    system.debug('name: ' + name + ', instructions: ' + instructions);
  }
}

// string name = 'gazpacho';
// string instructions = 'fry garlic and onions, add tomatoes, cook 15 mins, cool';
// Recipe recipe1 = new Recipe(name, instructions);
// recipe1.printDescription();

List<Recipe> recipes = new List<Recipe>();
recipes.add(new Recipe('tinola', 'catch the chicken'));
recipes.add(new Recipe('sinigang', 'catch the fish'));

for (Recipe r : recipes) {
  r.printDescription();
}