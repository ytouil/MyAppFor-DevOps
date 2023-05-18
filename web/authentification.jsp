<%-- 
    Document   : authentification
    Created on : 25 avr. 2021, 15:34:05
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Client.css">
        <link rel="stylesheet" href="authentification.css">
<!--        <script src="jqueryy.min.js"></script>
        <script src="index.js"></script>-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>bibliotheque</title>
        <script>
            function f1()
            {
                var x = document.getElementById("div");
                var y = document.getElementById("mydiv");
                if (x.style.display === "none") {
                    x.style.display = "block";
                    y.style.display = "none";
                } else {
                    x.style.display = "none";
                    y.style.display = "block";
                }
            }
        </script>
    </head>
    <body>
        <header class="header" style="background-color: #141414;;position: fixed; width: 100%">
            <a href="authentification.jsp"><img src="23358.png" alt="Bibliothequeimage" class="headerLogo"></a>

        </header>
        <div class="login-wrap">
            <div class="login-html">
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Se connecter</label>
                <input id="tab-2" type="radio" name="tab" class="sign-up" checked><label for="tab-2" class="tab">S'inscrire</label>
                <div class="login-form">
                    <div class="sign-in-htm">

                        <div class="mydiv" id="mydiv">
                            <h2>Client</h2>
                            <form action="controleur">
                                <div class="group">
                                    <%
                                        String log = request.getParameter("email");
                                    %>
                                    <label for="user" class="label">Adresse email</label>
                                    <input id="user" type="TEXT" name="email" class="input email" placeholder="entrer votre adresse email" required value="<%if (log != null) {
                                            out.println(log);
                                        }%>">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Mot de passe</label>
                                    <input id="pass" type="password" name="pass" class="input pass" data-type="password" placeholder="entrer votre mot de passe" required>
                                </div>
                                <!-- <div class="group">
                                    <input id="check" type="checkbox" class="check" checked>
                                    <label for="check"><span class="icon"></span> Keep me Signed in</label>
                                </div> -->
                                <div class="group">
                                    <input type="submit" id="connexio" name="connexio"  class="button connexio" value="Se connecter">
                                </div>
                                <span style="color:red;"><%if (log != null) {%> Authentification invalide !!!<%}%></span>  
                            </form>
                            <div class="group"><input id="button10"  class="button" type="button" onclick="f1()" value="admin"></div>
                        </div>

                        <div class="div" id="div" style="display: none;">
                            <h2>ADMIN</h2>
                            <form action="controleuradmin">
                                <div class="group">
                                    <%
                                        String logf = request.getParameter("emailadmin");
                                    %>
                                    <label for="user" class="label"> Addresse email</label>
                                    <input id="user" type="TEXT" name="emailadmin" class="input email" placeholder="entrer votre adresse email" required value="<%if (logf != null) {
                                            out.println(log);
                                        }%>">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Mot de passe</label>
                                    <input id="pass" type="password" name="passadmin" class="input pass" data-type="password" placeholder="entrer votre mot de passe" required>
                                </div>
                                <!-- <div class="group">
                                    <input id="check" type="checkbox" class="check" checked>
                                    <label for="check"><span class="icon"></span> Keep me Signed in</label>
                                </div> -->
                                <div class="group">
                                    <input type="submit" id="connexi" name="connexio"  class="button connexio" value="Se connecter">
                                </div>
                                <span style="color:red;"><%if (logf != null) {%> Authentification invalide !!!<%}%></span>  
                            </form>
                            <div class="hr"></div>
                            <div class="group"><input id="button10"  class="button" type="button" onclick="f1()" value="CLIENT"></div>
                        </div>
                        <!-- <div class="foot-lnk">
                            <a href="#forgot">Forgot Password?</a>
                        </div>  -->
                    </div>
                    <div class="sign-up-htm">
                        <form action="Ctrl_inscription">
                            <div class="group">
                                <!-- <label for="pass" class="label">Username</label> -->
                                <input id="pass" type="text" name="nom" class="input" placeholder="entrer votre nom" required>
                            </div>
                            <div class="group">
                                <!-- <label for="pass" class="label">Username</label> -->
                                <input id="pass" type="text" name="prenom" class="input" placeholder="entrer votre prenom" required>
                            </div>
                            <div class="group">
                                <!-- <label for="pass" class="label">Phone Number :</label> -->
                                <input type="text" id="pass" class="input" name="cin" placeholder="entrer votre cin" required>
                            </div>
                            <div class="group">
                                <!-- <label for="user" class="label">Email Address</label> -->
                                <input id="user" type="text" class="input" name="tel" placeholder="entrer votre 0600000000" required>
                            </div>
                            <div class="group">
                                <!-- <label for="user" class="label">Email Address</label> -->
                                <input id="user" type="email" class="input" name="email" placeholder="entrer une adresse mail" required>
                            </div>
                            <div class="group">
                                <!-- <label for="pass" class="label">Password</label> -->
                                <input id="pass" type="password" class="input" name="pass" data-type="password" placeholder="entrer un mot de passe" required>
                            </div>
                            
                            <div class="group">
                                <input type="submit" id="button" class="button" value="S'inscrire">
                            </div>
                        </form>
                        <span style='color:green'>${conf}</span>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <a style="color: black;"><label for="tab-1" style=" cursor: pointer;">Vous avez déjà un compte?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 

