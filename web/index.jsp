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


<%@include file="/WEB-INF/jspf/head.jspf" %>

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

    <table class="UsersAll">
        <tr>
            <th scope="col">id</th>
            <th scope="col">Last Name</th>
            <th scope="col">First Name</th>
        </tr>

    <%
        for (int i = 0; i < al.size(); i++) {
    %>
        <tr>
            <td><a href="#"><%=al.get(i).getPersonid()%></a></td>
            <td><p><%=al.get(i).getLname()%></p></td>
            <td><p><%=al.get(i).getFname()%></p></td>

        </tr>

    <%}%>
    </table>

</div>

<div class="UsersAttr">

    <p>User id</p>
    <input type="text" name="UseridAttr">
    <p>First Name</p>
    <input type="text" name="FNameAttr">
    <p>Last Name</p>
    <input type="text" name="LNameAttr">
    <p>Phone</p>
    <input type="text" name="Phone">
    <p>Email</p>
    <input type="text" name="Email">


</div>


<footer class="footer"> Дизайн Витченко Игорь</footer>


</body>
</html>