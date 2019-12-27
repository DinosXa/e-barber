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
			con = db.getConnection(); //get Connection
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

	//Get an id and find the area with that id
	public String convertIntToArea(int num) throws Exception {
		Connection con = null;
		DB db = new DB();
		String GETA ="SELECT * "
					+"FROM area;";
		ResultSet rs = null;
		PreparedStatement stmt = null;
		List<Areas> areas=  new ArrayList<Areas>();
		String name = null;;

		try{
			con = db.getConnection();
			stmt = con.prepareStatement(GETA);
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

	//Convert accent characters to english
	public String deAccent(String str) {
		String nfdNormalizedString = Normalizer.normalize(str, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(nfdNormalizedString).replaceAll("");
	}

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

 			rs.close(); //closing ResultSet
			stmt.close(); //closing PreparedStatement

			return user;

		} catch (Exception e) {

			throw new Exception("Error while searching barber: " + e.getMessage());

		} finally {

			if(con != null) // if connection is still open, then close.
				con.close();

		}

	} //End of findBarberByID
}