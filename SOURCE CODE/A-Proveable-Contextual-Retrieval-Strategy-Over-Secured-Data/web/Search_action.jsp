<%-- 
    Document   : index
    Created on : 7 Apr, 2021, 1:06:19 PM
    Author     : JAVA-JP
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.*" %>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>A Proveable Contextual Retrieval Strategy Over Secured Data</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
    </head>
    <body id="reportsPage">
        <nav class="navbar navbar-expand-xl">
             <!-- <p style="color: whitesmoke; font-size: 25px; font-family: cursive" class="navbar-nav mx-auto"><b>A Proveable Contextual Retrieval Strategy Over Secured Data</b></p> -->
        </nav>
        <div class="" id="home">
            <div class="container mt-5">
                <nav class="navbar navbar-expand-xl">
                    <div class="container h-100">
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars tm-nav-icon"></i>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-inherit h-100">
                                <li class="nav-item">
                                    <a class="nav-link" href="DU_Home.jsp">
                                        <i class="fas fa-home"></i>
                                        Home
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Get_search_key.jsp">
                                        <i class="fas fa-key"></i>
                                        Search Key
                                    </a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="Search_file.jsp">
                                        <i class="fas fa-search"></i>
                                        Search File
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Requested_files.jsp">
                                        <i class="fas fa-file-signature"></i>
                                        Requested Files
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="downloaded_files.jsp">
                                        <i class="fas fa-download"></i>
                                        Downloaded Files
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">
                                        <i class="fas fa-lock"></i>
                                        Logout
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="row tm-content-row">
                    <div class="col-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                            <center><h2 class="tm-block-title">Request File</h2></center>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>FILE RANK</th>
                                        <th>DATA OWNER NAME</th>
                                        <th>DATA OWNER ID</th>
                                        <th>FILE ID</th>
                                        <th>FILE NAME</th>
                                        <th>UPLOADED TIME</th>
                                        <th>ACTION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String uid = (String) session.getAttribute("duid");

                                        Map<String, Integer> map = new HashMap();
                                        List<String> list = new ArrayList();
                                        List<String> keylist = new ArrayList();
                                        List<String> ranklist = new ArrayList();
                                        int rank = 0;
                                        List<String> fname = new ArrayList();
                                        String keyword = request.getParameter("keyword").toLowerCase();
                                        fname.add(keyword);

                                        keylist = Arrays.asList(keyword.split(" "));

                                        String token = request.getParameter("searchkey");
                                        Connection con = SQLconnection.getconnection();
                                        Statement st = con.createStatement();
                                        Statement st1 = con.createStatement();
                                        Statement st2 = con.createStatement();
                                        Statement st3 = con.createStatement();
                                        try {
                                            ResultSet rs1 = st1.executeQuery("SELECT * FROM searchkey where search_token = '" + token + "' AND uid = '" + uid + "' AND expire_time > now() ");
                                            if (rs1.next() != true) {
                                                response.sendRedirect("Search_file.jsp?Incorrect_Search_key");
                                            }

                                            for (String keyw : keylist) {
                                                ResultSet rt = st3.executeQuery("Select * from swords where words LIKE '%" + keyw + "%'");

                                                while (rt.next()) {
                                                    fname.add(rt.getString("topic"));
                                                }
                                            }
                                            Set<String> set = new HashSet(fname);

                                            fname.clear();
                                            fname.addAll(set);
                                            if (fname.isEmpty()) {
                                                response.sendRedirect("Search_file.jsp?No_File_Found");
                                            } else {
                                                System.out.println("Semantic Query = " + fname);
                                                for (String fn : fname) {
                                                    ResultSet rs = st.executeQuery("Select * from do_files where filename = '" + fn + "' OR filekeyword LIKE '%" + fn + "%' ");

                                                    while (rs.next()) {

                                                        rank++;

                                    %>
                                    <tr>
                                        <td><%=rank%></td>
                                        <td><%=rs.getString("doname")%></td>
                                        <td><%=rs.getString("doid")%></td>
                                        <td><%=rs.getString("id")%></td>
                                        <td><%=rs.getString("filename")%></td>
                                        <td><%=rs.getString("time")%></td>
                                        <td><a class="btn btn-success" href="user_request.jsp?fid=<%=rs.getString("id")%>">Request</a></td>
                                    </tr>
                                    <%                                        }
                                                }
                                            }

                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }

                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="tm-footer row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="text-center text-white mb-0 px-4 small">
                        &copy; <b>2022</b>
                    </p>
                </div>
            </footer>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/moment.min.js"></script>
        <!-- https://momentjs.com/ -->
        <script src="js/Chart.min.js"></script>
        <!-- http://www.chartjs.org/docs/latest/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script src="js/tooplate-scripts.js"></script>
        <script>
            Chart.defaults.global.defaultFontColor = 'white';
            let ctxLine,
                    ctxBar,
                    ctxPie,
                    optionsLine,
                    optionsBar,
                    optionsPie,
                    configLine,
                    configBar,
                    configPie,
                    lineChart;
            barChart, pieChart;
            // DOM is ready
            $(function () {
                drawLineChart(); // Line Chart
                drawBarChart(); // Bar Chart
                drawPieChart(); // Pie Chart

                $(window).resize(function () {
                    updateLineChart();
                    updateBarChart();
                });
            })
        </script>
    </body>

</html>

