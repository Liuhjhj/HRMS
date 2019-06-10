package com;

import java.sql.*;

public class connect_database {
    private String username;
    private String password;
    private Connection connection;
    private ResultSet rs;
    private Statement statement;

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public boolean connect(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            String url="jdbc:mysql://10.1.11.210:3306/hrms?serverTimezone=UTC&useUnicode=true" +
                    "&characterEncoding=UTF-8&useSSL=false&allowPublicKeyRetrieval=true";
            connection = DriverManager.getConnection(url,username,password);
            return connection != null;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public void disconnect(){
        try {
            if (statement!=null)
                statement.close();
            if (rs != null)
                rs.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public ResultSet executeQuery(String sql){
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
        }
        return rs;
    }

    public boolean executeUpdate(String sql){
        try {
            statement = connection.createStatement();
            statement.executeUpdate(sql);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
