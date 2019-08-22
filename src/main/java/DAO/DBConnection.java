/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Employee;

/**
 *
 * @author Mr Loi Ho
 */
public class DBConnection {

    static Connection conn = null;

    public static void connect() throws SQLException {
        if (conn == null || conn.isClosed()) {
            try {
                System.out.println("Connecting database...");
                Class.forName(DBInfos.JDBC_DRIVER);
            } catch (ClassNotFoundException e) {
                System.out.println(e.toString());
            }
        }
        conn = DriverManager.getConnection(DBInfos.DB_URL,
                DBInfos.USER, DBInfos.PASSWORD);
    }

    public static void disconnect() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }

    public static boolean insertEmp(Employee emp) throws SQLException {
        String sql = "insert into employee(id,name,email) values (?,?,?)";
        connect();

        PreparedStatement state = conn.prepareStatement(sql);
        state.setString(1, emp.getId());
        state.setString(2, emp.getName());
        state.setString((3), emp.getEmail());

        boolean rowInserted = state.executeUpdate() > 0;
        state.close();
        disconnect();
        return rowInserted;
    }

    public static List<Employee> getAllEmps() throws SQLException {
        List<Employee> emps = new ArrayList<>();
        try {
            connect();
            Statement state = null;
            state = conn.createStatement();

            String sql = "Select * from employee";
            ResultSet rs = state.executeQuery(sql);

            //Step5: Extract data from result set
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setId(rs.getString("id"));
                emp.setName(rs.getString("name"));
                emp.setEmail(rs.getString("email"));

                emps.add(emp);
            }
            rs.close();
            state.close();
            conn.close();
            disconnect();
        } catch (SQLException e) {
            System.out.println(e.toString());
            conn.close();
        }
        return emps;
    }

    public static boolean deleteEmp(Employee emp) throws SQLException {
        String sql = "delete from employee where id = ?";
        connect();
        PreparedStatement state = conn.prepareStatement(sql);
        state.setString(1, emp.getId());

        boolean rowDel = state.executeUpdate() > 0;
        state.close();
        disconnect();
        return rowDel;
    }

    public static boolean updateEmp(Employee emp) throws SQLException {
        String sql = "Update employee set name=?, email=? where id=?";
        connect();
        PreparedStatement state = conn.prepareStatement(sql);
        state.setString(1, emp.getName());
        state.setString(2, emp.getEmail());
        state.setString(3, emp.getId());

        boolean rowUpdated = state.executeUpdate() > 0;
        state.close();
        disconnect();
        return rowUpdated;
    }

    public static Employee getEmp(String id) throws SQLException {
        Employee emp = new Employee();
        String sql = "select * from employee where id=?";
        connect();
        PreparedStatement state = conn.prepareStatement(sql);
        state.setString(1, id);
        ResultSet rs = state.executeQuery(sql);
        if (rs.next()) {
            emp.setId(rs.getString("id"));
            emp.setName(rs.getString("name"));
            emp.setEmail(rs.getString("email"));
        }
        rs.close();
        state.close();
        disconnect();
        return emp;
    }

//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        List<Employee> emps = getAllEmps();
//        for (Employee emp : emps) {
//            System.out.println("Id: " + emp.getId() + "  Name:" + emp.getName()
//                    + "   email:" + emp.getEmail());
//        }
//    }
}
