/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import DAO.DBConnection;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import model.Employee;

/**
 *
 * @author Mr Loi Ho
 */
public class EmployeeImp {

    public static Employee searchEmp(String id) throws SQLException {

        List<Employee> emps = DBConnection.getAllEmps();
        Employee emp = emps.get(0);
        for (Employee empTemp : emps) {
            if (empTemp.getId().equals(id)) {
                emp = empTemp;
                return emp;
            }
        }
        return emp;
    }

//    public static void main(String[] args) throws SQLException, UnsupportedEncodingException {
//        System.out.println(searchEmp("010101").toString());
//        PrintStream out = new PrintStream(System.out, true, "UTF-8");
//        out.println(searchEmp("10000").toString());
//    }
}
