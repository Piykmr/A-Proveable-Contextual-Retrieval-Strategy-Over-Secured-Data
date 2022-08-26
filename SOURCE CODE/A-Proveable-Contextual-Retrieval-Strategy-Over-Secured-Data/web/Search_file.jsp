<%-- 
    Document   : index
    Created on : 7 Apr, 2021, 1:06:19 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="row mt-2">
                    <div class="col-6 tm-block-col">
                        <img src="img/verify.jpg" width="540" height="420" />
                    </div>
                    <div class="col-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <center><h1 class="tm-block-title">Search File</h1></center>
                            <form action="Search_action.jsp" method="post" class="tm-login-form">
                                <div class="form-group">
                                    <label>One-Time Secret Key (Expired in 5 minutes)</label>
                                    <input type="text" name="searchkey" class="form-control" placeholder="Enter Secret Key" required="required" />
                                </div>
                                <div class="form-group mt-4">
                                    <label>File Keyword</label>
                                    <input type="text" name="keyword" class="form-control" placeholder="Enter File Keyword" required="required" />
                                </div>
                                <div class="form-group mt-4">
                                    <button type="submit" class="btn btn-success text-uppercase">
                                        <i class="fas fa-search"></i>&nbsp;&nbsp;&nbsp;Search
                                    </button>
                                </div>
                            </form>
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

