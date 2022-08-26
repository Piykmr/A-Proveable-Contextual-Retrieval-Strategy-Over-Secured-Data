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
                                <li class="nav-item">
                                    <a class="nav-link" href="Search_file.jsp">
                                        <i class="fas fa-search"></i>
                                        Search File
                                    </a>
                                </li>
                                <li class="nav-item active">
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
                <div class="container tm-mt-big tm-mb-big">
                    <div class="row">
                        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                                <div class="row">
                                    <div class="col-12">
                                        <center><h2 class="tm-block-title d-inline-block">Download File</h2></center>
                                    </div>
                                </div>
                                <div class="row tm-edit-product-row">
                                    <div class="col-xl-12 col-lg-12 col-md-12">
                                        <%
                                            String uid = (String) session.getAttribute("duid");
                                            String fid = request.getParameter("fid");
                                            String time = request.getParameter("time");
                                            String dkey = request.getParameter("dkey");
                                            System.out.println("File ID : " + fid);
                                            Connection con = SQLconnection.getconnection();
                                            Statement st = con.createStatement();
                                            Statement st1 = con.createStatement();
                                            Statement st2 = con.createStatement();
                                            String file = null;
                                            try {

                                                ResultSet rs1 = st1.executeQuery("Select * from request where uid = '" + uid + "' AND fid = '" + fid + "' AND time ='" + time + "' AND dkey = '" + dkey + "' ");
                                                if (rs1.next() == true) {
                                                    ResultSet rs = st.executeQuery("Select * from do_files where id = '" + fid + "'");
                                                    if (rs.next()) {
                                        %>
                                        <form action="download" method="post" class="tm-edit-product-form">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <input type="hidden" value="<%=fid%>" name="fid">
                                                    <input type="hidden" value="<%=dkey%>" name="dkey">
                                                    <label>File Name :</label>
                                                    <input type="text" name="filename" readonly="" style="color: black;" value="<%=rs.getString("filename")%>" class="form-control" />
                                                </div>
                                                <div class="form-group">
                                                    <label>File Content :</label>
                                                    <textarea readonly="" name="data" class="form-control" style="height:170px; resize: none; color: black;"><%=rs.getString("data")%></textarea><br><br>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-info btn-block text-uppercase"><i class="fas fa-download"></i>&nbsp;Download</button>
                                            </div>
                                        </form>
                                        <%           }
                                                } else {
                                                    response.sendRedirect("Requested_files.jsp?Incorrect_key_values");
                                                }

                                            } catch (Exception ex) {
                                                ex.printStackTrace();
                                            }

                                        %>
                                    </div>
                                </div>
                            </div>
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

