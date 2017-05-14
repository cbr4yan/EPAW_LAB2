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

    try {
      database = new DAO();
    } catch (Exception e) {
      System.out.println("Error en la creación de la conexión con la base de datos.");
    }
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    BeanUser user = new BeanUser();

    try {

      // Fill the bean with the request parmeters
      BeanUtils.populate(user, request.getParameterMap());

      if (user.isComplete()) {
        ResultSet resDB = database.executeSQL("INSERT INTO USER(username, password, email, name, surname, gender, birth, register)" +
                "VALUES (" + user.getUsername() + ", " + user.getPassword() + ", " + user.getName() + ", " + user.getSurname() + ", " + user.getGender() + ", " + user.getBirth() + ", ggg)");
      } else {
        // Put the bean into the request as an attribute
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
        dispatcher.forward(request, response);
      }
    } catch (IllegalAccessException | SQLException | InvocationTargetException e) {
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
