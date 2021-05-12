public abstract class Template {
	public string name;
    protected string instructions;

    public abstract void printDescription();

    public void printName() {
        system.debug('Name: ' + name);
    }
}