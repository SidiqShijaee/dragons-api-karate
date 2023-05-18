package api.data;

import java.util.Random;

public class GenerateData {
	public static String getEmail() {
		String email = "Javagenerated";
		int randomNumber = (int) (Math.random() * 10000);
		String provider = "@tekschool.us";
		String autoEmail = email + randomNumber + provider;
		return autoEmail;
	}

}
	