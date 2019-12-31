package login_classes;

public class Review {
	private int rid;
	private String review;
	private int rating;
	private CustomerUser cid;
	private BarbershopUser bid;

	//1st CONSTRUCTOR
	public Review(int rid, String review, int rating, CustomerUser cid, BarbershopUser bid) {
		this.rid = rid;
		this.review = review;
		this.rating = rating;
		this.cid = cid;
		this.bid = bid;
	}

	public int getrid() {
		return rid;
	}
	public void setrid(int rid) {
		this.rid = rid;
	}

	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}

	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}

	public CustomerUser getCustomer() {
		return cid;
	}
	public void setCustomer(CustomerUser cid) {
		this.cid = cid;
	}

	public BarbershopUser getBarbershop() {
		return bid;
	}
	public void setBarbershop(BarbershopUser bid) {
		this.bid = bid;
	}
	@Override
	public String toString() {

		return "<ul>"
				+ "<li>review id= " + rid + "</li>"
				+ "<li>review= " + review + "</li>"
				+ "<li>rating= " + rating + "</li>"
				+ "<li>customer id= " + cid + "</li>"
				+ "<li>barbershop id= " + bid + "</li>"
				+ "</ul>";
	}

}
