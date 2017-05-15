package controllers;

import models.BeanUser;
import org.apache.commons.beanutils.BeanUtils;
import utils.DAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/FormController")
public class FormController extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private DAO database = null;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public FormController() {
    super();

    database = new DAO();
    database.connect();
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    BeanUser user = new BeanUser();

    
    try {
		
		// Fill the bean with the request parameters
		BeanUtils.populate(user, request.getParameterMap());
		
		if (user.isComplete()) {
			ResultSet userInfo  = database.executeSQL("SELECT username, email FROM USER WHERE username LIKE '" + user.getUsername() +"' OR email LIKE '" + user.getEmail() + "'");
			int rowcount = 0;
			if (userInfo.last()) {
				rowcount = userInfo.getRow();
				userInfo.beforeFirst();
			}
			
			// Existe alguna query con el mismo nombre de usuario o email.
			if (rowcount != 0) {
				
				request.setAttribute("user", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
				dispatcher.forward(request, response);
			}
			else {
	            SimpleDateFormat format = new SimpleDateFormat("MM-dd-yyyy");
	            java.util.Date utilDate = format.parse(user.getBirth());
	            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	            
	        	String query = "INSERT INTO USER(username, password, email, name, surname, gender, birth)" +
	                    "VALUES ('" + user.getUsername() + "', '" + user.getPassword() + "', '" + user.getEmail() + "' ,'" + user.getName() + "', '" + user.getSurname() + "', '" + user.getGender() + "', '"+sqlDate+"')";
	        	database.updateSQL(query);
	        	}
		}
		else {
			// Put the bean into the request as an attribute
			request.setAttribute("user", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
			dispatcher.forward(request, response);
		}
	}
	catch (IllegalAccessException | SQLException |ParseException| InvocationTargetException e) {
		e.printStackTrace();
	}
  

  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }

}
