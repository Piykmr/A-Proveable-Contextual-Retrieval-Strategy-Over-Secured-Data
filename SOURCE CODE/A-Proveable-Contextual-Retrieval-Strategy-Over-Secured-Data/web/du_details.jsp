<%-- 
    Document   : index
    Created on : 7 Apr, 2021, 1:06:19 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
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
                                    <a class="nav-link" href="Cloud_Home.jsp">
                                        <i class="fas fa-home"></i>
                                        Home
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Cloud_files.jsp">
                                        <i class="fas fa-list"></i>
                                        Cloud Files
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="do_details.jsp">
                                        <i class="fas fa-layer-group"></i>
                                        Data Owners
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="du_details.jsp">
                                        <i class="far fa-user"></i>
                                        Data Users
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="downloaded_files2.jsp">
                                        <i class="fas fa-download"></i>
                                        Downloaded Files
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="add_swords.jsp">
                                        <i class="fas fa-tasks"></i>
                                        Add Semantic Query
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="view_swords.jsp">
                                        <i class="fas fa-clipboard-list"></i>
                                        View Semantic Queries
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="graph.jsp">
                                        <i class="fas fa-chart-bar"></i>
                                        Graph
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
                            <center><h2 class="tm-block-title">Data User Details</h2></center>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">USER ID</th>
                                        <th scope="col">USER NAME</th>
                                        <th scope="col">EMAIL</th>
                                        <th scope="col">PHONE NO</th>
                                        <th scope="col">ADDRESS</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Connection con = SQLconnection.getconnection();
                                        Statement st = con.createStatement();
                                        try {
                                            ResultSet rs = st.executeQuery("SELECT * FROM du_reg ");
                                            while (rs.next()) {
                                    %>
                                    <tr>
                                        <td><%=rs.getString("id")%></td>
                                        <td><%=rs.getString("name")%></td>
                                        <td><%=rs.getString("email")%></td>
                                        <td><%=rs.getString("phone")%></td>
                                        <td><%=rs.getString("address")%></td>
                                    </tr>
                                    <%                                        }
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

