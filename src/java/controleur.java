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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class controleur extends HttpServlet {

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
            String log = request.getParameter("email");
            String pass = request.getParameter("pass");

            st = (new connexion().getst());

//            ResultSet r=st.executeQuery("SELECT * FROM admins  where email_admin='"+log+"' and passe_admin ='"+pass+"'");
            ResultSet rs = st.executeQuery("SELECT * FROM clients  where email_client='" + log + "' and passe_client ='" + pass + "'");

            if (rs.next()) {

                request.getSession().setAttribute("email", log);
                request.getRequestDispatcher("bidma").forward(request, response);
            } //             if(r.next()){
            //                System.out.println("lhkhkuhiuhu");
            //                 request.getSession().setAttribute("login", log);
            //                request.getRequestDispatcher("admin.jsp").forward(request, response);
            //            }
            else {
                request.getRequestDispatcher("authentification.jsp").forward(request, response);
            }
//            ResultSet rl=st.executeQuery("select isbn from oeuvre;");
//            String pp=request.getParameter(rl.toString());
//                    while(rl.next()){
//                        getServletContext().getRequestDispatcher("Client.jsp" ).forward(request,response);
//                    }

//         r.close();
            rs.close();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println(e.getMessage());
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
