package utils;


import java.sql.*;

public class DAO {
  private Connection connection;
  private Statement statement;

  private String user = "movieT";
  private String password = "123456";

  public DAO() {
	  
  }
  
  public void connect()  {

	    try {
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  connection = DriverManager.getConnection("jdbc:mysql://localhost/movieT", user, password);
  statement = connection.createStatement();
	    } catch (ClassNotFoundException e) { // 
	        System.out.println("Driver not found " + e);
	    } catch (SQLException e) {
	    	 System.out.println("Connect not possible" + e);
	    } catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  }

  public ResultSet executeSQL(String query) throws SQLException {
    return statement.executeQuery(query);
  }

  public int updateSQL(String query) throws SQLException {
    return statement.executeUpdate(query);
  }

  public void disconnectBD() throws SQLException {
    statement.close();
    connection.close();
  }
}
