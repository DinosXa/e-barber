package login_classes;

public class Booking {
	private int bkid;
	private String day;
	private String time;
	private String service;
	private int price;
	private CustomerUser cid;
	private BarbershopUser bid;

	//1st CONSTRUCTOR
	public Booking(int bkid, String day, String time, String service, int price, CustomerUser cid, BarbershopUser bid) {
		this.bkid = bkid;
		this.day = day;
		this.time = time;
		this.service = service;
		this.price = price;
		this.cid = cid;
		this.bid = bid;
	}
	//bkid
	public int getbkid() {
		return bkid;
	}
	public void setbkid(int bkid) {
		this.bkid = bkid;
	}
	//day
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}

	//time
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time= time;
	}

	//service
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}

	//price
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	//cid
	public CustomerUser getCustomer() {
		return cid;
	}
	public void setCustomer(CustomerUser cid) {
		this.cid = cid;
	}

	//bid
	public BarbershopUser getBarbershop() {
		return bid;
	}
	public void setBarbershop(BarbershopUser bid) {
		this.bid = bid;
	}
	@Override
	public String toString() {

		return "<ul>"
				+ "<li>book id= " + bkid + "</li>"
				+ "<li>day= " + day + "</li>"
				+ "<li>time= " + time + "</li>"
				+ "<li>service= " + service + "</li>"
				+ "<li>price= " + price + "</li>"
				+ "<li>customer id= " + cid + "</li>"
				+ "<li>barbershop id= " + bid + "</li>"
				+ "</ul>";
	}

}
