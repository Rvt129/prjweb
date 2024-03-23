/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 84933
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String WALLET = "WalletController";
    private final String TRACKING = "TrackingController";
    private final String LOGIN = "login";
    private final String ACCOUNT = "AccountController";
    private final String DASHBOARD = "ReportController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        String action = request.getParameter("action");
        switch (action) {
            case "account":
                url = ACCOUNT;
                break;
            case "login":
                url = LOGIN;
                break;
            case "createaccount":
                url = WALLET;
                break;
            case "updateaccount":
                url = WALLET;
                break;
            case "addfund":
                url = WALLET;
                break;
            case "transfer":
                url = WALLET;
                break;
            case "deleteAccount":
                url = WALLET;
                break;
            case "resetpassword":
                url = ACCOUNT;
                break;
            case "signup":
                url = LOGIN;
                break;
            case "updatepassword":
                url = ACCOUNT;
                break;
            case "wallet":
                url = WALLET;
                break;
            case "reportyear":
                url = DASHBOARD;
                break;
            case "report":
                url = DASHBOARD;
                break;
            case "userupdate":
                url = ACCOUNT;
                break;
            case "logout":
                url = LOGIN;
                break;
            case "tracking":
                url = TRACKING;
            case "sort":
                url = TRACKING;
            case "addtransaction":
                url = TRACKING;
            case "edittransaction":
                url = TRACKING;
            case "deletetransaction":
                url = TRACKING;
            default: ;

        }
        request.getRequestDispatcher(url).forward(request, response);
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
}
