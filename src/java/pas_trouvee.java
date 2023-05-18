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
public class pas_trouvee extends HttpServlet {

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
//String TITRE_OEUVRE=request.getParameter("TITRE_OEUVRE");
//String auteur=request.getParameter("TITRE_OEUVRE");
//            ResultSet r=st.executeQuery("SELECT * FROM admins  where email_admin='"+log+"' and passe_admin ='"+pass+"'");
            ResultSet rs;
             rs=st.executeQuery ("select count(isbn) from oeuvre");
//out.println(req)  ;
            
            if (rs.next()) {
                request.setAttribute("count", rs.getString(1));
            }
            
            ResultSet rs1=st.executeQuery("SELECT image,isbn  FROM oeuvre where  quantite!='0'  ");
                List<imageisbn> li= new ArrayList<>();
                while(rs1.next()){
                    imageisbn image= new imageisbn(rs1.getString(1), rs1.getString(2));
                    li.add(image);
                }
                request.setAttribute("images", li);
          request.getRequestDispatcher("pas_trouvee.jsp").forward(request, response);

rs.close();
      st.close();
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
