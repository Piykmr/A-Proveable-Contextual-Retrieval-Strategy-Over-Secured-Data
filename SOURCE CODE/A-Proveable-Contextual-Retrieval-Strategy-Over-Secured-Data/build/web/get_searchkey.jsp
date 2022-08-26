<%-- 
    Document   : get_token
    Created on : 9 Jan, 2021, 6:45:23 PM
    Author     : JAVA-JP
--%>

<%@page import="Networks.Mail"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uid = request.getParameter("id");
    String uname = request.getParameter("name");
    String umail = request.getParameter("email");

    System.out.println("Check User uid And uname : " + uid + uname);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    Statement sto = con.createStatement();
    Statement st2 = con.createStatement();
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);
    int min = 5;

    try {
        ResultSet rs = st.executeQuery("SELECT * FROM searchkey where uid='" + uid + "'");
        if (rs.next() == true) {

            Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 5;
            String letters = "0123456789";
            String token = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                token += letters.substring(index, index + 1);
            }
            String Search_token = "F" + token;

            int i = st1.executeUpdate("update searchkey set search_token='" + Search_token + "',approve_time=NOW(),expire_time=(SELECT ADDTIME(NOW(), '00:" + min + ":0.000000')) WHERE uid = '" + uid + "'");

            String msggg = "User Name : " + uname + " \nYour File Search Token : " + Search_token + "\nThis Token Valid For " + min + " Minutes from now";
            Mail ma = new Mail();
            ma.secretMail(msggg, "Search_token", umail);
            String msg = "File Search Token:" + msggg;
            System.out.println("success");

            response.sendRedirect("Get_search_key.jsp?Success");
        } else {

            Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 5;
            String letters = "0123456789";
            String token = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                token += letters.substring(index, index + 1);
            }
            String Search_token = "F" + token;

            int i = sto.executeUpdate("insert into searchkey(uid, uname, time , status , search_token, approve_time, expire_time)values('" + uid + "', '" + uname + "', '" + time + "', 'Approved', '" + Search_token + "',now(),'waiting')");
            int k = st2.executeUpdate("update searchkey set expire_time=(SELECT ADDTIME(NOW(), '00:" + min + ":0.000000')) WHERE uid = '" + uid + "'");
            if (i != 0) {

                String msggg = "User Name : " + uname + " \n Your File Search Token : " + Search_token + "\nThis Token Valid For " + min + " Minutes from now";
                Mail ma = new Mail();
                ma.secretMail(msggg, "Search_token", umail);
                String msg = "File Search Token:" + msggg;
                System.out.println("success");
                response.sendRedirect("Get_search_key.jsp?Success");
            } else {
                response.sendRedirect("Get_search_key.jsp?Failed");
            }
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>