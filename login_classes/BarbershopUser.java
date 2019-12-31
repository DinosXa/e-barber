package login_classes;

public class BarbershopUser {

	private int bid; //barbershop_id
	private String username;
	private String password;
	private String email;
	private String phone;
	private String address;
	private Areas area;
	private boolean isbarber; //false=customer | true=barber

	/**
	 * Constructor
	 */
	public BarbershopUser(int bid, String username, String password, String email, String phone, String address, Areas area) {
		this.bid = bid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.area= area;
		this.isbarber = true;
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

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public Areas getArea() {
		return area;
	}
	public void setArea(Areas area) {
		this.area = area;
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

	public int getBID() {
		return bid;
	}
	public void setBID(int bid){
		this.bid = bid;
	}

	public boolean getifBarber() {
		return isbarber;
	}
	public void setifBarber(boolean isbarber) {
		this.isbarber = isbarber;
	}

	@Override
	public String toString() {
		return "Users [ barbershop_id =" + bid + "username=" + username + ", password=" + password +
					", address=" + address + ", area=" + area +
					", email=" + email + ", phone=" + phone +"]";
	}

} //End of class
