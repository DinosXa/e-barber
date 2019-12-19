package login_classes;

public class CustomException extends Exception {

	public CustomException(String message) {
        super("custom exception: " + message);
    }

}