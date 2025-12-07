package com.cms.dao;


import com.cms.dao.DBConnect;
import java.sql.Connection;

public class TestDB {
    public static void main(String[] args) {
        Connection c = DBConnect.getConn();
        System.out.println("Connection: " + c);
        try {
            if (c != null && !c.isClosed()) {
                System.out.println("DB connection successful!");
                c.close();
            } else {
                System.out.println("DB connection failed or was null.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
