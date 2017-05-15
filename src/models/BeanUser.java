package models;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@SuppressWarnings("unused")
public class BeanUser implements Serializable  {

	private static final long serialVersionUID = 1L;

	private String username = "";
	private String password = "";
	private String confirm_password = "";
	private String email = "";
	private String dob_day = "";
	private String dob_month = "";
	private String dob_year = "";
	private String name = "";
	private String surname = "";
	private String gender = "";

	/*  Control which parameters have been correctly filled */
	private int[] error = {0,0};

	public String getConfirm_password() {
		return confirm_password;
	}

	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}

	/* Getters */

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public String getDob_day() {
		return dob_day;
	}

	public String getDob_month() {
		return dob_month;
	}

	public String getDob_year() {
		return dob_year;
	}

	public String getName() {
		return name.isEmpty() ? null : name;
	}

	public String getSurname() {
		return surname.isEmpty() ? null : surname;
	}

	public String getGender() {
		return gender.isEmpty() ? null : gender;
	}

	public String getBirth()  {
		
		return dob_year + "-" + dob_month + "-" + dob_day;
	}

	public int[] getError() {
		return error;
	}

	/*Setters*/
	public void setUsername(String username) {
		this.username = username;
		error[0] = 1;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setEmail(String email) {
		this.email = email;
		error[1] = 1;
	}

	public void setDob_day(String dob_day) {
		this.dob_day = dob_day;
	}

	public void setDob_month(String dob_month) {
		this.dob_month = dob_month;
	}

	public void setDob_year(String dob_year) {
		this.dob_year = dob_year;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}



	//public void setUser(String user){

		//System.out.println("Filling user field");
		/* We simulate a user with the same unsername exists in our DB */
		//error[0] = 1;

	//}

	/*public void setMail(String mail){
		System.out.println("Filling mail field");
		this.mail = mail;
	}*/

	
	/* Logic Functions */
	
	/*Check if all the fields are filled correctly */
	public boolean isComplete() {
	    return(hasValue(getUsername()) &&
	           hasValue(getEmail()));
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
}
