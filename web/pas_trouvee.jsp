<%-- 
    Document   : pas_trouvee
    Created on : 30 mai 2021, 21:39:40
    Author     : HP
--%>


<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bibliotheque</title>
        <link rel="stylesheet" href="Client.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .tdstyle{
                width: 91px; 
                height: 45px;
                border-right: 1px solid #ddd;
                /*                background-color: #f8f6ff;*/
            }
            textarea {
                /*  resize: vertical;*/
                resize: none;
            }
            .btn.dl {
                padding: 4px 10px;
            }
            .btn.g, .btn._g:hover {
                /*background: #10bf46;*/
                /*border-color: #10bf46;*/
                color: #fff!important;
                text-shadow: 0 -1px 1px rgb(19 28 0 / 35%);
                border:none;
            }
            .btn {
                /*display: inline-block;*/
                border-radius: 4px;
                border: 1px solid #ccc;

                vertical-align: middle;
                /*padding: 6px 10px;*/
                font-weight: 500;

                margin: 0;
                text-decoration: none;
                text-align: center;
                cursor: pointer;
            }
            /*            .thumbTile__image{
                            width:398px;
            
                        }*/
            .thumbTile__image {
                width: 433px;
                height: 253px;
                border-radius: 6px;
            }
            .swiper-slide{
                margin-bottom: 50px;
            }
            #saad{
                display: flex;
                flex-wrap: wrap;
                /*align-items: center;*/
                /*justify-content: space-between;*/ 
                width:140%;
            }
            @media screen and (min-width: 1865px) {
                .thumbTile__image{
                    width: 620px;
                    height: 320px;
                }
            }
            .rech{
                /*                padding-left: 20%;*/
                padding-left: 40%;
                margin-top: -30px;
            }
            input.reche:hover
            {
                background-color:#e5ddd5 !important;
                border:1px solid #dadada;
            }
            .reche{
                height: 30px;
                border-radius: 64px;
                margin-bottom: 2px;
                background-color: #f5f8fa;
                border:none;
            }
            @media screen and (min-width: 1366px)  {
                .thumbTile__image{
                    width: 446px;
                }
            }
        </style>
    </head>
    <body style="background-color: #141414">
        <div class="header" style="background-color: #141414; position: fixed;width: 100%;z-index: 9999">
            <a href="bidma"><img src="23358.png" alt="Bibliothequeimage" class="headerLogo" style="width:50px;"></a>
            <div class="rech">
                <form action="bidma2">
                    <input class="reche" type="text" name="TITRE_OEUVRE" placeholder="rechercher par auteur ou titre_oeuvre">
                    <button  type="submit" style="border: none"><img style="background-color:#141414;" src="tttttt.png"  width="30" height="30" ></button>
                </form>
            </div>
            <div class="sticky-nav">
                <div class="menu-toggle" style="position:relative;display: block;z-index: 9999999;right: -97%;">
                    <img role="button" type="button" onclick="f1()" src="saad.png" style="width: 30px; margin-top: -51px;">
                </div>
                <div id="myDIV" class="overlay sa" >                               
                    <div class="rows">
                        <ul class="centre" style="padding-top:5px">
                            <%
                                String log = (String) session.getAttribute("email");
                                if (log == null) {
                                    request.getRequestDispatcher("authentification.jsp").forward(request, response);
                                }
                            %>
                            <li style="color:white;padding-bottom:5%;font-size:20px;"> 
                                <h1>Bienvenu <br></h1>
                                    <%=log%> 
                            </li> 
                        </ul>  
                        <a href="Deconnection" id="deconnexion" class="deconnexion" name="deconnexion" style="text-decoration:none;background-color: grey; "><span style="color:black">se déconnecter</span></a>
                    </div>   
                </div>
            </div>
        </div>
        <div class="container" style="padding-top: 90px;">
            <div class="row">
                <div class="col-md-4 md-6">
                    <img src="sad2.png" style= " background-color: black; width: 340px; height: 340px">
                    <br>
