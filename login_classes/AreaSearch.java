package login_classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AreaSearch {
	public List<Areas> getAreas() throws Exception {
		Connection con = null;
		DB db = new DB();
		String GASQL = "SELECT * FROM area ;";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		con = db.getConnection(); //get Connection
		List<Areas> areas =  new ArrayList<Areas>();
		try {
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(GASQL);
			rs = stmt.executeQuery();
			while (rs.next()) {
				areas.add( new Areas(rs.getInt("id"), rs.getString("name")) );
			}
			rs.close();
			stmt.close();
			db.close();
			return areas; // return the list of areas
		} catch (Exception e) {
			throw new Exception("An error occured while getting areas from database: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

	//
	public Areas getAreaByID(int areaID) throws Exception, CustomException{
		Connection con = null;
		DB db = new DB();
		//the query
		String GABIDSQL = "SELECT * FROM area WHERE id=? ;";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Areas areas = null;
		try {
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(GABIDSQL);
			stmt.setInt(1, areaID);
			rs = stmt.executeQuery();
			if ( !rs.next() ) {
				throw new CustomException("Area not found.");
			}
			areas = new Areas(rs.getInt("id"), rs.getString("name"));
			rs.close();
			stmt.close();
			db.close();
			return areas;
		} catch (CustomException e) {
			throw new CustomException(e.getMessage());
		} catch (Exception e) {
				throw new Exception(e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}
}