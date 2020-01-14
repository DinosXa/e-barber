package login_classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class main{
	public static void main(String args[]){

		try{
			UserDAO ud = new UserDAO();
			forReviews fr = new forReviews();
			forBookings fb = new forBookings();
			ud.sumbid();
			ud.sumcid();
			fb.getbkid();
			fr.getrid();
		}catch(Exception e){

		}
	}
}