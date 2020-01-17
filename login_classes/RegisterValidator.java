package login_classes;

public class RegisterValidator {

	public boolean isValidEmailAddress(String email) {

		//Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);

        return m.matches();
	}

	public boolean isValidPhoneNumber(String phone) {
		// Rules:
		// 1) Starts with 21 or 22 or 69
        // 2) Then contains 8 digits (10 digits total).
		String ePattern = "^(21|22|69)[0-9]{8}";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(phone);

		return m.matches();

	}

	//GET AREA ID
	public Areas getValidatedArea(String areaId) throws Exception {
		int id;
		if( areaId == null || areaId.equals("") ) {
			throw new Exception("Please choose an area");
		}
		try {
			id = Integer.parseInt(areaId);
		} catch (NumberFormatException e) {
			throw new Exception("bad area id: " + e.getMessage());
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
			throw new Exception("the area id is: " + e.getMessage() ); //An error occurred
		}
	}

}