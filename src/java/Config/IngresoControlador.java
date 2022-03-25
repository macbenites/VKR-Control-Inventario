package Config;

import Modelo.DetalleIngreso;
import Modelo.Ingreso;
import ModeloDAO.IngresoDAO;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IngresoControlador extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            IngresoDAO dao = new IngresoDAO();
            String resp = "";
            String action = request.getParameter("action");

            switch (action) {
                case "Guardar":
                    Ingreso ingre = new Ingreso();
                    ingre.setId_ingreso(Integer.parseInt(request.getParameter("idingreso")));
                    ingre.setAlmacen(request.getParameter("almacen"));
                    ingre.setFecha_ingreso(request.getParameter("fechai"));
                    ingre.setId_empleado(Integer.parseInt(request.getParameter("codem")));
                    ingre.setId_proveedor(Integer.parseInt(request.getParameter("codpro")));
                    Gson gson = new Gson();
                    Type type = new TypeToken<ArrayList<DetalleIngreso>>() {
                    }.getType();
                    ArrayList<DetalleIngreso> list = gson.fromJson(request.getParameter("productos"), type);
                    ingre.setDetalle(list);
                    resp = dao.guardarIngreso(ingre);
                    out.print(resp);
                    break;
                case "Ver_Detalle":
                    int codigo = Integer.parseInt(request.getParameter("codigo"));
                    List<DetalleIngreso> listdetalle = dao.getDataIngresoDetalle(codigo);
                    Gson gson2 = new Gson();
                    resp = gson2.toJson(listdetalle);
                    out.print(resp);
                    break;
            }
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
