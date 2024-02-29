package config;

import java.sql.*;
import javax.swing.JOptionPane;

public class koneksi {
    public Connection con;
    public Statement stat;
    
    private static final String DATABASE_NAME = "lelang_usk";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
   
    public koneksi(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/"+DATABASE_NAME,USERNAME,PASSWORD);
            stat = con.createStatement();
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, e.getMessage());
            System.exit(0);
        }
    }
}
