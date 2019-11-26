package login_classes;

import java.util.ArrayList;
import java.util.List;

/**
 * UserDAO provides all the necessary methods related to user's.
 * In further lessons we will change all the code of the body of the methods and use
 * JDBC API in order to connect the the database and store/retrieve users etc.
 *
 * @author sofos@aueb.gr
 *
 */
public class BarbershopUserDAO {

	/**
	 * This method returns a List with all Users
	 *
	 * @return List<BarbershopUser>
	 */
	public List<BarbershopUser> getUsers() {

		List<BarbershopUser> users = new ArrayList<BarbershopUser>();

		// adding some users for the sake of the example
		users.add(new BarbershopUser("John", "Macken", "barber1@somewhere.com", "jmacken", "1111"));
		users.add(new BarbershopUser("Jim", "Coll", "customer1@somewhere.com", "jcoll",  "1111"));

		return users;

	} //End of getUsers

	/**
	 * Search user by username
	 *
	 * @param username, String
	 * @return User, the User object
	 * @throws Exception, if user not found
	 */
	public BarbershopUser findUser(String username) throws Exception {

		List<BarbershopUser> users = getUsers();

		for (BarbershopUser user : users) {

			if ( user.getUsername().equals(username) ) {
				return user;
			}

		}

		throw new Exception("User with username: " + username + " does not exist");

	} //End of findUser

	/**
	 * This method is used to authenticate a user.
	 *
	 * @param username, String
	 * @param password, String
	 * @return User, the User object that represents the authenticated user.
	 * @throws Exception, if the credentials are not valid
	 */
	public BarbershopUser authenticate(String username, String password) throws Exception {

		List<BarbershopUser> users = getUsers();

		for (BarbershopUser user : users) {

			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				return user; // credentials are valid, so return the User object
			}

		}
		//credentials are Wrong, so throw an error
		throw new Exception("Wrong username or password");

	} //End of authenticate

} //End of class