<!--                    <a  onclick="return confirm('voulez vous vraiment le commander?')" style="margin-left: 16%;width: 226px;" id="a" class="btn g dl" name="action"   href='insertcommande?id=${ISBN}'>Commander</a>-->
                </div>
                <div class="col-md-8 md-6">
                    <h1 style="color:white; margin-top:110px;">Il n'est pas disponnible à ce momment mais il sera prochiannement dans notre bibliothèque SABA. </h1>
                </div>

            </div>

        </div>
        <main>
            <section class="thumbSection">
                <h2 class="thumbTitle"  style="color:white;">Suggestion</h2>
                <div class="thumbTiles swiper-container">
                    <div class="swiper-wrapper" id="saad">

                        <!--this loop will get all images-->

                        <c:forEach var="im" items="${images}">

                            <!--I'm using id column of table,you can use any coulmn which is unique to all row-->

                            <!-- Slides -->
                            <div class="swiper-slide">
                                <!--                            <a class="thumbTile" type="button" data-toggle="modal" data-target="#modal-with-tab">-->
                                <a  style="text-decoration: none;" class="thumbTile" type="button" href='Ctrl_selection?id=${im.isbni}'>
                                    <!--height ="191.09"-->
                                    <img class="thumbTile__image" src="${im.image}" width="259.39" height ="259.09"  border="1">
                                    <!--<span style="color:white; display: none"></span>-->
                                    <% //System.out.println("isfasgfasg");%>
                                </a>
                                <a  onclick="return confirm('voulez vous vraiment le commander?')" style=" border-right: 1px solid black; margin-left: 10%; " id="a" class="btn g dl" name="action"   href='insertcommande?id=${im.isbni}'>Commander</a>
                                <!--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal-with-tab">Modal with tabs</button> width: 226px;--> 
                            </div>
                        </c:forEach>
                    </div>
                    <!-- If we need navigation buttons -->
                    <!--                    <div class="swiper-button-prev"></div>
                                        <div class="swiper-button-next"></div>-->
                </div>
            </section>
        </main>
        <footer class="bg-dark text-center text-white" style="background-color: #141414;margin-top: 30px;">
            <!-- Grid container -->
            <div class="container p-4">
                <!-- Section: Social media -->

                <!-- Section: Links -->
                <section class="">
                    <!--Grid row-->
                    <div class="row">
                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 ">
                            <h5 class="text-uppercase" style="color:white;">au-tour de nous</h5>
                            <p style="color:white;">
                                La Bibliothèque SABA est située à Rabat, au Maroc  La Bibliothèque  a été créée en  2003.
                            </p>
                        </div>
                        <!--Grid column-->
                        <!--Grid column-->
                        <div class=" col-md-6 md-6 ">
                            <h5 class="text-uppercase" style="color:white;">Contacts</h5>

                            <ul class="list-unstyled mb-0">
                                <li style="padding-bottom: 15px; margin-right: 6%;">
                                    <span style="padding-right: 20px;"> <img src="footer/Groupe 566.png"></span><span class="text-white" style="color:white;"> 05 37 23 22 77</span>
                                </li>
                                <li style="padding-bottom: 15px; margin-left: 7%;">
                                    <span style="padding-right: 20px;"><img src="footer/Groupe 567.png"></span><span style="color:white;">lorem ipsum@lorem.ipsum</span>
                                </li>
                                <!--                            <li style="padding-bottom: 10px;">
                                                                <span style="padding-right: 20px;"><img src="footer/Groupe 568.png"></span><span><a href="#!" class="text-white">Link 3</a></span>
                                                            </li>-->
                                <li style="margin-left:33%; padding-top: 5px;">
                                    <span style="padding-right: 20px;"><img src="footer/Tracé 340.png"></span><span style="color:white;">113, Avenue sidi Mohammed Ben Abdllah , agdal  Rabat.</span>
                                </li>
                            </ul>
                        </div>
                        <!--Grid column-->
                    </div>
                    <!--Grid row-->
                </section>
                <!-- Section: Links -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: #141414;padding-top: 20px; padding-bottom: 20px;  ">
                <span style="font-size:16px;color:white;">© 2021 Copyright:</span>
                <!--<a class="text-white" href="" style="font-size:16px;">Saad Boumahdi- Abdelatif Agrou</a>-->
                <span style="font-size:16px; color:white;">Saad Boumahdi- Abdelatif Agrou</span>
            </div>
            <!-- Copyright -->
        </footer>
        <script>
            function f1()
            {
                var x = document.getElementById("myDIV");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }
            var mySwiper = new Swiper('.swiper-container', {
                breakpoints: {
                    640: {
                        slidesPerView: 3,
                        slidesPerGroup: 5,
                        freeMode: false
                    }
                }
            });
        </script>
    </body>
    <!--    <body>
            <h1>${count}</h1>
        </body>-->
</html>
