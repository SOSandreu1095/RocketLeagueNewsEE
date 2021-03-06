<%-- 
    Document   : index
    Created on : 12-feb-2018, 10:06:22
    Author     : Andreu
--%>

<%@page import="com.rocket.entities.News"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% List<News> news = (List<News>) request.getAttribute("firstNews");%>

<!DOCTYPE html>
<html>

    <head>
        <title>Rocket League News</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="icon" href="img/icons/ico.ico" type="image/x-icon" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/js.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
            <% for (int i = 0; i < news.size(); i++) {%>
                listIdNews.push("<%=news.get(i).getId()%>");
            <%}%>
            });
        </script>


        <link rel="stylesheet" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Aldrich" rel="stylesheet">

        <script src="js/jquery.toast.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery.toast.min.css" />

        <meta property="og:site_name" content="Rocket League News">
        <meta property="og:url" content="https://rawgit.com/SOSandreu1095/WebNoticias/master/index.html">
        <meta property="og:title" content="Rocket League News">
        <meta property="og:description" content="All the news of Rocket League here!">
    </head>

    <body>

        <div id="divCargando">
            <div>
                <div>
                    <img id="imgLoad" src="img/icons/loading.gif" alt="Gif Loading">
                </div>
            </div>
        </div>

        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v2.9";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>

        <div id="jumb" class="jumbotron text-center">
            <h1>ROCKET LEAGUE NEWS</h1>
        </div>

        <nav id="mybar" class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand active" href="./"><span class="glyphicon glyphicon-home"></span></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="#"><a href="#">Competitive</a></li>
                        <li><a href="#">Community</a></li>
                        <li><a href="#">Workshop</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Patches<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#" class="dr">Patch 1.34</a></li>
                                <li><a href="#" class="dr">Patch 1.33</a></li>
                                <li><a href="#" class="dr">Patch 1.32</a></li>
                                <li><a href="#" class="dr">Patch 1.31</a></li>
                                <li><a href="#" class="dr">Patch 1.30</a></li>
                            </ul>
                        </li>
                        <li class="#"><a href="./createnew.html">Create New</a></li>
                    </ul>
                    <form class="navbar-form navbar-right" id="search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </nav>

        <div id="mainC">
            <div id="publicidad">
                <a href="publ.html"><img id="pubV" class="img-responsive center-block" src="img/ads/1h.jpg" alt="pub ver img"></a>
                <a href="publ.html">
                    <picture>
                        <source srcset="img/ads/1m.png" media="(min-width: 650px)">
                        <source srcset="img/ads/2m.png" media="(min-width: 500px)">
                        <source srcset="img/ads/3m.png" media="(min-width: 400px)">

                        <img id="pubH" class="img-responsive center-block" src="img/ads/4m.png" alt="pub hor img">
                    </picture>
                </a>
                <iframe id="fbTime" src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FRocketLeague%2F&tabs=timeline&width=300&height=800&small_header=false&adapt_container_width=false&hide_cover=false&show_facepile=false&appId"
                        width="300" height="800" style="border:none;overflow:hidden"></iframe>
            </div>
            <div id="noticias" class="container-fluid">
                <div id="notSlider">
                    <h2 id="titleCars" class="text-center">NEW CARS INCOMMING</h2>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img class="img-responsive center-block" src="img/cars/endo.jpg" alt="endo img">
                            </div>

                            <div class="item">
                                <img class="img-responsive center-block" src="img/cars/after.jpg" alt="after img">
                            </div>

                            <div class="item">
                                <img class="img-responsive center-block" src="img/cars/gt.jpg" alt="gt img">
                            </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

                <!-- NEWS HERE -->
                <div class="row">
                    <div class="col col-sm-6">
                        <a href="news/<%=news.get(0).getSlug()%>">
                            <h3 class="notTitle"><%=news.get(0).getTitle()%></h3>
                            <h5 class="date"><%=news.get(0).getDate()%></h5>
                            <div class="not img-rounded">
                                <img class="img-responsive center-block" src="img/uploads/<%=news.get(0).getId()%>.png" alt="image New">
                                <p class="desc">
                                    <%=news.get(0).getDescription()%>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="col col-sm-6">
                        <a href="news/<%=news.get(1).getSlug()%>">
                            <h3 class="notTitle"><%=news.get(1).getTitle()%></h3>
                            <h5 class="date"><%=news.get(1).getDate()%></h5>
                            <div class="not img-rounded">
                                <img class="img-responsive center-block" src="img/uploads/<%=news.get(1).getId()%>.png" alt="image New">
                                <p class="desc">
                                    <%=news.get(1).getDescription()%>
                                </p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col col-sm-6">
                        <a href="news/<%=news.get(2).getSlug()%>">
                            <h3 class="notTitle"><%=news.get(2).getTitle()%></h3>
                            <h5 class="date"><%=news.get(2).getDate()%></h5>
                            <div class="not img-rounded">
                                <img class="img-responsive center-block" src="img/uploads/<%=news.get(2).getId()%>.png" alt="image New">
                                <p class="desc">
                                    <%=news.get(2).getDescription()%>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="col col-sm-6">
                        <a href="news/<%=news.get(3).getSlug()%>">
                            <h3 class="notTitle"><%=news.get(3).getTitle()%></h3>
                            <h5 class="date"><%=news.get(3).getDate()%></h5>
                            <div class="not img-rounded">
                                <img class="img-responsive center-block" src="img/uploads/<%=news.get(3).getId()%>.png" alt="image ">
                                <p class="desc">
                                    <%=news.get(3).getDescription()%>
                                </p>
                            </div>
                        </a>
                    </div>
                </div>

                <div id="notCargar">

                </div>
                <button type="button" id="btnLoad" class="btn btn-info btn-block">CHARGE MORE NEWS</button>
            </div>


        </div>



        <div class="footer">

            <ul class="icons">
                <li id="fb">
                    <a href="https://www.facebook.com/RocketLeague/"><img class="img-responsive center-block" src="img/icons/facebook.png" alt="fb logo" /></a>
                </li>
                <li id="tw">
                    <a href="https://twitter.com/rocketleague?lang=es"><img class="img-responsive center-block" src="img/icons/twitter.png" alt="tw logo" /></a>
                </li>
                <li id="yb">
                    <a href="https://www.youtube.com/user/RocketLeagueGame"><img class="img-responsive center-block" src="img/icons/youtube.png" alt="yb logo" /></a>
                </li>
                <li id="gg">
                    <a href="https://plus.google.com/communities/100086543914019394793"><img class="img-responsive center-block" src="img/icons/google.png" alt="gg logo" /></a>
                </li>
            </ul>

            <ul class="about">
                <li>DESIGNER: Andreu Juan Ferrá</li>
                <li>DEVELOPED: Andreu Juan Ferrá</li>
                <li>BASED ON the oficial game Rocket League</li>
                <li>Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com"
                                                                                                       title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"
                                                                                                       title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></li>
            </ul>
        </div>
    </body>
</html>