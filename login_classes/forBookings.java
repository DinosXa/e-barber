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

public class forBookings {

	//POSTS THE REVIEW
	public void makeBooking(Booking booking) throws CustomException, Exception {
		Connection con = null;
		DB db = new DB();
		String bookSQL = "INSERT INTO booking "
						+"(bookID, day, time, service, price, customerID, barbershopID) "
						+"VALUES(?, ?, ?, ?, ?, ?, ?)";
		try{
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(bookSQL);
			stmt.setInt(1, getbkid());
			stmt.setString(2, booking.getDay());
			stmt.setString(3, booking.getTime());
			stmt.setString(4, booking.getService());
			stmt.setInt(5, booking.getPrice());
			stmt.setInt(6, booking.getCustomer().getCID());
			stmt.setInt(7, booking.getBarbershop().getBID());
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

	//FINDS AND SUMS THE BOOK ID
	public int getbkid()throws Exception{
		Connection con = null;
		DB db = new DB();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String BKSQL = "SELECT bookID "
					 + "FROM booking;";
		List<Booking> users = new ArrayList<Booking>();
		int lastBKID = 0;
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(BKSQL);
			rs = stmt.executeQuery();

			int bigger = 0;
			while(rs.next()){
				if(rs.getInt(1) > bigger) bigger = rs.getInt(1);
				lastBKID = bigger+1;
				System.out.println("element is: '" + rs.getInt(1) + "' and bigger is '" + bigger + "'"); //this is to see all the elements, when executing "main" (just for checking reasons)

			}
			System.out.println("lastBKID is: " + lastBKID);


			rs.close();
			stmt.close();
			db.close();
			return lastBKID;
		} catch(Exception e) {
			throw new Exception("An error occured while getting the book id from database. " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

	//GET BOOKINGS WITH BARBERSHOP ID
	public List<Booking> getBookings(int bid) throws Exception, CustomException{
		Connection con = null;
		DB db = new DB();
		String GBKSQL = "SELECT * "
					+  "FROM booking "
					+  "LEFT JOIN barbershop ON barbershop.barbershopID=booking.barbershopID "
					+  "LEFT JOIN customer ON customer.customerID=booking.customerID "
					+  "LEFT JOIN area ON area.id = barbershop.area_id "
					+  "WHERE booking.barbershopID = ? ;";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Booking> bookings=  new ArrayList<Booking>();
		Booking boo = null;

		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GBKSQL);
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

				boo = new Booking(rs.getInt("booking.bookID"),
								 rs.getString("booking.day"),
								 rs.getString("booking.time"),
								 rs.getString("booking.service"),
								 rs.getInt("booking.price"),
								 cuser,
								 buser);

				bookings.add(boo);
			}
			rs.close();
			stmt.close();

			return bookings;
		} catch (Exception e) {
				throw new Exception("Error is: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

	//GET BOOKINGS WITH BCUSTOMER ID
	public List<Booking> getBookingsForCustomer(int cid) throws Exception, CustomException{
		Connection con = null;
		DB db = new DB();
		String GBKSQL ="SELECT * "
					+  "FROM booking "
					+  "LEFT JOIN barbershop ON barbershop.barbershopID=booking.barbershopID "
					+  "LEFT JOIN customer ON customer.customerID=booking.customerID "
					+  "LEFT JOIN area ON area.id = barbershop.area_id "
					+  "WHERE booking.customerID = ? ;";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Booking> bookings=  new ArrayList<Booking>();
		Booking boo = null;

		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GBKSQL);
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

				boo = new Booking(rs.getInt("booking.bookID"),
								 rs.getString("booking.day"),
								 rs.getString("booking.time"),
								 rs.getString("booking.service"),
								 rs.getInt("booking.price"),
								 cuser,
								 buser);

				bookings.add(boo);
			}
			rs.close();
			stmt.close();

			return bookings;
		} catch (Exception e) {
				throw new Exception("Error is: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}


	//SET SERVICE AND GET PRICE
	public int getPrice(String service){
		int price = 0;
		if(service.equals("Under18-Haircut")){
			price=7;
		}else if(service.equals("Man-Haircut")){
			price=10;
		}else if(service.equals("Under18-Shaving")){
			price=5;
		}else if(service.equals("Man-Shaving")){
			price=7;
		}else if(service.equals("Under18-Trimming")){
			price=3;
		}else if(service.equals("Man-Trimming")){
			price=5;
		}else if(service.equals("Under18-HaircutAndShaving")){
			price=10;
		}else if(service.equals("Man-HaircutAndShaving")){
			price=14;
		}else if(service.equals("Under18-HaircutAndTriming")){
			price=8;
		}else{
			price=12;
		}
		return price;
	}
}