
//t8170101 („È· ¸Î·)

package login_classes;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class UserDAO {

	/***THE RETURNS***/

	//RETURN ALL BARBERS
	public List<BarbershopUser> get¬Users() throws Exception{
		Connection con = null;
		DB db = new DB();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String GSQL;// GBSQL = Get Barbers SQL
		GSQL = "SELECT * "
			 + "FROM barbershop;";
		List<BarbershopUser> users = new ArrayList<BarbershopUser>();
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GSQL);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Areas ar = new Areas( rs.getInt("id"), rs.getString("name") );
				users.add( new BarbershopUser(rs.getInt("barbershopID"),
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
	}

	//RETURN ALL CUSTOMERS
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
				users.add( new CustomerUser(rs.getInt("cid"),
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
	}


	/***THE AUTHENTICATIONS***/

	//AUTHENTICATE BARBER
	public BarbershopUser authenticateBU(String username, String password) throws Exception {
		DB db = new DB();
		Connection con = null;
		String AUSQL = "SELECT * "
					  +"FROM barbershop "
					  +"LEFT JOIN area ON barbershop.area_id=area.id "
					  +"WHERE barbershop.username=? AND barbershop.password=? ;";
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

			   	throw new Exception("Wrong username or password. ");
		   	}
			Areas ar = new Areas( rs.getInt("area.id"), rs.getString("area.name") );
			user = new BarbershopUser(rs.getInt("barbershop.barbershopID"),
									  rs.getString("barbershop.username"),
									  rs.getString("barbershop.password"),
									  rs.getString("barbershop.email"),
									  rs.getString("barbershop.phone"),
									  rs.getString("barbershop.address"),
									  ar);

			rs.close();
			stmt.close();
			db.close();

			return user;

			} catch (Exception e) {

				throw new Exception(e.getMessage() + "You may need to switch the box 'I am a barber'");

			} finally {

				if(con != null)
					con.close();
			}
		}

	//AUTHENTICATE CUSTOMER
	public CustomerUser authenticateCU(String username, String password) throws Exception {
			DB db = new DB();
			Connection con = null;
			String AUSQL = "SELECT * "
						  +"FROM customer "
						  +"WHERE username=? AND password=? ;";
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
					throw new Exception("Wrong username or password. ");
				}
				user = new CustomerUser(rs.getInt("customerID"),
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
					throw new Exception(e.getMessage() + "You may need to switch the box 'I am a barber'");
				} finally {
					if(con != null)
						con.close();
				}
			}

	/***REGISTERS USERS***/

	//REGISTER BARBERS
	public void registerBUser(BarbershopUser user) throws CustomException, Exception {
		Connection con = null;
		DB db = new DB();
		String INSQL = "INSERT INTO barbershop "
				 	 + " (barbershopID, username, password, email, phone, address, area_id) "
					 + " VALUES (?, ?, ?, ?, ?, ?, ?);";
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(INSQL);
			stmt.setInt(1, sumbid());
			stmt.setString(2, user.getUsername());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getEmail());
			stmt.setString(5, user.getPhone());
			stmt.setString(6, user.getAddress());
			stmt.setInt(7, user.getArea().getId());
	   		stmt.executeUpdate();
	   		stmt.close();
	   		db.close();
		} catch (SQLIntegrityConstraintViolationException e) {
			throw new CustomException(e.getMessage());
		} catch (SQLException e) {
			throw new Exception("1st error: " + e.getMessage());
		} catch (Exception e) {
			throw new Exception("2nd error: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

	//REGISTER CUSTOMER
	public void registerCUser(CustomerUser user) throws CustomException, Exception {
		Connection con = null;
		DB db = new DB();
		String	INSQL = "INSERT INTO customer "
				  	  + " (customerID, username, password, name, surname, email, phone) "
				 	  + " VALUES (?, ?, ?, ?, ?, ?, ?);";
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(INSQL);
			stmt.setInt(1, sumcid());
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
			throw new CustomException(e.getMessage());
		} catch (SQLException e) {
			throw new Exception("The 1st error is: " + e.getMessage());
		} catch (Exception e) {
			throw new Exception("The 2nd error is: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}


	//FIND FINAL BARBER & CUSTOMER ID's AND ADD ONE

	//ADD CUSTOMER ID
	public int sumcid()throws Exception{
		Connection con = null;
		DB db = new DB();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// GBSQL = Get Barbers SQL
		String GSQL = "SELECT customerID "
					+ "FROM customer;";

		BarbershopUser user = null;
		List<CustomerUser> users = new ArrayList<CustomerUser>();
		int lastCID = 0;
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GSQL);
			rs = stmt.executeQuery();

			int bigger = 0;
			while(rs.next()){
				if(rs.getInt(1) > bigger) bigger = rs.getInt(1);
				lastCID = bigger+1;
				System.out.println("element is: '" + rs.getInt(1) + "' and bigger is '" + bigger + "'"); //this is to see all the elements, when executing "main" (just for checking reasons)

			}
			System.out.println("lastCID is: " + lastCID);


			rs.close();
			stmt.close();
			db.close();

			return lastCID;

		} catch(Exception e) {

			throw new Exception("An error occured while getting the customer id from database. " + e.getMessage());

		} finally {

			if(con != null)
				con.close();
		}
	}

	//ADD BARBERSHOP ID
	public int sumbid()throws Exception{
		Connection con = null;
		DB db = new DB();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// GBSQL = Get Barbers SQL
		String GSQL = "SELECT barbershopID "
					+ "FROM barbershop;";
		BarbershopUser user = null;
		List<BarbershopUser> users = new ArrayList<BarbershopUser>();
		int lastBID = 0;
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(GSQL);
			rs = stmt.executeQuery();

			int bigger = 0;
			while(rs.next()){
				if(rs.getInt(1) > bigger) bigger = rs.getInt(1);
				lastBID = bigger+1;
				System.out.println("element is: '" + rs.getInt(1) + "' and bigger is '" + bigger + "'"); //this is to see all the elements, when executing "main" (just for checking reasons)

			}
			System.out.println("lastBID is: " + lastBID);

			rs.close();
			stmt.close();
			db.close();
			return lastBID;
		} catch(Exception e) {
			throw new Exception("An error occured while getting the barbershop id from database. " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}


	//GET CUSTOMER & BARBER ID's WITH THEIR TYPES

	//GET CUSTOMER ID
	public CustomerUser getCustomerID(String customerId) throws Exception {
		int id;
		if( customerId == null || customerId.equals("") ) {
			throw new Exception("You do not have an id");
		}
		try {
			id = Integer.parseInt(customerId);
		} catch (NumberFormatException e) {
			throw new Exception("Bad customer id");
		}
		BarbershopUserService bus = new BarbershopUserService();
		CustomerUser customer = null;
		try {
			customer = bus.findCustomerByID( id );
			if( customer != null ) {
				return customer; //is valid.
			}
			return null;
		} catch (Exception e) {
			throw new Exception("Error GET CUST BY ID: "+e.getMessage() ); //An error occurred
		}
	}

	//GET BARBERSHOP ID
	public BarbershopUser getBarbershopID(String barbershopId) throws Exception {
		int id;
		if( barbershopId == null || barbershopId.equals("") ) {
			throw new Exception("You do not have an id");
		}
		try {
			id = Integer.parseInt(barbershopId);
		} catch (NumberFormatException e) {
			throw new Exception("Bad customer id");
		}
		BarbershopUserService bus = new BarbershopUserService();
		BarbershopUser barbershop = null;
		try {
			barbershop = bus.findBarberByID(barbershopId);
			if( barbershop != null ) {
				return barbershop; //is valid.
			}
			return null;
		} catch (Exception e) {
			throw new Exception("GET BARBER BY ID ERROR: " + e.getMessage() ); //An error occurred
		}
	}

		//8170107//
		public void changePasswordBU(String username, String password, String new_password) throws Exception {
			DB db = new DB();
			Connection con = null;
			String CPSQL = "update barbershop set password=? where username =?;";
		  	PreparedStatement stmt = null;

		   	try {
				con = db.getConnection();
			  	stmt = con.prepareStatement(CPSQL);
			  	stmt.setString(1, new_password);
			  	stmt.setString(2, username);
				if (checkPasswordBU(username, password))
              	  stmt.executeUpdate();
              	else
              	  throw new Exception ("Wrong password");

				stmt.close();
				db.close();

				} catch (Exception e) {

					throw new Exception(e.getMessage() + "An exception occured while updating your password");

				} finally {

					if(con != null)
						con.close();
				}
			}

		//8170107//
		public void changePasswordCU(String username, String password, String new_password) throws Exception {
						DB db = new DB();
						Connection con = null;
						String CPSQL = "update customer set password=? where username =?;";
					  	PreparedStatement stmt = null;

					   	try {
							con = db.getConnection();
						  	stmt = con.prepareStatement(CPSQL);
						  	stmt.setString(1, new_password);
						  	stmt.setString(2, username);
							if (checkPasswordCU(username,password))
			              	  stmt.executeUpdate();
			              	else
			              	  throw new Exception ("Wrong password");

							stmt.close();
							db.close();

							} catch (Exception e) {

								throw new Exception(e.getMessage() + "An exception occured while updating your password");

							} finally {

								if(con != null)
									con.close();
							}
				}





				//8170107//
				public boolean checkPasswordCU (String username, String old_password) throws Exception {
					DB db = new DB();
					Connection con = null;
					PreparedStatement stmt1 = null;
					String confirmSQL= "SELECT password FROM customer WHERE username = ? ;";
					boolean correct = false;
					ResultSet rs = null;
					try{
						con= db.getConnection();
						stmt1= con.prepareStatement(confirmSQL);
						stmt1.setString(1,username);
						rs = stmt1.executeQuery();
						if (rs.next()){
							if (rs.getString("password").equals(old_password))
								correct=true;
							else
								correct= false;
						}else{
							throw new Exception ("User not found");
						}
					db.close();
					rs.close();
					stmt1.close();
					return correct;
				}catch(SQLException e){
					throw new Exception("An error occured in DB" +e.getMessage());
				}finally{
					if(con!=null)
						con.close();
				}
			}

			//8170107//
			public boolean checkPasswordBU (String username, String old_password) throws Exception {
					DB db = new DB();
					Connection con = null;
					PreparedStatement stmt1 = null;
					String confirmSQL= "SELECT password FROM barbershop WHERE username = ? ;";
					boolean correct = false;
					ResultSet rs = null;
					try{
						con= db.getConnection();
						stmt1= con.prepareStatement(confirmSQL);
						stmt1.setString(1,username);
						rs = stmt1.executeQuery();
						if (rs.next()){
							if (rs.getString("password").equals(old_password))
								correct=true;
							else
								correct= false;
						}else{
							throw new Exception ("User not found");
						}
					db.close();
					rs.close();
					stmt1.close();
					return correct;
				}catch(SQLException e){
					throw new Exception("An error occured in DB" +e.getMessage());
				}finally{
					if(con!=null)
						con.close();
				}
			}



}

