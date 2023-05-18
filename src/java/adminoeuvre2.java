/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import connexion.connexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class adminoeuvre2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
        try {
            Statement st;

            st = (new connexion().getst());

//            ResultSet r=st.executeQuery("SELECT * FROM admins  where email_admin='"+log+"' and passe_admin ='"+pass+"'");
            ResultSet r;
            String req = "select ISBN,TITRE_OEUVRE,auteur,genre,DATE_PARUTION,resumé,quantite from oeuvre  where 1=1";
            if (request.getParameter("input") != "") {
                req += "and LOWER(TITRE_OEUVRE) like '%" + request.getParameter("input") + "%' ";
                req += "or LOWER(auteur) like '%" + request.getParameter("input") + "%' ";
                req += "or LOWER(GENRE) like '%" + request.getParameter("input") + "%' ";
                req += "or ISBN like '%" + request.getParameter("input") + "%' ";
            }
            r = st.executeQuery(req);
            String data = "";
            while (r.next()) {
                data += "<tr>";
                data += "<td>";
                data += r.getString(1);
                data += "</td>";
                data += "<td>";
                data += r.getString(2);
                data += "</td>";
                data += "<td>";
                data += r.getString(3);
                data += "</td>";
                data += "<td>";
                data += r.getString(4);
                data += "</td>";
                data += "<td>";
                data += r.getString(5);
                data += "</td>";
                data += "<td>";
                data += r.getString(6);
                data += "</td>";
                data += "<td>";
                data += r.getString(7);
                data += "</td>";
                data += "<td>";
                data += "<a   href='selectmodifier?id=" + r.getString(1) + "'><img src=\"téléchargé.png\" style=\"width:30px; height:30px;\"></a>";
                data += "</td>";
                data += "<td>";
                data += "<a   href='supprimer?id=" + r.getString(1) + "'><img src=\"s.png\" style=\"width:30px; height:30px;\"></a>";
                data += "</td>";
                data += "</tr>";

            }

            request.setAttribute("data", data);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
//            ResultSet rl=st.executeQuery("select isbn from oeuvre;");
//            String pp=request.getParameter(rl.toString());
//                    while(rl.next()){
//                        getServletContext().getRequestDispatcher("Client.jsp" ).forward(request,response);
//                    }

            r.close();
//            rs.close();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
