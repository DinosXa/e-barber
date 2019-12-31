package login_classes;

public class CustomerUser {

	private int cid;
	private String username;
	private String password;
	private String name;
	private String surname;
	private String email;
	private String phone;
	private boolean isbarber;

	/**
	 * Constructor
	 *
	 * @param CID
	 * @param username
	 * @param password
	 * @param name
	 * @param surname
	 * @param email
	 * @param phone
	 */
	public CustomerUser(int cid, String username, String password, String name, String surname, String email, String phone) {
		this.cid = cid;
		this.username = username;
		this.password = password;
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.phone= phone;
		this.isbarber = false;
	}

	/* Getters & Setters */

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCID() {
		return cid;
	}
	public void setCID(int cid){
		this.cid = cid;
	}

	public boolean getifBarber() {
		return isbarber;
	}
	public void setifBarber(boolean isbarber) {
		this.isbarber = isbarber;
	}

	@Override
	public String toString() {
		return "Users [username=" + username + ", password=" + password +
					", name=" + name + ", surname=" + surname +
					", email=" + email + ", phone=" + phone+"]";
	}
}
