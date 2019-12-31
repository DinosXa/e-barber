package login_classes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

public class forReviews {

	//POSTS THE REVIEW
	public void writeReview(Review rev) throws CustomException, Exception {
		Connection con = null;
		DB db = new DB();
		String reviewSQL ="INSERT INTO reviews "
						+ "(reviewID, comment, rating, customerID, barbershopID) "
						+ "VALUES(?, ?, ?, ?, ?)";
		try{
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(reviewSQL);
			stmt.setInt(1, getrid());
			stmt.setString(2, rev.getReview());
			stmt.setInt(3, rev.getRating());
			stmt.setInt(4, rev.getCustomerid().getCID());
			stmt.setInt(5, rev.getBarbershopid().getBID());
			stmt.executeUpdate();
			stmt.close();
			db.close();
		} catch (SQLIntegrityConstraintViolationException  e) {
			throw new CustomException("Review id already exists.");
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

	//FINDS AND SUMS THE REVIEW ID
	public int getrid()throws Exception{
		Connection con = null;
		DB db = new DB();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// GBSQL = Get Barbers SQL
		String GSQL = "SELECT reviewID "
					+ "FROM reviews;";
		BarbershopUser user = null;
		List<Review> users = new ArrayList<Review>();
		int lastRID = 0;
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GSQL);
			rs = stmt.executeQuery();
			while(rs.next()){
				if(rs.isLast())
					lastRID = rs.getInt(1)+1;
			}
			rs.close();
			stmt.close();
			db.close();
			return lastRID;
		} catch(Exception e) {
			throw new Exception("An error occured while getting the review id from database. " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

	//STORING THE DATE OF THE REVIEW
	public String storeDate(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		date = new Date();
		return formatter.format(date);
	}

	//SHOWING THE REVIEWS OF THE BARBER
	/*public List<Review> getReview(int bid) throws Exception {
		Connection con = null;
		DB db = new DB();
		String GRSQL = "SELECT * "
					  +"FROM reviews "
					  +"WHERE reviews.barbershopID=? ;";
		ResultSet rs = null;
		PreparedStatement stmt = null;
		List<Review> reviews=  new ArrayList<Review>();
		UserDAO udao = null;
		BarbershopUser buser = null;
		CustomerUser cuser = null;
		Areas ar = null;
		Review rev = null;
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GRSQL);
			stmt.setInt(1, 1);
			rs = stmt.executeQuery();
			if(!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("No comments ");
			}
			while (rs.next()) {

				rev = new Review(rs.getInt("reviewID"),
								 rs.getString("comment"),
								 rs.getInt("rating"),
								 udao.getCustomerID(String.valueOf(2)),
								 udao.getBarbershopID(String.valueOf(1)));
				reviews.add(rev);
			}
			rs.close();
			stmt.close();
			db.close();
			return reviews;
		} catch (Exception e) {
			throw new Exception("An error occured while getting reviews from database: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}*/
	public List<Review> getReviews(int bid) throws Exception, CustomException{
		Connection con = null;
		DB db = new DB();
		String GRSQL = "SELECT * "
					+  "FROM reviews "
					+  "LEFT JOIN barbershop ON barbershop.barbershopID=reviews.barbershopID "
					+  "LEFT JOIN customer ON customer.customerID=reviews.customerID "
					+  "LEFT JOIN area ON area.id = barbershop.area_id "
					+  "WHERE reviews.barbershopID = ? ;";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Review> reviews=  new ArrayList<Review>();
		Review rev = null;

		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GRSQL);
			stmt.setInt(1, bid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				CustomerUser cuser = new CustomerUser( rs.getInt("customer.customerID"),
										  rs.getString("customer.username"),
										  rs.getString("customer.password"),
										  rs.getString("customer.name"),
										  rs.getString("customer.surname"),
										  rs.getString("customer.email"),
										  rs.getString("customer.phone") );

				Areas area = new Areas( rs.getInt("area.id"), rs.getString("area.name") );
				BarbershopUser buser = new BarbershopUser(rs.getInt("barbershop.barbershopID"),
														 rs.getString("barbershop.username"),
														 rs.getString("barbershop.password"),
														 rs.getString("barbershop.email"),
														 rs.getString("barbershop.phone"),
														 rs.getString("barbershop.address"),
														 area );

				rev = new Review(rs.getInt("reviews.reviewID"),
								 rs.getString("reviews.comment"),
								 rs.getInt("reviews.rating"),
								 cuser,
								 buser);

				reviews.add(rev);
			}
			rs.close();
			stmt.close();

			return reviews;
		} catch (Exception e) {
				throw new Exception("Error IS: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

}