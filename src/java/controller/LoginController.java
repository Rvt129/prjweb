/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bank.BankDAO;
import bank.BankDTO;
import e_wallet.EWalletDAO;
import e_wallet.EWalletDTO;
import expense_category.ExpenseCategoryDAO;
import user.UserDAO;
import user.UserDTO;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import wallet.WalletDAO;
import wallet.WalletDTO;
import expense_category.*;

public class LoginController extends HttpServlet {

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

        String action = request.getParameter("action");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
       
        if (action != null && action.equals("logout")) {
            HttpSession session = request.getSession(false);

            if (session != null) {
                session.invalidate();
            }
            request.getRequestDispatcher("index.html").forward(request, response);
        } 
        
        else if (action.equals("signup")) {

            // Get other signup-related parameters such as name, etc.
            String name = request.getParameter("name");
            // Add more parameters as needed

            // Create a new UserDTO object with the signup information
            UserDTO newUser = new UserDTO();
            newUser.setEmail(email);
            newUser.setPassword(password);
            newUser.setUsername(name);
            // Set other user details

            // check email duplicate
            UserDAO userDAO = new UserDAO();
            if (!userDAO.getUserByEmail(email).isEmpty()) {
                request.setAttribute("error", "Email already been register, try log in instead");
                RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
                rd.forward(request, response);
            } 
            
            else {
                int signUpSuccess = userDAO.insert(newUser);

                if (signUpSuccess != 0) {
                    // Redirect to login page or any other appropriate page
                    response.sendRedirect("login.jsp");
                } else {
                    // Handle signup failure, e.g., email already exists
                    request.setAttribute("error", "Sign up failed, please try again");
                    RequestDispatcher rd = request.getRequestDispatcher("signup.jsp"); // Adjust the signup page name accordingly
                    rd.forward(request, response);
                }
            }
        }
        else {

            log("Debug user : " + email + " " + password);

            if (email == null && password == null) {

                log("Debug user : Go to login " + email + " " + password);
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            } else {

                log("Debug user : Go to here " + email + " " + password);
                WalletDAO walletDAO = new WalletDAO();
                List<WalletDTO> walletlist = walletDAO.findAll();
                EWalletDAO eWalletDAO = new EWalletDAO();
                List<EWalletDTO> ewalletlist = eWalletDAO.findAll();
                BankDAO bankdao = new BankDAO();
                List<BankDTO> banklist = bankdao.findAll();
                ExpenseCategoryDAO expenseCategoryDAO = new ExpenseCategoryDAO();
                List<ExpenseCategoryDTO> categorylist = expenseCategoryDAO.findAll();

                UserDAO userDAO = new UserDAO();
                List<UserDTO> userList = userDAO.login(email, password);
                if (!userList.isEmpty()) {
                    UserDTO userDTO = userList.get(0);
                    if (userDTO != null) {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("usersession", userDTO);

                        session.setAttribute("walletList", walletlist);

                        session.setAttribute("ewalletList", ewalletlist);

                        session.setAttribute("bankList", banklist);
                        session.setAttribute("category", categorylist);
                        response.sendRedirect("homepage.jsp");
                    }
                } else {
                    request.setAttribute("error", "Wrong username or password, please try again");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
            }

        }

        //  }
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