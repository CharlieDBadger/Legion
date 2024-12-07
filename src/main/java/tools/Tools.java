package tools;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Tools {

	public static Date convertStringToDate(String dateString) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		return sdf.parse(dateString);
	}

	public static String convertDateToString(Date dateString){
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(dateString);
	}
	
	public static String convertDateToStringList(Date dateString){
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		
		return sdf.format(dateString);
	}
	
	

}