</body>
<!-- Footer -->
    <footer class="bg-dark text-center text-white" style="background-color: #141414; padding-top: 20px;">
        <!-- Grid container -->
        <div class="container p-4">
            <!-- Section: Social media -->
            
            <!-- Section: Links -->
            <section class="">
                <!--Grid row-->
                <div class="row">
                    <!--Grid column-->
                    <div style="color:white" class="col-lg-3 col-md-6 mb-4 ">
                        <h5  class="text-uppercase">au-tour de nous</h5>
                        <p>
                            <!--                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt distinctio earum
                                                        repellat quaerat voluptatibus placeat nam, commodi optio pariatur est quia magnam
                                                        eum harum corrupti dicta, aliquam sequi voluptate quas.-->
                            La Bibliothèque SABA est située à Rabat, au Maroc  La Bibliothèque  a été créée en  2003.
                        </p>
                    </div>
                    <!--Grid column-->
                    <!--Grid column-->
                    <div class=" col-md-6 md-6 " style="color:white ">
                        <h5 class="text-uppercase">Contacts</h5>

                        <ul class="list-unstyled mb-0">
                            <li style="padding-bottom: 15px; margin-right: 6%;">
                                <span style="padding-right: 20px;"> <img src="footer/Groupe 566.png"></span><span class="text-white"> 05 37 23 22 77</span>
                            </li>
                            <li style="padding-bottom: 15px; margin-left: 7%;">
                                <span style="padding-right: 20px;"><img src="footer/Groupe 567.png"></span><span>lorem ipsum@lorem.ipsum</span>
                            </li>
                            <!--                            <li style="padding-bottom: 10px;">
                                                            <span style="padding-right: 20px;"><img src="footer/Groupe 568.png"></span><span><a href="#!" class="text-white">Link 3</a></span>
                                                        </li>-->
                            <li style="margin-left:33%; padding-top: 5px;">
                                <span style="padding-right: 20px;"><img src="footer/Tracé 340.png"></span><span>113, Avenue sidi Mohammed Ben Abdllah , agdal  Rabat.</span>
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
            <span style="font-size:16px;  color:white">© 2021 Copyright:</span>
            <!--<a class="text-white" href="" style="font-size:16px;">Saad Boumahdi- Abdelatif Agrou</a>-->
            <span style="font-size:16px; color:white;">Saad Boumahdi- Abdelatif Agrou</span>
        </div>
        <!-- Copyright -->
    </footer>
<!-- Footer -->
</html>