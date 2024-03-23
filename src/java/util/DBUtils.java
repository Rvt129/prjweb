package util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {
    protected Connection connection;

    public Connection getConnection(){
        String serverName = "localhost";
     String dbName = "asm";
     String portNumber = "1433";
     String instance = "";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
     String userID = "sa";
     String password = "12345";
        String url;        
        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        } else{
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
        }
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Can not load JDBC Driver. Please check your pom file");
        }
        
        try {
            connection = DriverManager.getConnection(url, userID, password);
            return connection;
        } catch (SQLException ex) {
            System.out.println("Can not connect SQL Server. Reason: " + ex.getMessage());                        
            return null;
        }
        
    }
 

  
}