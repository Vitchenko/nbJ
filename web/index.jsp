<%@ page import="Beans.Person" %>
<%@ page import="DAO.OraDatabaseConnect" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DAO.OraCRUDPerson" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: viv
  Date: 11.06.2016
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notebook</title>
    <link href="index.css" rel="stylesheet" type="text/css">
</head>


<body>

<div class="header">

    <form action="/login" method="post">
        Search for:
        <select name="serchCriter">
            <option value="LName" selected>Last Name</option>
            <option value="FName">First Name</option>
            <option value="Phone">Phone</option>
            <option value="EMail">Email</option>
            <option value="Adress">Adress</option>
        </select>
        <input type="text" name="search">
    </form>

</div>


<div class="alp_container">

    <div class="alphabet"><input type="submit" value="A" id="A"></div>
    <div class="alphabet"><input type="submit" value="B" id="B"></div>
    <div class="alphabet"><input type="submit" value="C" id="C"></div>
    <div class="alphabet"><input type="submit" value="D" id="D"></div>
    <div class="alphabet"><input type="submit" value="E" id="E"></div>
    <div class="alphabet"><input type="submit" value="F" id="F"></div>
    <div class="alphabet"><input type="submit" value="G" id="G"></div>
    <div class="alphabet"><input type="submit" value="H" id="H"></div>
    <div class="alphabet"><input type="submit" value="I" id="I"></div>
    <div class="alphabet"><input type="submit" value="J" id="J"></div>
    <div class="alphabet"><input type="submit" value="K" id="K"></div>
    <div class="alphabet"><input type="submit" value="L" id="L"></div>
    <div class="alphabet"><input type="submit" value="M" id="M"></div>
    <div class="alphabet"><input type="submit" value="N" id="N"></div>
    <div class="alphabet"><input type="submit" value="O" id="O"></div>
    <div class="alphabet"><input type="submit" value="P" id="P"></div>
    <div class="alphabet"><input type="submit" value="Q" id="Q"></div>
    <div class="alphabet"><input type="submit" value="R" id="R"></div>
    <div class="alphabet"><input type="submit" value="S" id="S"></div>
    <div class="alphabet"><input type="submit" value="T" id="T"></div>
    <div class="alphabet"><input type="submit" value="U" id="U"></div>
    <div class="alphabet"><input type="submit" value="V" id="V"></div>
    <div class="alphabet"><input type="submit" value="W" id="W"></div>
    <div class="alphabet"><input type="submit" value="X" id="X"></div>
    <div class="alphabet"><input type="submit" value="Y" id="Y"></div>
    <div class="alphabet"><input type="submit" value="Z" id="Z"></div>
</div>


<div class="UsersAll">


    <%
        Person pr = new Person();
        OraDatabaseConnect ord = new OraDatabaseConnect();
        Statement stmt = null;
        stmt = ord.connectDb();

        OraCRUDPerson OraCRUD = new OraCRUDPerson();
        ArrayList<Person> al = new ArrayList<Person>();

        //al=OraCRUD.viewAllPerson(stmt);
        al = OraCRUD.viewPersonLet(stmt, "w");
    %>

    <h4>Список:</h4>

    <%
        for (int i = 0; i < al.size(); i++) {
    %>

    <li><a href="#">
        <%=i + " " + al.get(i).getLname() + " " + al.get(i).getFname() + " " + al.get(i).getEmail() + " " +
                al.get(i).getAdress() + " " + al.get(i).getPhone()%>
    </a></li>

    <%}%>

</div>

<div class="UsersAttr">
    <h4>Список телефонов:</h4>

    <%
        for (int i = 0; i < al.size(); i++) {
    %>

    <li><a href="#">
        <%=i + " " + al.get(i).getPhone() + " " + al.get(i).getEmail()%>
    </a></li>

    <%}%>
</div>


<footer class="footer"> Дизайн Витченко Игорь</footer>


</body>
</html>