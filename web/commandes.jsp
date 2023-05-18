<%-- 
    Document   : commandes
    Created on : 28 mai 2021, 01:29:41
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .g:hover{
                padding:15px 20px;
                /*margin-top: 70px;*/
                /*margin-left: 60px;*/
                color: black;
                height:55px;
                border: 1px solid #dadada;
                /*color: grey;*/
                text-align:justify;
                outline: none;
                letter-spacing: 1px;
                font-size: 16px;
                font-weight:bold;
                font-family: 'Muli', sans-serif;
                border-radius:30px;
                /*background-color:#f5f8fa;*/
                /*border-top-right-radius: 5px;*/
                -webkit-border-radius:30px;
                -moz-border-radius:30px;
                -o-border-radius:30px;
                -ms-border-radius:30px; 
                /*display:block;*/
            }
            #ok{
                color: white; 
                cursor: default;
                background-color: #10B6E8;
                border: none;
                padding:10px 16px;
                border-bottom-color: transparent;
                text-decoration: none;
                font-size:16px;
                border-radius: 36px
            }
        </style>
    </head>
    <body>
        <header class="header" style="background-color: #10B6E8; position: fixed; width: 100%">
            <a href="adminoeuvre"><img src="23358.png" alt="Bibliothequeimage" class="headerLogo"></a>
            <div style="position:relative;display: block;z-index: 9999999;right: -37%; margin-top: -36px;">
                <a  class="g" style="color:white; font-size: 20px; padding-right:12px; text-decoration: none;margin-left: -160px;" href="adminoeuvre">Retournez vers la bibliotheque enligne</a>
                <a  class="g" style="color:white; font-size: 20px; padding-right:12px; text-decoration: none" href="lebilan">le bilan de commande effectuee</a>
            </div>
            <div class="sticky-nav">
                <div class="menu-toggle" style="position:relative;display: block;z-index: 9999999;right: -97%;">
                    <img role="button" type="button" onclick="f1()" src="saad.png" style="width: 30px; margin-top: -51px;">
                </div>

                <div id="myDIV" class="overlay sa btn-info" style="top:57px;" >                               
                    <div class="rows">
                        <ul class="centre" style="padding-top:5px">
                            <%
                                String log = (String) session.getAttribute("emailadmin");
                                if (log == null) {
                                    request.getRequestDispatcher("authentification.jsp").forward(request, response);
                                }
                            %>
                            <li style="color:white;padding-bottom:5%;font-size:20px;"> 
                                <h1>Bienvenu <br></h1>
                                    <%=log%> 
                            </li> 
                        </ul>  
                        <a href="Deconnection" id="deconnexion" class="btn-info" name="deconnexion" style="text-decoration:none; "><span style="color:white;">se déconnecter</span></a>
                    </div>   
                </div>
            </div>
        </header>
        <div class="content" style="padding-top: 70px;">

            <div class="container">
                <div class="table-responsive">

                    <table class="table custom-table" >
                        <thead>
                            <tr>
                                <td scope="col">Num de commande</td>
<!--                                <td scope="col">Rendue</td>-->
                                <td scope="col">Date de commande</td>
                                <td scope="col">Cin du client</td>
                                <td scope="col">ISBN</td>
                                <td scope="col">NUM du client</td>
                                <td scope="col">RENDUE</td>
                            </tr>
                        </thead>
                        <tbody>
                            ${data}

                        </tbody>
                    </table>
                </div>


            </div>

        </div>

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
        </script>
    </body>
</html>

