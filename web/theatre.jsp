<%-- 
    Document   : theatre
    Created on : 28 mai 2021, 22:42:55
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connexion.connexion"%>
<%@page import="java.sql.Statement"%>
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
                /*                background-color: #fbfbfb;
                                background: -webkit-gradient(linear,50% 0%,50% 100%,color-stop(0%,#fbfbfb),color-stop(100%,#e1e1e1));
                                background: -webkit-linear-gradient(top,#fbfbfb,#e1e1e1);
                                background: -moz-linear-gradient(top,#fbfbfb,#e1e1e1);
                                background: -o-linear-gradient(top,#fbfbfb,#e1e1e1);
                                background: linear-gradient(top,#fbfbfb,#e1e1e1);*/
                vertical-align: middle;
                /*padding: 6px 10px;*/
                font-weight: 500;
                /*                color: #444!important;
                                text-shadow: 0 1px 1px #fff;*/
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
                width:120%;
            }
             @media screen and (min-width: 1366px)  {
                .thumbTile__image{
                    width: 447px;
                }
            }
            @media screen and (min-width: 1865px) {
                .thumbTile__image{
                    width: 568px;
                    height: 290px;
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
        </style>
    </head>
    <body style="background-color: #141414;">
        <header class="header" style="position: fixed;width: 100%;z-index: 9999">
            <a href="bidma"><img src="23358.png" alt="Bibliothequeimage" class="headerLogo"></a>
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
                            <!-- <li style="color:white;padding-bottom:5%;font-size:20px;">
                                103, Avenire sidi Mohammed Ben Abdllah , Qbibat akkari Rabat.
                            </li> -->

                            <% // Statement st;st=(new connexion().getst());
//                             connexion cn;
//                               ResultSet r=st.executeQuery("SELECT isbn FROM oeuvre");  

                            %>
                            <%                                        String log = (String) session.getAttribute("email");
                                if (log == null) {
                                    request.getRequestDispatcher("authentification.jsp").forward(request, response);
                                }
                            %>


                            <li style="color:white;padding-bottom:5%;font-size:20px;"> 
                                <h1>Bienvenu <br></h1>
                                    <%=log%> 

                            </li> 
                            <!--<li>--> 
                            <% // while(r.next()){ %>

    <!--<span style="color:red;"> <% // = // r.getString(1) %></span>-->


                            <% // } %>

                        </ul>  
                        <a href="Deconnection" id="deconnexion" class="deconnexion" name="deconnexion" style="text-decoration:none;background-color: grey; "><span style="color:black">se déconnecter</span></a>
                        <!--<button type="submit" id="deconnexion" class="deconnexion" name="deconnexion">Se deconnecter</button>-->
                    </div>   
                </div>
            </div>
        </header>
        
        <main style="padding-top: 90px;">
            <section class="thumbSection">
                <h1 class="thumbTitle" style="color:white; padding-bottom: 20px">Theatre</h1>
                <div class="thumbTiles swiper-container">
                    <div class="swiper-wrapper" id="saad">
                        <c:forEach var="im4" items="${images4}">
                            <!--I'm using id column of table,you can use any coulmn which is unique to all row-->

                            <!-- Slides -->
                            <div class="swiper-slide">
                                <!--                            <a class="thumbTile" type="button" data-toggle="modal" data-target="#modal-with-tab">-->
                                <a class="thumbTile" type="button" href='Ctrl_selection?id=${im4.isbni}'>

                                    <img class="thumbTile__image" src="${im4.image}" width="339.39" height ="191.09"  border="1">
                                    <span style="color:white; display: none">{im4.isbni}</span>
                                    <% //System.out.println("isfasgfasg");%>
                                    <br>
                                    <a style="font-size: 20px"  onclick="return confirm('voulez vous vraiment le commander?')"  id="a" class="btn g dl" name="action"   href='insertcommande?id={im4.isbni}'>Commander</a>
                                </a>

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
                                <!--                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt distinctio earum
                                                            repellat quaerat voluptatibus placeat nam, commodi optio pariatur est quia magnam
                                                            eum harum corrupti dicta, aliquam sequi voluptate quas.-->
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
            var mySwiper = new Swiper('.swiper-container', {
                // Optional parameters
//                spaceBetween: 5,
//                slidesPerView: 2,
//                loop: true,
//                freeMode: true,
//                loopAdditionalSlides: 5,
//                speed: 500,
//                // Navigation arrows
//                navigation: {
//                    nextEl: '.swiper-button-next',
//                    prevEl: '.swiper-button-prev',
//                },
                breakpoints: {
//                     when window width is >= 640px
                    640: {
                        slidesPerView: 3,
                        slidesPerGroup: 5,
                        freeMode: false
                    }
                }
            });
            function f1()
            {
                var x = document.getElementById("myDIV");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }
        </script>
    </body>
</html>
