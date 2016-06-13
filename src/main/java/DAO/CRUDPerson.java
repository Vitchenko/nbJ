package DAO;

import Beans.Person;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public interface CRUDPerson {
//interface for operation from SUBD;


    void createPerson(Statement stmt, Person Pr) throws SQLException;

    Person viewPerson(Statement stmt, int personid, String fname, String lname, String adress, String email, int pole, String phone);

    void deletePerson(Statement stmt, int personid);

    void updatePerson(Statement stmt, int personid);

    ArrayList<Person> viewAllPerson(Statement stmt) throws SQLException;

    ArrayList<Person> viewPersonLet(Statement stmt, String let); //All person for firts-letter in LastName

}


//generation 1000 rows
//    for (int i = 0; i < 1000; i++) {
//        pr.setLname("testLastName" + i);
//        pr.setFname("testFastName" + i);
//        pr.setAdress("testAdress2" + i);
//        pr.setEmail("test@test.ua2" + i);
//        pr.setPhone("+380678794" + i);
//        if ((i % 2) == 0) {
//            pr.setPole(1);
//        } else {
//            pr.setPole(2);
//        }
//
//        OraCRUDPerson OraCRUD = new OraCRUDPerson();
//        OraCRUD.createPerson(stmt, pr);
//    }

//generation 1000 rows
