package login_classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 *
 * @author sofos@aueb.gr
 *
 */
public class BarbershopUserService {

	public List<BarbershopUser> getBarbershops() throws Exception {

		Connection con = null;
		DB db = new DB();

		String GETBSQL = "SELECT * FROM barbershop LEFT JOIN area "
				+ " ON barbershop.area_id = area.id "
				+ " WHERE barbershop.area_id=? ;";
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = db.getConnection(); //get Connection

		List<BarbershopUser> barbershops=  new ArrayList<BarbershopUser>();
		BarbershopUser bu = null;
		Areas area = null;
		try {

			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(GETBSQL);

			stmt.setInt(1, bu.getArea().getId());

			rs = stmt.executeQuery();

			while (rs.next()) {

				area = new Areas(rs.getInt("area.id"),
									   rs.getString("area.name") );

				barbershops.add(new BarbershopUser(  rs.getInt("barbershop.bid"),
											rs.getString("barbershop.username"),
											rs.getString("barbershop.password"),
											rs.getString("barbershop.email"),
											rs.getString("barbershop.phone"),
											rs.getString("barbershop.address"),
											area));
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
}//End of getBarbershopsbyArea




