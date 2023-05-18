/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import connexion.connexion;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author HP
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class ajouter extends HttpServlet {

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
        PrintWriter writer = response.getWriter();
         
        
        try {
            String ISBN1 = request.getParameter("ISBN1");
            String TITRE_OEUVRE1 = request.getParameter("TITRE_OEUVRE1");
            String AUTEUR1 = request.getParameter("AUTEUR1");
            String date_parution1 = request.getParameter("date_parution1");
            String GENRE1 = request.getParameter("GENRE1");
            String RESUME1 = request.getParameter("RESUME1");
            String quantite1 = request.getParameter("quantite1");
            Part filePart = request.getPart("fileToUpload");
           String imgfileName = null;
        String image = "";
        String path = "C:\\Users\\HP\\Documents\\NetBeansProjects\\12\\web\\images";
        File file = new File(path);
        file.mkdir();

        if (filePart == null) {
            imgfileName = null;
        } else {
            imgfileName = randomIdentifier() + ".jpg";
        }

        OutputStream out = null;
        InputStream filecontent = null;

        

        out = new FileOutputStream(new File(path + File.separator + imgfileName));

        filecontent = filePart.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
            //photo = path + "\\" + fileName;
            image = "images\\" + imgfileName;

        }
          
           Statement st;  
//           String conf="";
            st=(new connexion().getst());
            
           String req="insert into oeuvre  values('"+ISBN1+"','"+TITRE_OEUVRE1+"','"+date_parution1+"','"+AUTEUR1+"','"+GENRE1+"','"+RESUME1+"','"+quantite1+"','"+image+"')";
//out.println(req)  ;        
 st.executeUpdate(req);
//           conf="le compte "+email+" est crée avec succés";
           st.close();
//           c.close();
           
         
//           request.setAttribute("err", err);
//           request.setAttribute("conf", conf);
           request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
        catch (Exception e)
        {
        e.printStackTrace();
        writer.println(e.getMessage());
        }
    }
 public String randomIdentifier() {
        final String lexicon = "ABCDEFGHIJKLMNOPQRSTUVWXYZ12345674890";

        final java.util.Random rand = new java.util.Random();

        final Set<String> identifiers = new HashSet<String>();
        StringBuilder builder = new StringBuilder();
        while (builder.toString().length() == 0) {
            int length = rand.nextInt(5) + 5;
            for (int i = 0; i < length; i++) {
                builder.append(lexicon.charAt(rand.nextInt(lexicon.length())));
            }
            if (identifiers.contains(builder.toString())) {
                builder = new StringBuilder();
            }
        }
        return builder.toString();
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
