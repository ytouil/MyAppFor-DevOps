<%-- 
    Document   : affichageinfosmescommandes
    Created on : 1 juin 2021, 00:38:46
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bibliotheque</title>
        <link rel="stylesheet" href="Client.css">
        <link rel="stylesheet" href="saad.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">        
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .inputtable{
                color:white;
            }
            .tdstyle{
                width: 91px; 
                height: 45px;
                border-right: 1px solid #ddd;
                color:white;    
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
                background: #10bf46;
                border-color: #10bf46;
                color: #fff!important;
                text-shadow: 0 -1px 1px rgb(19 28 0 / 35%);
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
            .thumbTile__image{
                border-radius: 6px;
            }
              @media screen and (min-width: 1366px)  {
                .thumbTile__image{
                    width: 268px;
                }
            }
        </style>
        <script>
//            function commander()
//            {
//                if (confirm("voulez vous vraiment commander celui ci ?"))
//                {
//                    document.action.submit();
//                } else
//                    return false;
//
//            }
        </script>
    </head>
    <body style="background-color: #141414">
        <div class="header" style="background-color: #141414; position: fixed;width: 100%;z-index: 9999">
            <a href="bidma"><img src="23358.png" alt="Bibliothequeimage" class="headerLogo"></a>
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
                <div class="col-md-8 md-6">
                    <table class="table custom-table" style="border: 1px solid #ddd;" >
                        <tbody class="saad" style="background-color: #141414; text-align: center; font-size: 12px">
                            <tr>
                                <td  class="tdstyle" >ISBN</td>
                                <td class="inputtable"><input style=" width: 100%; border: none; background-color: #141414; text-align: center;"  type="text" name="ISBN" disabled   value="${ISBN}"/></td>
                            </tr>
                            <tr>
                                <td  class="tdstyle" >Titre d'oeuvre</td>
                                <td class="inputtable"><input style=" width: 100%; border: none; background-color: #141414; text-align: center;" type="text" id="${TITRE_OEUVRE}" name="TITRE_OEUVRE" disabled value="${TITRE_OEUVRE}"/></td>
                            </tr>
                            <tr>
                                <td  class="tdstyle" >L'auteur</td>
                                <td class="inputtable"><input style=" width: 100%; border: none; background-color: #141414; text-align: center;" type="text" name="AUTEUR" disabled  value="${AUTEUR}"/></td>
                            </tr>
                            <tr>
                                <td  class="tdstyle" >Date de parurtion</td>
                                <td class="inputtable"><input style=" width: 100%; border: none; background-color: #141414; text-align: center;" type="text" name="date_parution" disabled  value="${date_parution}"/></td>
                            </tr>
                            <tr>
                                <td  class="tdstyle" >Genre</td>
                                <td class="inputtable"><input style=" width: 100%; border: none; background-color: #141414; text-align: center;" type="text" name="GENRE" disabled  value="${GENRE}"/></td>
                            </tr>
                             <tr>
                                <td  class="tdstyle" >numero de commande</td>
                                <td class="inputtable"><input style=" width: 100%; border: none; background-color: #141414; text-align: center;"  type="text" name="num_commande" disabled   value="${num_commande}"/></td>
                            </tr>
                            <tr>
                                <td  class="tdstyle" >Date commande</td>
                                <td class="inputtable"><input style=" width: 100%; border: none; background-color: #141414; text-align: center;" type="text" id="${date_commande}" name="date_commande" disabled value="${date_commande}"/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-4 md-6">
                    <img src="${image}">
                    <br>
                    <a  onclick="return confirm('voulez vous vraiment le commander?')" style="margin-left: 16%;width: 226px;margin-top: 5px;margin-bottom: 5px;" id="a" class="btn g dl" name="action"   href='insertcommande?id=${ISBN}'>Recommander</a>
                </div>
            </div>
            <div style="position: relative;display: block;margin-bottom: 10px;background: #fff;border: 1px solid #ddd;border-radius: 4px;">
                <div class="row">
                    <div class="col-md-12 md-6">
                        <div style=" height: 48px;padding: 10px; background-color: #F9F9F9;"> Le resumee</div>
                        <div style="padding: 10px;">
                            <textarea disabled  cols="154" rows="10" style="border: none; background-color: #f8f6ff; padding: 12px;" type="text" name="RESUME">${RESUME}</textarea>
                            <!--<input type="text" disabled style=" width:1117px; height: 249px; border:none" value="${RESUME}">-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                <main>
            <section class="thumbSection">
                <h2 class="thumbTitle"  style="color:white;">Suggestion</h2>
                <div class="thumbTiles swiper-container">
                    <div class="swiper-wrapper">

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
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
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
                spaceBetween: 5,
                slidesPerView: 2,
//                loop: true,
                freeMode: true,
                loopAdditionalSlides: 5,
                speed: 500,
                // Navigation arrows
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                breakpoints: {
//                     when window width is >= 640px
                    640: {
                        slidesPerView: 5,
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
