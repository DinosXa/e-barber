package login_classes;

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

		}
	}
}
/*
public int convertAreaToInt(String area) throws Exception {
		int id = 0;

			if(area.equals("il"))id=1;
			else if(area.equals("Κολωνάκι-Λυκαβητός"))id=2;
			else if(area.equals("Κολωνός"))id=3;
			else if(area.equals("Κουκάκι"))id=4;
			else if(area.equals("Κυψέλη"))id=5;
			else if(area.equals("Καλλιμάρμαρο-Μετς"))id=6;
			else if(area.equals("Μοναστηράκι"))id=7;
			else if(area.equals("Νέα Σμύρνη"))id=8;
			else if(area.equals("Νέος Κόσμος"))id=9;
			else if(area.equals("Παγκράτι"))id=10;
			else if(area.equals("’νω Πατήσια"))id=11;
			else if(area.equals("Κάτω Πατήσια"))id=12;
			else if(area.equals("Πετράλωνα"))id=13;
			else if(area.equals("Πολύγωνο"))id=14;
			else if(area.equals("Σεπόλια"))id=15;
			else id=0;

			return id;

	}
}*/