/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import Modelo.DetalleSalida;
import Modelo.Salida;
import ModeloDAO.SalidaDAO;
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

/**
 *
 * @author chris
 */
public class SalidaControlador extends HttpServlet {

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
            SalidaDAO dao = new SalidaDAO();
            String resp = "";
            String action = request.getParameter("action");
            switch (action) {
                case "Guardar":
                    Salida salida = new Salida();
                    salida.setId_salida(Integer.parseInt(request.getParameter("idsalida")));
                    salida.setAlmacen(request.getParameter("almacen"));
                    salida.setFecha_salida(request.getParameter("fechas"));
                    salida.setId_empleado(Integer.parseInt(request.getParameter("codem")));
                    salida.setId_cliente(Integer.parseInt(request.getParameter("codcl")));
                    Gson gson = new Gson();
                    Type type = new TypeToken<ArrayList<DetalleSalida>>() {
                    }.getType();
                    ArrayList<DetalleSalida> list = gson.fromJson(request.getParameter("productos"), type);
                    salida.setDetalle(list);
                    resp = dao.guardarSalida(salida);
                    out.print(resp);
                    break;
                case "Ver_Detalle":
                    int codigo = Integer.parseInt(request.getParameter("codigo"));
                    List<DetalleSalida> listdetalle = dao.getDataSalidaDetalle(codigo);
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
