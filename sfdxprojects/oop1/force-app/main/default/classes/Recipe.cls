public virtual class Recipe extends Template implements Comparable {
	public string name;
    protected string instructions;
    private string source = 'grandma';

    public class RecipeException extends Exception {}

    public Recipe() {}

    public Recipe(string inName, string inInstructions) {
        name = inName;
        instructions = inInstructions;
        if (instructions.contains('days')) {
            throw new RecipeException('Takes too long: ' + instructions);
        }
    }

    public override void printDescription() {
        system.debug('Name: ' + name + ', Instructions: ' + instructions);
		    return;
    }

    public integer compareTo(Object compareTo) {
        Recipe compareToRecip = (Recipe) compareTo;
        return name.compareTo(compareToRecip.name);
    }
}
