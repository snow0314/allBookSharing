<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="en">

<head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}
</style>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>

    <!-- Fontfaces CSS-->
    <link href="adminPage/css/font-face.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- Bootstrap CSS-->
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- Vendor CSS-->
    <link href="adminPage/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="adminPage/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="adminPage/css/theme.css" rel="stylesheet" media="all">

</head>

<body class="animsition">
    <div class="page-wrapper">


        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                    <img src="images/logo.jpg" alt="Cool Admin" style="height: 100%"; width="100%"/>
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="has-sub">
                            <a class="js-arrow" href="librarymain">
                                <i class="fas fa-tachometer-alt" ></i>Dashboard</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">

                            </ul>
                        </li>

                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-table"></i>도서관리</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="#" onclick="menuMove(1)">도서 목록</a>
                                </li>
                                <li>
                                    <a href="#" onclick="menuMove(2)">도서 등록</a>
                                </li>
                                <li>
                                    <a href="#" onclick="menuMove(13)">상호 대차</a>
                                </li>
                                

                            </ul>
                        </li>
							
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="far fa-check-square"></i>열람실 관리</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="#" onclick="menuMove(3)">열람실 목록</a>
                                </li>
                                <li>
                                    <a href="#" onclick="menuMove(4)">열람실 등록</a>
                                </li>
                                <li>
                                    <a href="#" onclick="menuMove(5)">열람실 좌석 관리</a>
                                </li>

                            </ul>
                        </li>

                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-calendar-alt"></i>도서관 관리</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="#" onclick="menuMove(6)">도서관 정보 수정</a>
                                </li>
                                <li>
                                    <a href="#" onclick="menuMove(7)">도서관 일정 관리</a>
                                </li>

                            </ul>
                        </li>

                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-chart-bar"></i>고객 관리</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="#" onclick="menuMove(8)">배송 관리</a>
                                </li>
                                <li>
                                    <a href="#" onclick="menuMove(9)">반납 관리</a>
                                </li>
                                <li>
                                    <a href="#" onclick="menuMove(11)">희망도서 관리</a>
                                </li>
                                <li>
                                    <a href="#" onclick="menuMove(12)">건의사항 관리</a>
                                </li>
                            </ul>
                        </li>




                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">

                            <div class="header-button">

                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="adminPage/images/icon/avatar-01.jpg" alt="John Doe" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#">${LB_NAME}</a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                        <img src="adminPage/images/icon/avatar-01.jpg" alt="John Doe" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#"><sec:authentication property="principal.username"/></a>
                                                    </h5>
                                                    <span class="email">johndoe@example.com</span>
                                                </div>
                                            </div>
                                            
                                            <div class="account-dropdown__footer">
                                             <a href="./"><i class="fas fa-igloo"></i>MainPage</a>
                                             </div>

                                            <div class="account-dropdown__footer">
                                                 <a id="logout" href="#" onclick="logoutGo()"> 
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                                    
                                                    
                                                    
        <form action="logout" name="logoutform" method="post">
        <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
        </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">

                        <div class="row" style="height: 1000px">
                            <div class="col-md-12" >
                                    <iframe id="contents" name="contents" width="100%" height="100%" src="images/people.jpg">
                                    
                                    </iframe>


                            </div>

                        </div>



                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="adminPage/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="adminPage/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="adminPage/vendor/slick/slick.min.js">
    </script>
    <script src="adminPage/vendor/wow/wow.min.js"></script>
    <script src="adminPage/vendor/animsition/animsition.min.js"></script>
    <script src="adminPage/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="adminPage/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="adminPage/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="adminPage/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="adminPage/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="adminPage/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="adminPage/vendor/select2/select2.min.js">
    </script>

<script type="text/javascript">
function logoutGo() {
	
	var logoutform=document.logoutform;
	logoutform.submit();
	
}
</script>


    <!-- Main JS-->
    <script src="adminPage/js/main.js"></script>

	<script type="text/javascript" src="js/librarianMove.js?ver2"></script>

</body></html>
<!-- end document-->
