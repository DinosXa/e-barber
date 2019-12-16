package login_classes;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class UserDAO {
	/*
	 * This method returns a List with all Barbershop Users
	 */
	public List<BarbershopUser> get�Users() throws Exception{
		Connection con = null;
		DB db = new DB();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String GSQL;// GBSQL = Get Barbers SQL
		GSQL = "SELECT * "
			 + "FROM barbershop;";

		BarbershopUser user = null;
		List<BarbershopUser> users = new ArrayList<BarbershopUser>();
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GSQL);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Areas ar = new Areas( rs.getInt("id"), rs.getString("name") );
				users.add( new BarbershopUser(rs.getString("bid"),
											  rs.getString("username"),
											  rs.getString("password"),
											  rs.getString("email"),
											  rs.getString("phone"),
											  rs.getString("address"),
											  ar));
			}

			rs.close();
			stmt.close();
			db.close();

			return users;

		} catch(Exception e) {

			throw new Exception("An error occured while getting users from database" + e.getMessage());

		} finally {

			if(con != null)
				con.close();
		}

	} //End of getBUsers

	/*
	 * This method returns a List with all Customer Users
	 */
	public List<CustomerUser> getCUsers() throws Exception{
		Connection con = null;
		DB db = new DB();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String GSQL;// GBSQL = Get Barbers SQL
		GSQL = "SELECT * "
			 + "FROM customer;";

		CustomerUser user = null;
		List<CustomerUser> users = new ArrayList<CustomerUser>();
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GSQL);
			rs = stmt.executeQuery();

			while (rs.next()) {
				users.add( new CustomerUser(rs.getString("cid"),
											rs.getString("username"),
											rs.getString("password"),
											rs.getString("name"),
											rs.getString("surname"),
											rs.getString("email"),
											rs.getString("phone")));
			}

			rs.close();
			stmt.close();
			db.close();

			return users;

		} catch(Exception e) {

			throw new Exception("An error occured while getting users from database" + e.getMessage());

		} finally {

			if(con != null)
				con.close();
		}

	} //End of getCUsers


	public BarbershopUser authenticateBU(String username, String password) throws Exception {
		DB db = new DB();
		Connection con = null;
		String AUSQL = "SELECT *"
					  +" FROM barbershop"
					  +" WHERE username=? AND password=? ;";
	  	PreparedStatement stmt = null;
	   	ResultSet rs =null;
	   	BarbershopUser user = null;

	   	try {
			con = db.getConnection();

		  	stmt = con.prepareStatement(AUSQL);

		  	stmt.setString(1, username);
			stmt.setString(2, password);

		   	rs = stmt.executeQuery();

		   	if(!rs.next()) {
				rs.close();
			   	stmt.close();
			   	db.close();

			   	throw new Exception("Wrong username or password.");
		   	}
			Areas ar = new Areas( rs.getInt("id"), rs.getString("name") );
			user = new BarbershopUser(rs.getString("bid"),
									  rs.getString("username"),
									  rs.getString("password"),
									  rs.getString("email"),
									  rs.getString("phone"),
									  rs.getString("address"),
									  ar);

			rs.close();
			stmt.close();
			db.close();

			return user;

			} catch (Exception e) {

				throw new Exception("User may not exist.");

			} finally {

				if(con != null)
					con.close();
			}
		} //End of authenticate

	public CustomerUser authenticateCU(String username, String password) throws Exception {
			DB db = new DB();
			Connection con = null;
			String AUSQL = "SELECT *"
						  +" FROM customer"
						  +" WHERE username=? AND password=? ;";
			PreparedStatement stmt = null;
			ResultSet rs =null;
			CustomerUser user = null;

			try {
				con = db.getConnection();
				stmt = con.prepareStatement(AUSQL);

				stmt.setString(1, username);
				stmt.setString(2, password);

				rs = stmt.executeQuery();

				if(!rs.next()) {
					rs.close();
					stmt.close();
					db.close();

					throw new Exception("Wrong username or password.");
				}
				user = new CustomerUser(rs.getString("cid"),
										rs.getString("username"),
										rs.getString("password"),
										rs.getString("name"),
										rs.getString("surname"),
										rs.getString("email"),
										rs.getString("phone"));

				rs.close();
				stmt.close();
				db.close();

				return user;

				} catch (Exception e) {

					throw new Exception("User may not exist.");

				} finally {

					if(con != null)
						con.close();
				}
			} //End of authenticate





	public void registerBUser(BarbershopUser buser) throws CustomException, Exception {
		Connection con = null;
		DB db = new DB();
		String INSQL = "INSERT INTO barbershop"
				 	 + " (barbershopID, username, password, email, phone, address, area_id)"
					 + " VALUES (?, ?, ?, ?, ?, ?, ?);";
		try {

			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(INSQL);

			stmt.setString(1, buser.getBID());
			stmt.setString(2, buser.getUsername());
			stmt.setString(3, buser.getPassword());
			stmt.setString(4, buser.getEmail());
			stmt.setString(5, buser.getPhone());
			stmt.setString(6, buser.getAddress());
			stmt.setInt(7, buser.getArea().getId());

	   		stmt.executeUpdate();

	   		stmt.close();
	   		db.close();

		} catch (SQLIntegrityConstraintViolationException e) {

			throw new CustomException("This email is already registered");

		} catch (SQLException e) {

			throw new Exception(e.getMessage());

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			if(con != null)
				con.close();
		}
	}//end of register

	public void registerCUser(CustomerUser user) throws CustomException, Exception {
		Connection con = null;
		DB db = new DB();
		String	INSQL = "INSERT INTO customer"
				  	  + " (customerID, username, password, name, surname, email, phone)"
				 	  + " VALUES (?, ?, ?, ?, ?, ?, ?);";
		try {

			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(INSQL);

			stmt.setString(1, user.getCID());
			stmt.setString(2, user.getUsername());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getName());
			stmt.setString(5, user.getSurname());
			stmt.setString(6, user.getEmail());
			stmt.setString(7, user.getPhone());

	   		stmt.executeUpdate();

	   		stmt.close();
	   		db.close();

		} catch (SQLIntegrityConstraintViolationException e) {

			throw new CustomException("This email is already registered.");

		} catch (SQLException e) {

			throw new Exception(e.getMessage());

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			if(con != null)
				con.close();
		}
	}//end of register



	public Areas getValidatedArea(String areaId) throws Exception {

		int id;
		if( areaId == null || areaId.equals("") ) {
			throw new Exception("Please choose an area");
		}
		try {
			id = Integer.parseInt(areaId);
		} catch (NumberFormatException e) {
			throw new Exception("Bad area id");
		}

		AreaSearch ar = new AreaSearch();
		Areas area= null;

		try {
			area = ar.getAreaByID( id );
			if( area != null ) {
				return area; //is valid.
			}
			return null; //area id is not valid.
		} catch (Exception e) {
			throw new Exception( e.getMessage() ); //An error occurred
		}
	}

} //End of class