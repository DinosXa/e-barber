
//t8170192 , t8170101 (για όλα)

package login_classes;

import java.text.Normalizer;
import java.util.regex.Pattern;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BarbershopUserService {

	//FIND AVAILABLE BARBERSHOPS IN THE SPECIFIC AREA
	public List<BarbershopUser> getBarbershops(int selection) throws Exception {
		Connection con = null;
		DB db = new DB();
		String GETBSQL = "SELECT * "
						+"FROM barbershop,area "
						+"WHERE barbershop.area_id = area.id "
						+"AND area.id=? ;";
		ResultSet rs = null;
		PreparedStatement stmt = null;
		List<BarbershopUser> barbershops=  new ArrayList<BarbershopUser>();
		Areas area = null;
		BarbershopUser bu = null;
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GETBSQL);
			stmt.setInt(1, selection);
			rs = stmt.executeQuery();
			while (rs.next()) {
				area = new Areas(rs.getInt("area.id"),
								 rs.getString("area.name") );
				bu = new BarbershopUser(rs.getInt("barbershop.barbershopID"),
										rs.getString("barbershop.username"),
										rs.getString("barbershop.password"),
										rs.getString("barbershop.email"),
										rs.getString("barbershop.phone"),
										rs.getString("barbershop.address"),
										area);
				barbershops.add(bu);
			}
			rs.close();
			stmt.close();
			db.close();
			return barbershops; // return the list of barbershops
		} catch (Exception e) {
			throw new Exception("An error occured while getting barbershops from database: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

	//GETS THE AREA ID AND RETURNS THE NAME OF THE AREA  ---AVAILABLE BARBERSHOPS---
	public String convertIntToArea(int num) throws Exception {
		Connection con = null;
		DB db = new DB();
		String GASQL ="SELECT * "
					+"FROM area;";
		ResultSet rs = null;
		PreparedStatement stmt = null;
		List<Areas> areas=  new ArrayList<Areas>();
		String name = null;;
		try{
			con = db.getConnection();
			stmt = con.prepareStatement(GASQL);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Areas ar = new Areas( rs.getInt("id"), rs.getString("name") );
				areas.add(ar);
			}
			rs.close();
			stmt.close();
			db.close();
			for(Areas ar: areas){
				if(num==ar.getId()){
					name = ar.getName();
				}
			}
			return name;
		} catch (Exception e) {
			throw new Exception("the msg is " +e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

	//CONVERT ACCENT CHARACTERS TO ENGLISH ---NOT YET USED---
	public String deAccent(String str) {
		String nfdNormalizedString = Normalizer.normalize(str, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(nfdNormalizedString).replaceAll("");
	}


	/***FINDS BY ID'S***/

	//FINDS BARBER BY BID
	public BarbershopUser findBarberByID(String id) throws Exception {
		Connection con = null;
		DB db = new DB();
		String FBSQL ="SELECT * FROM barbershop LEFT JOIN area "
					+ "ON barbershop.area_id = area.id "
					+ "WHERE barbershop.barbershopID=? ;";
		BarbershopUser user = null;
		try {
			// open connection and get Connection object
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(FBSQL);
			stmt.setString(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Areas ar = new Areas(rs.getInt("area.id"), rs.getString("area.name"));
				user = new BarbershopUser(rs.getInt("barbershop.barbershopID"),
										  rs.getString("barbershop.username"),
										  rs.getString("barbershop.password"),
										  rs.getString("barbershop.email"),
										  rs.getString("barbershop.phone"),
										  rs.getString("barbershop.address"),
										  ar);
			}
 			rs.close();
			stmt.close();
			return user;
		} catch (CustomException e) {
			throw new CustomException("fbbi Custom exception: " + e.getMessage());
		} catch (Exception e) {
			throw new Exception("fbbi Exception: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

	//FINDS CUSTOMER BY ID
	public CustomerUser findCustomerByID(int id) throws Exception, CustomException {
		Connection con = null;
		DB db = new DB();
		String GCSQL = "SELECT * FROM customer WHERE customerID=? ;";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		CustomerUser user = null;
		try {
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(GCSQL);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if ( !rs.next() ) {
				throw new CustomException("Customer not found.");
			}
			user = new CustomerUser(rs.getInt("customer.customerID"),
									rs.getString("customer.username"),
									rs.getString("customer.password"),
									rs.getString("customer.name"),
									rs.getString("customer.surname"),
									rs.getString("customer.email"),
									rs.getString("customer.phone"));
			rs.close();
			stmt.close();
			db.close();
			return user;
		} catch (CustomException e) {
			throw new CustomException("fcbi Custom exception 1: " + e.getMessage());
		} catch (Exception e) {
			throw new Exception("fcbi Exception 1: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}
}