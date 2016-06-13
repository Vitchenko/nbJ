package DAO;

import Beans.Person;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by viv on 18.05.2016.
 */
public class OraCRUDPerson implements CRUDPerson {
    @Override
    public void createPerson(Statement stmt, Person Pr) throws SQLException {

        String strSql;

        strSql = "INSERT ALL INTO person (Person_id, Lname, Fname, Adress, Pole, Email) VALUES (Person_sc.NEXTVAL, '" +
                Pr.getLname() + "', '" + Pr.getFname() + "', '" + Pr.getAdress() + "'," + Pr.getPole() + ", '" + Pr.getEmail() + " ') " +
                "INTO phones (id, ph_number, person_id) VALUES (Phones_sc.NEXTVAL, '" + Pr.getPhone() + "', Person_sc.currval )"
                + " SELECT * FROM dual";

        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(strSql);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    public Person viewPerson(Statement stmt, int personid, String fname, String lname, String adress, String email, int pole, String phone) {
        return null;
    }

    @Override
    public void deletePerson(Statement stmt, int per_id) {

    }

    @Override
    public void updatePerson(Statement stmt, int per_id) {

    }

    @Override
    public ArrayList<Person> viewAllPerson(Statement stmt) throws SQLException {

        Person per = new Person();
        ArrayList<Person> PerList=new ArrayList<>();;
        String strSql;
        ResultSet rs = null;

        strSql = "SELECT Pr.PERSON_ID, Pr.LNAME, Pr.Fname, Pr.Adress, Pr.Pole, Pr.Email, Ph.ph_number Phone FROM Person Pr, Phones Ph" +
                " where Pr.person_id = Ph.PERSON_ID ORDER BY LNAME";

        int i = 0;
        try {
            rs = stmt.executeQuery(strSql);

            while (rs.next()) {

                per=new Person();

                per.setPersonid(rs.getInt("person_id"));
                per.setFname(rs.getString("Fname"));
                per.setLname(rs.getString("Lname"));
                per.setEmail(rs.getString("Email"));
                per.setAdress(rs.getString("Adress"));
                per.setPhone(rs.getString("Phone"));
                per.setPole(rs.getInt("Pole"));

                PerList.add(per);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        rs.close();
        return PerList;
    }

    @Override
    public ArrayList<Person> viewPersonLet(Statement stmt, String let) {

        Person per = new Person();
        ArrayList<Person> PerList=new ArrayList<>();;
        String strSql;
        ResultSet rs = null;

        strSql = "SELECT Pr.PERSON_ID, Pr.LNAME, Pr.Fname, Pr.Adress, Pr.Pole, Pr.Email, Ph.ph_number Phone FROM Person Pr, Phones Ph " +
                "where Pr.person_id = Ph.PERSON_ID AND UPPER(Pr.LName) like UPPER('"+let+"%') ORDER BY LNAME";

        int i = 0;
        try {
            rs = stmt.executeQuery(strSql);

            while (rs.next()) {

                per=new Person();

                per.setPersonid(rs.getInt("person_id"));
                per.setFname(rs.getString("Fname"));
                per.setLname(rs.getString("Lname"));
                per.setEmail(rs.getString("Email"));
                per.setAdress(rs.getString("Adress"));
                per.setPhone(rs.getString("Phone"));
                per.setPole(rs.getInt("Pole"));

                PerList.add(per);
            }

            rs.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return PerList;

    }


}

