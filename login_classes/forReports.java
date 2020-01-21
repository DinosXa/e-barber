
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

public class forReports {

	//POSTS THE REVIEW
	public void sendReport(Report rep) throws CustomException, Exception {
		Connection con = null;
		DB db = new DB();
		String reportSQL ="INSERT INTO reports "
						+ "(reportID, subject, report, barbershopID) "
						+ "VALUES(?, ?, ?, ?)";
		try{
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(reportSQL);
			stmt.setInt(1, getrpid());
			stmt.setString(2, rep.getSubject());
			stmt.setString(3, rep.getReport());
			stmt.setInt(4, rep.getBarbershop().getBID());
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
	public int getrpid()throws Exception{
		Connection con = null;
		DB db = new DB();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String GSQL = "SELECT reportID "
					+ "FROM reports;";
		int lastRPID = 0;
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GSQL);
			rs = stmt.executeQuery();

			int bigger = 0;

			while(rs.next()){
				if(rs.getInt(1) > bigger) bigger = rs.getInt(1);
				lastRPID = bigger+1;
				System.out.println("element is: '" + rs.getInt(1) + "' and bigger is '" + bigger + "'"); //this is to see all the elements, when executing "main" (just for checking reasons)
			}
			System.out.println("lastRPID is: " + lastRPID);


			rs.close();
			stmt.close();
			db.close();
			return lastRPID;
		} catch(Exception e) {
			throw new Exception("An error occured while getting the review id from database. " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}
}