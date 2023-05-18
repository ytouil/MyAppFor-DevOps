<%-- 
    Document   : admin
    Created on : 25 avr. 2021, 23:35:36
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" lang="eng">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bibliotheque</title>
        <link rel="stylesheet" href="Client.css">
        <!--        <link rel="stylesheet" href="menu.css">-->
        <!--        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
                <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> -->
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
            .panel-info {
                border-color: white;
            }
            .nav-tabs {
                border-bottom: none; 
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
            .rech{
                padding-left: 20%;
                margin-top: -32px;
            }
            input.reche:hover
            {
                background-color:#e5ddd5 !important;
                border:1px solid #dadada;
                /*display:block;*/
            }
            .reche{
                height: 30px;
                border-radius: 64px;
                margin-bottom: 2px;
                background-color: #f5f8fa;
                border:none;
            }
        </style>
        <script>
            function fct() {
                var isbn = $("#isbn").val();

                if (!isbn == "")
                    document.getElementById('mod').click();
            }
        </script>
    </head>
    <body onload="fct()">
        <header class="header" style="background-color: #10B6E8;height: 57px;position: fixed;width: 100%;">
            <a href="adminoeuvre"><img src="23358.png" alt="Bibliothequeimage" class="headerLogo"></a>
            <div class="rech">
                <form action="adminoeuvre2">
                    <input class="reche" type="text" name="input" placeholder="rechercher par auteur ou titre_oeuvre">
                    <!--<input type="submit" value="rechercher">-->
                    <button  type="submit" style="border: none"><img  src="search1.png"  width="30" height="30" ></button>
                </form>
            </div>
            <div style="position:relative;display: block;z-index: 9999999;right: -45%; margin-top: -36px;">
                <!--<ul>-->
                <a  class="g" style="color:white; font-size: 20px; padding-right:12px; text-decoration: none" href="commandeadmin">consulter les commandes</a> 
                <!--<a  class="g" style="color:white; font-size: 20px;text-decoration: none"href="#">consulter votre liste des commandes effectuee</a>-->
                <!--</ul>-->
            </div>
            <div class="sticky-nav">
                <div class="menu-toggle" style="position:relative;display: block;z-index: 9999999;right: -97%;">
                    <img role="button" type="button" onclick="f1()" src="saad.png" style="width: 30px; margin-top: -31px;">
                </div>

                <div id="myDIV" class="overlay sa btn-info" style="top: 57px;" >                               
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
        <!--style="padding-top: 57px;"-->
        <div class="container" style="padding-top: 63px;">
            <button type="button" class="btn btn-info " data-toggle="modal" data-target="#modal-with-tab" style="background: #10bf46;border-color: #10bf46;margin-left:45%; ">ajouter un oeuvre</button>
            <!--background: #10bf46;border-color: #10bf46;-->
            <span>
                <button type="button"id="mod" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal-with-tab1" style="display: none;">modifier un oeuvre</button>
            </span>
            <div id="modal-with-tab" class="modal modal-with-tab fade" role="dialog" style="padding-top:40px;">
                <div class="modal-dialog">
                    <div class="modal-content" style="width: 847px;left: -90px;">
                        <div class="modal-body" style="height: 497px;width: 847px;">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel with-nav-tabs panel-info" style="height: 440px; border-color:none">
                                        <div class="panel-heading" style="background-color:white; border-color:white;padding-top: 5px;padding-bottom: 5px;">
                                            <!--                                            <ul class="saadnav nav-tabs" style="padding-left: 10px;padding-right: 15px;padding-top: 5px; list-style-type: none;" >
                                                                                            <li class="active" id="ok"><a  style="font-size:15px;margin-left: 270px;" href="#tab1info" data-toggle="tab">entrer les informations</a></li>
                                                                                        </ul>-->
                                            <div class="active" ><label id="ok" style="font-size:15px;margin-left: 270px;">entrer les informations</label></div>
                                        </div>
                                        <div class="panel-body">
                                            <div class="tab-content">
                                                <div class="tab-pane fade in active" id="tab1info">
                                                    <div class="rows">
                                                        <form method="POST" action="ajouter" name="fre" enctype="multipart/form-data">
                                                            <span  style="color:white; padding-right:63px">ISBN:</span><input style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;" type="text" placeholder="nv isbn" name="ISBN1" >
                                                            <span  style="color:white;padding-right:20px">titre_oeuvre:</span><input style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;" type="text" placeholder="nv titre" name="TITRE_OEUVRE1">
                                                            <span  style="color:white;padding-right:53px">auteur:</span><input style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;" type="text" placeholder="nv nom d'auteur" name="AUTEUR1" >
                                                            <span  style="color:white;padding-right:57px">genre:</span><input style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;" type="text" placeholder="nv genre" name="GENRE1" >
                                                            <span  style="color:white;padding-right:5px">date_parution:</span><input  style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;" type="text" placeholder="nv date" name="date_parution1" >
                                                            <span  style="color:white;padding-right: 44px;">resume:</span><input  style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;"type="text" placeholder="nv resume" name="RESUME1" >
                                                            <span  style="color:white;padding-right: 40px;">quantite:</span><input  style="height:40px;border-radius: 30px;margin-top: 10px; text-align: center;"type="text" placeholder="nv quantite" name="quantite1">
                                                            <span  style="color:white;padding-right: 40px;">image:</span><input  id="deconnexion" type="file" placeholder="nv image" name="fileToUpload" value="choisir une image"><br>
                                                            <!--<textarea col="40" row="40" name="RESUME1" style="border-radius: 30px;margin-top: 10px;text-align: center;"></textarea>-->
                                                            <input id="deconnexion" name="action" type="button" onclick="ajouter()" value="ajouter" style="    margin-top: 40px;">
                                                        </form>
                                                    </div>           
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 

        </div> 

        <div class="content">

            <div class="container">

                <div class="table-responsive">

                    <table class="table custom-table" border="1" style="border-collapse: collapse;border-radius: 20px;overflow: hidden;margin-top: 7px; border:0">
                        <thead style="background-color: #c8c8c8;">
                            <tr>

                                <td scope="col" style="text-align: center">ISBN</td>
                                <td scope="col" style="text-align: center">Titre d'oeuvre</td>
                                <td scope="col" style="text-align: center">Auteur</td>
                                <td scope="col" style="text-align: center">Genre</td>
                                <td scope="col" style="text-align: center; width: 12%;">Date de parution</td>
                                <td scope="col" style="text-align: center">Résumé</td>
                                <td scope="col" style="text-align: center">Quantité</td>
                                <td scope="col" style="text-align: center"><img src="modifier.png" style="width:30px; height:30px;"></td> 
                                <td scope="col" style="text-align: center"><img src="supprimer.png" style="width:30px; height:30px;"></td>
                            </tr>
                        </thead>
                        <tbody>
                            ${data}
                        <span style='color:green'>${conf}</span>
                        </tbody>
                    </table>
                </div>


            </div>

        </div>
        <div id="modal-with-tab1" class="modal modal-with-tab fade" role="dialog" style="padding-top:40px;">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 847px;left: -90px;">
                    <div class="modal-body" style="height: 497px;width: 847px;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel with-nav-tabs panel-info" style="height: 440px; border-color:none">
                                    <div class="panel-heading" style="background-color:white; border-color:white;padding-top: 5px;padding-bottom: 5px;">

                                        <div class="active" ><label id="ok" style="font-size:15px;margin-left: 270px;">entrer les informations</label></div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="tab-content">
                                            <div class="tab-pane fade in active" id="tab1info">
                                                <div class="rows">

                                                    <form method="POST" action="modifier" name="frm" enctype="multipart/form-data">
                                                        <!--<span  style="color:black">je veux modifer:</span>   <input style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;"  type="text" placeholder="entrer un isbn d'oeuvre" name="oeuvre"  disabled value="${OEUUVRE}">-->
                                                        <span  style="color:black; padding-right:40px;margin-left: 100px">ISBN:</span><input style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;" type="text" placeholder="nv isbn" readonly disabled id="isbn" name="ISBN" value="${ISBN}">
                                                        <span  style="color:black;padding-right:20px;margin-left: 70px">Titre_oeuvre:</span><input style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;" type="text" placeholder="nv titre" name="TITRE_OEUVRE" value="${TITRE_OEUVRE}"><br>
                                                        <span  style="color:black;padding-right:53px">Auteur:</span><input style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;" type="text" placeholder="nv nom d'auteur" name="AUTEUR" value="${AUTEUR}">
                                                        <span  style="color:black;padding-right:57px">Genre:</span><input style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;" type="text" placeholder="nv genre" name="GENRE" value="${GENRE}"><br>
                                                        <span  style="color:black;padding-right:5px;margin-left: 100px;">Date_parution:</span><input  style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;" type="text" placeholder="nv date" name="date_parution" value="${date_parution}">
                                                        <span  style="color:black; padding-right:40px;margin-left: 100px">Résumé:</span><input  style="height:40px;border-radius: 30px;margin-top: 10px;text-align: center;"type="text" placeholder="nv resume" name="RESUME" value="${RESUME}"><br>
                                                        <span  style="color:black;padding-right:20px;margin-left: 70px">Quantité:</span><input  style="height:40px;border-radius: 30px;margin-top: 10px; text-align: center;"type="text" placeholder="nv quantite" name="quantite" value="${quantite}">
                                                        <span  style="color:black;">image:</span><input style="display: inline ;margin-left: 10px ;margin-top:10px;" id="deconnexion" type="file" placeholder="nv image" name="fileToUpload1" value="${image}"><br>
                                                        <input style="margin-left: 320px" id="deconnexion" name="action" type="button" onclick="modifier()" value="modifier">
                                                    </form>
                                                </div>    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
            function f2()
            {
                var x = document.getElementById("modifier");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }
            function f3()
            {
                var x = document.getElementById("ajouter");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }
            function modifier()
            {
                if (confirm("confirmer la modification ?"))
                {
                    document.frm.submit();
                } else
                    return false;

            }
            function ajouter()
            {
                if (confirm("confirmer la modification ?"))
                {
                    document.fre.submit();
                } else
                    return false;

            }
        </script>
    </body>

</html>
