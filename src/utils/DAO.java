package utils;


import java.sql.*;

public class DAO {
  private Connection connection;
  private Statement statement;

  private String user = "movieT";
  private String password = "123456";

  public DAO() throws Exception {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection("jdbc:mysql://localhost/movieT?user=" + user +
            "&password=" + password);
    statement = connection.createStatement();
  }

  public ResultSet executeSQL(String query) throws SQLException {
    return statement.executeQuery(query);
  }

  public void disconnectBD() throws SQLException {
    statement.close();
    connection.close();
  }
}
