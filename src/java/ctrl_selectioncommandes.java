/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import connexion.connexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hp
 */
public class ctrl_selectioncommandes extends HttpServlet {

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

            Blob imgLen = null;
            st = (new connexion().getst());

            String log = request.getParameter("id");

            ResultSet rs = st.executeQuery("SELECT o.isbn,o.titre_oeuvre,o.image,o.auteur,o.genre,o.resumé,o.date_parution,c.date_commande,c.num_commande FROM oeuvre o, commande c where o.isbn=c.isbn and o.isbn='" + log + "'");
            if (rs.next()) {
                request.setAttribute("image", rs.getString(3));
                request.setAttribute("ISBN", log);
                request.setAttribute("TITRE_OEUVRE", rs.getString(2));
                request.setAttribute("AUTEUR", rs.getString(4));         
                request.setAttribute("GENRE", rs.getString(5));
                request.setAttribute("RESUME", rs.getString(6));
                request.setAttribute("date_commande", rs.getString(8));
                request.setAttribute("num_commande", rs.getString(9));
                request.setAttribute("date_parution", rs.getString(7));
                ResultSet rs1=st.executeQuery("SELECT image,isbn  FROM oeuvre where genre='"+rs.getString(5)+"' or auteur='"+rs.getString(4)+"' or date_parution='"+rs.getString(7)+"'");
                List<imageisbn> li= new ArrayList<>();
                while(rs1.next()){
                    imageisbn image= new imageisbn(rs1.getString(1), rs1.getString(2));
                    li.add(image);
                }
                request.setAttribute("images", li);
                
            }
            
            rs.close();
            st.close();

            request.getRequestDispatcher("affichageinfosmescommandes.jsp").forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            out.println(ex.getMessage());
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
