<%-- 
    Document   : AccessRequest
    Created on : Sep 20, 2020, 5:17:36 AM
    Author     : Lenovo
--%>

<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String topic = request.getParameter("topic");
    String sword1 = request.getParameter("sword1");
    String sword2 = request.getParameter("sword2");
    String sword3 = request.getParameter("sword3");
    String swords = sword1+" "+sword2+" "+sword3;
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    try {
        int i = st.executeUpdate("insert into swords(topic,words)values('" + topic + "','" + swords + "')");
        if (i != 0) {
            response.sendRedirect("add_swords.jsp?Query_added");

        } else {
            response.sendRedirect("add_swords.jsp?Failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
