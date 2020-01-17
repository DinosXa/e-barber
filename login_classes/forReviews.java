
//t8170101 (για όλα)

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
						+ "(reviewID, comment, rating, datetime customerID, barbershopID) "
						+ "VALUES(?, ?, ?, ?, ?)";
		try{
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(reviewSQL);
			stmt.setInt(1, getrid());
			stmt.setString(2, rev.getReview());
			stmt.setInt(3, rev.getRating());
			stmt.setString(4, rev.getDatetime());
			stmt.setInt(5, rev.getCustomer().getCID());
			stmt.setInt(6, rev.getBarbershop().getBID());
			stmt.executeUpdate();
			stmt.close();
			db.close();
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
		String GSQL = "SELECT reviewID "
					+ "FROM reviews;";
		List<Review> users = new ArrayList<Review>();
		int lastRID = 0;
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GSQL);
			rs = stmt.executeQuery();

			int bigger = 0;
			while(rs.next()){
				if(rs.getInt(1) > bigger) bigger = rs.getInt(1);
				lastRID = bigger+1;
				System.out.println("element is: '" + rs.getInt(1) + "' and bigger is '" + bigger + "'"); //this is to see all the elements, when executing "main" (just for checking reasons)

			}
			System.out.println("lastRID is: " + lastRID);


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
								 rs.getString("reviews.datetime"),
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


public List<Review> getReviewsForCustomer(int cid) throws Exception, CustomException{
		Connection con = null;
		DB db = new DB();
		String GRSQL = "SELECT * "
					+  "FROM reviews "
					+  "LEFT JOIN barbershop ON barbershop.barbershopID=reviews.barbershopID "
					+  "LEFT JOIN customer ON customer.customerID=reviews.customerID "
					+  "LEFT JOIN area ON area.id = barbershop.area_id "
					+  "WHERE reviews.customerID = ? ;";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Review> reviews=  new ArrayList<Review>();
		Review rev = null;

		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GRSQL);
			stmt.setInt(1, cid);
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
								 rs.getString("reviews.datetime"),
								 cuser,
								 buser);

				reviews.add(rev);
			}
			rs.close();
			stmt.close();

			return reviews;
		} catch (Exception e) {
				throw new Exception("Error is: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

}