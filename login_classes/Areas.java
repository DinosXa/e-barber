package login_classes;

public class Areas {

	private int id;
	private String name;

	/**
	 * Constructor
	 */
	public Areas(int id, String name) {

		this.id = id;
		this.name = name;
	}

	//getters & setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {

		return "<ul>"
			+ "<li>id= " + id + "</li>"
			+ "<li>name= " + name + "</li>"
			+ "</ul>";
	}

} // End of class
