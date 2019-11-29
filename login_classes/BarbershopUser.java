package login_classes;

public class BarbershopUser {

	private String name;
	private String surname;
	private String email;
	private String username;
	private String password;
	private boolean barber; //false=customer | true=barber

	/**
	 * Constructor
	 *
	 * @param name
	 * @param surname
	 * @param email
	 * @param username
	 * @param password
	 * @param barber
	 */
	public BarbershopUser(String name, String surname, String email, String username, String password, boolean barber) {

		this.name = name;
		this.surname = surname;
		this.email = email;
		this.username = username;
		this.password = password;
		this.barber = barber;
	}

	/* Getters & Setters */

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the surname
	 */
	public String getSurname() {
		return surname;
	}

	/**
	 * @param surname the surname to set
	 */
	public void setSurname(String surname) {
		this.surname = surname;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the entity
	 */
	public boolean getBarber() {
		return barber;
	}

	/**
	 * @param entity the entity to set
	 */
	public void setBarber(boolean barber) {
		this.barber = barber;
	}

	@Override
	public String toString() {
		return "Users [username=" + username + ", name=" + name + ", surname=" + surname + ", email=" + email + "barber=" + barber + "]";
	}

} //End of class
