List<Recipe> allRecipes = new List<Recipe>();
allRecipes.add(new Recipe('gazpacho', 'fry garlic and onions, add tomatoes, cook 15 mins, cool'));
allRecipes.add(new Recipe('spaghetti marinara', 'cook spaghetti, serve with tomato sauce and red pepper'));
allRecipes.add(new Recipe('shakshuka', 'set eggs in a pan of tomato sauce and vegetables'));
allRecipes.add(new DrinkRecipe('vegetable juice', 'juice tomato, celery, cucumber, carrot; add salt'));

allRecipes.sort();

for(Recipe r : allRecipes) {
    r.printDescription();
}