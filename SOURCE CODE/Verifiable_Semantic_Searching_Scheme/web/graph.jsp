<%-- 
    Document   : index
    Created on : 7 Apr, 2021, 1:06:19 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
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
                                    <a class="nav-link" href="du_details.jsp">
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
                                    <a class="nav-link active" href="graph.jsp">
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
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <center><h1 class="tm-block-title">Analysis</h1></center>
                                <%
                                    String val1 = "", val2 = "", val3 = "";
                                    String val11 = "", val22 = "", val33 = "";
                                    int i = 0;

                                    try {
                                        Connection con = SQLconnection.getconnection();

                                        Statement st1 = con.createStatement();
                                        ResultSet rs2 = st1.executeQuery("SELECT  AVG(enc_time) FROM  do_files ");
                                        rs2.next();
                                        {
                                            val2 = rs2.getString("AVG(enc_time)");
                                        }
                                        rs2.close();
                                        Statement st2 = con.createStatement();
                                        ResultSet rs3 = st2.executeQuery("SELECT  AVG(decrypt_time) FROM  download ");
                                        rs3.next();
                                        {
                                            val3 = rs3.getString("AVG(decrypt_time)");
                                        }
                                        System.out.println("count------------------> " + val2);
                                        System.out.println("count------------------> " + val3);

                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                            <script type="text/javascript">
                                window.onload = function () {

                                    var chart = new CanvasJS.Chart("chartContainer", {
                                        animationEnabled: true,
                                        exportEnabled: true,
                                        theme: "light2", // "light1", "light2", "dark1", "dark2"
                                        title: {
                                            text: ""
                                        },
                                        axisY: {
                                            title: "Time in MS"
                                        },
                                        data: [{
                                                type: "column",
                                                showInLegend: true,
                                                legendMarkerColor: "grey",
                                                legendText: "Entities",
                                                dataPoints: [
                                                    {y: <%=val2%>, label: "Avg Encryption_Time in MS"},
                                                    {y: <%=val3%>, label: "Avg Decryption_Time in MS"}

                                                ]
                                            }]
                                    });
                                    chart.render();
                                }
                            </script>
                            <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
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

        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <!-- About us Skills Circle progress  -->
        <script>
                            // First circle
                            new Circlebar({
                                element: "#circle-1",
                                type: "progress",
                                maxValue: "90"
                            });

                            // Second circle
                            new Circlebar({
                                element: "#circle-2",
                                type: "progress",
                                maxValue: "84"
                            });

                            // Third circle
                            new Circlebar({
                                element: "#circle-3",
                                type: "progress",
                                maxValue: "60"
                            });

                            // Fourth circle
                            new Circlebar({
                                element: "#circle-4",
                                type: "progress",
                                maxValue: "74"
                            });

        </script>
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

