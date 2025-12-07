package com.cms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    // === EDIT THESE for your environment ===
    private static final String URL = "jdbc:mysql://localhost:3306/cms?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "root";
    // =======================================

    /**
     * Returns a fresh DB connection. Caller is responsible for closing it.
     */
    public static Connection getConn() {
        Connection con = null;
        try {
            // load driver (optional on modern JVMs but safe)
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Failed to get DB connection.");
            e.printStackTrace();
        }
        return con;
    }
}
