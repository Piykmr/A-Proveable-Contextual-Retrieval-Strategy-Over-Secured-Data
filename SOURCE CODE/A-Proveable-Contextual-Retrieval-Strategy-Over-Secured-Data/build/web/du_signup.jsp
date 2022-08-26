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
                                    <a class="nav-link" href="index.jsp">
                                        <i class="fas fa-home"></i>
                                        Home
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="DO_login.jsp">
                                        <i class="fas fa-layer-group"></i>
                                        Data Owner
                                    </a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="DU_login.jsp">
                                        <i class="far fa-user"></i>
                                        Data User
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Cloud_login.jsp">
                                        <i class="fas fa-cloud"></i>
                                        Cloud
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="row tm-content-row">
                    <div class="tm-block-col tm-col-account-settings">
                        <div class="tm-bg-primary-dark tm-block tm-block-settings">
                             <center><h1 class="tm-block-title">Data User Register</h1></center>
                            <form action="du_reg" method="post" class="tm-signup-form row">
                                <div class="form-group col-lg-6">
                                    <label>Name</label>
                                    <input type="text" name="username" class="form-control" placeholder="Enter Your Name" required="required" />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>Email</label>
                                    <input type="email" name="email" class="form-control" placeholder="Enter Your Email" required="required" />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>Phone No</label>
                                    <input type="text" name="phone" class="form-control" placeholder="Enter Your Phone No" required="required" />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>Address</label>
                                    <input type="text" name="address" class="form-control" placeholder="Enter Your Address" required="required" />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>Password</label>
                                    <input type="password" name="pass" class="form-control" placeholder="Enter Your Password" required="required" />
                               </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-success btn-block text-uppercase">
                                        Sign Up
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="tm-block-col tm-col-avatar">
                        <div class="tm-bg-primary-dark tm-block tm-block-avatar">
                            <div class="tm-avatar-container">
                                <img src="img/register.jpg" width="350" height="500"/>
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

