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
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class bidma extends HttpServlet {

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
            String action = request.getParameter("action");
            HttpSession h = request.getSession();
            String b = h.getAttribute("email").toString();
            st = (new connexion().getst());
            ResultSet rs = st.executeQuery("SELECT image,isbn  FROM oeuvre ");
            List<imageisbn> li = new ArrayList<>();
            while (rs.next()) {
                imageisbn image = new imageisbn(rs.getString(1), rs.getString(2));
                li.add(image);
            }
            ResultSet rs1 = st.executeQuery("select o.image,o.isbn,o.titre_oeuvre from oeuvre o,commande c, CLIENTS cl where o.isbn=c.isbn and cl.cin_client=c.cin_client and   cl.email_client='" + b + "' order by c.date_commande desc");
            List<imageisbntitre> li1 = new ArrayList<>();
            while (rs1.next()) {
                imageisbntitre image = new imageisbntitre(rs1.getString(1), rs1.getString(2), rs1.getString(3));
                li1.add(image);
            }
            ResultSet rs2 = st.executeQuery("SELECT image,isbn  FROM oeuvre where genre='Poesie' and quantite!='0'");
            List<imageisbn> li2 = new ArrayList<>();
            while (rs2.next()) {
                imageisbn image = new imageisbn(rs2.getString(1), rs2.getString(2));
                li2.add(image);
            }
            ResultSet rs3 = st.executeQuery("SELECT image,isbn  FROM oeuvre where genre='epistolaire' and quantite!='0'");
            List<imageisbn> li3 = new ArrayList<>();
            while (rs3.next()) {
                imageisbn image = new imageisbn(rs3.getString(1), rs3.getString(2));
                li3.add(image);
            }
            ResultSet rs4 = st.executeQuery("SELECT image,isbn  FROM oeuvre where genre='Theatre' and quantite!='0'");
            List<imageisbn> li4 = new ArrayList<>();
            while (rs4.next()) {
                imageisbn image = new imageisbn(rs4.getString(1), rs4.getString(2));
                li4.add(image);
            }
            ResultSet rs5 = st.executeQuery("SELECT image,isbn  FROM oeuvre where genre='Romanesque' and quantite!='0'");
            List<imageisbn> li5 = new ArrayList<>();
            while (rs5.next()) {
                imageisbn image = new imageisbn(rs5.getString(1), rs5.getString(2));
                li5.add(image);
            }
            request.setAttribute("images", li);
            request.setAttribute("images1", li1);
            request.setAttribute("images2", li2);
            request.setAttribute("images3", li3);
            request.setAttribute("images4", li4);
            request.setAttribute("images5", li5);
            request.getRequestDispatcher("Client.jsp").forward(request, response);
            rs1.close();
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
