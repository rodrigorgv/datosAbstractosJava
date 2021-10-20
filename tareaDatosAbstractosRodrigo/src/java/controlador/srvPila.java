package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.csPila;

public class srvPila extends HttpServlet {

    public static ArrayList<csPila> listaPila = new ArrayList();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            RequestDispatcher rd = null;
            String dato = request.getParameter("txtDato");

            csPila pila = new csPila();
            pila.setDato(dato);
            String[] acum = new String[10];

            String btn = request.getParameter("btn");
            if (listaPila.size() <= 9) {

                if (btn.equals("delete")) {

                    listaPila.remove(listaPila.size() - 1);
                    for (int i = 0; i < listaPila.size(); i++) {
                        acum[i] = listaPila.get(i).getDato().toString();
                    }

                }
                if (btn.equals("add")) {
                    listaPila.add(pila);

                    for (int i = 0; i < listaPila.size(); i++) {
                        acum[i] = listaPila.get(i).getDato().toString();
                    }

                }
                int data = 0;
                request.setAttribute("datos", acum);
                request.setAttribute("datos2", data);
                rd = request.getRequestDispatcher("pila.jsp");
                rd.forward(request, response);
            } else {
                int data = 1;
                if (btn.equals("delete")) {

                    listaPila.remove(listaPila.size() - 1);
                    for (int i = 0; i < listaPila.size(); i++) {
                        acum[i] = listaPila.get(i).getDato().toString();
                    }
                    data=0;

                }

                request.setAttribute("datos", acum);
                request.setAttribute("datos2", data);
                rd = request.getRequestDispatcher("pila.jsp");
                rd.forward(request, response);
            }

            /*
                            out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet srvPila</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet srvPila at " + request.getContextPath() + "</h1>");
                for (int i = 0; i <= 9; i++) {
                    out.println("<h1>dato " + acum[i] + "</h1>");

                }
                out.println("</body>");
                out.println("</html>");*/
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
