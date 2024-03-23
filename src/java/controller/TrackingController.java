package controller;

import account.AccountDAO;
import account.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import transaction.TransactionDAO;
import transaction.TransactionDTO;
import user.UserDAO;
import user.UserDTO;

public class TrackingController extends HttpServlet {

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

        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        ///////Check user logined
        UserDTO currentUser = null;

        currentUser = (UserDTO) session.getAttribute("usersession");
        log("Debug: " + currentUser);

        if (currentUser == null) {
            log("Debug: Redirect to login page" + currentUser);
            response.sendRedirect("LoginController");
            return;
        }
        ///////GET FULL LIST
        TransactionDAO transaction = new TransactionDAO();
        List<TransactionDTO> translist = transaction.getAllTransactions(currentUser);
        translist = transaction.sortTransactions(translist, 0, 0, "", "desc");

        AccountDAO account = new AccountDAO();
        List<AccountDTO> acclist = account.findAll(currentUser);

        UserDAO userDAO = new UserDAO();
        UserDTO userDTO = userDAO.info(currentUser.getUserID()).get(0);

        request.setAttribute("user", userDTO);
        request.setAttribute("transactionList", translist);
        request.setAttribute("accountList", acclist);

        ///////////////TRACKING FULL
        if ("tracking".equals(action) || action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("tracking.jsp");
            rd.forward(request, response);
        } else if (action.equals("deletetransaction")) {
            int deleteID = Integer.parseInt(request.getParameter("transid"));
            String deletetype = request.getParameter("transtype");
            int userid = currentUser.getUserID();
            int accountid = Integer.parseInt(request.getParameter("accountid"));

            TransactionDTO newtrans = new TransactionDTO();
            newtrans.setTransactionID(deleteID);
            newtrans.setTransactionType(deletetype);
            newtrans.setUserID(userid);
            newtrans.setAccountID(accountid);
            switch (newtrans.getTransactionType()) {
                case "expense":
                    transaction.updateExpense(newtrans);
                    transaction.updateExpense2(newtrans);
                    break;
                case "income":
                    transaction.updateIncome(newtrans);
                    transaction.updateIncome2(newtrans);
                    break;
            }
            transaction.delete(newtrans);

            response.sendRedirect("TrackingController");
        } else if (action.equals("addtransaction")) {
            int userID = currentUser.getUserID();

            String name = request.getParameter("name");
            int accID = Integer.parseInt(request.getParameter("account"));
            int catID = Integer.parseInt(request.getParameter("category"));
            String date = request.getParameter("date");
            String type = request.getParameter("type");
            String note = request.getParameter("note");
            long amount = Integer.parseInt(request.getParameter("amount"));

            TransactionDTO tran = new TransactionDTO();
            tran.setAccountID(accID);
            tran.setAmount(amount);
            tran.setCategoryID(catID);
            tran.setDate(date);
            tran.setName(name);
            tran.setNote(note);
            tran.setTransactionType(type);
            tran.setUserID(userID);

            transaction.insert(tran);

            response.sendRedirect("TrackingController");
        } else if (action.equals("edittransaction")) {
            int userID = currentUser.getUserID();
            int exid = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int accID = Integer.parseInt(request.getParameter("account"));
            int catID = Integer.parseInt(request.getParameter("category"));
            String date = request.getParameter("date");
            String type = request.getParameter("type");
            String note = request.getParameter("note");
            long amount = Integer.parseInt(request.getParameter("amount"));
            String extype = request.getParameter("extype");
            String exacc = request.getParameter("exaccount");
            String examount = request.getParameter("examount");
            TransactionDTO ex = new TransactionDTO();
            ex.setAccountID(Integer.parseInt(exacc));
            ex.setAmount(Integer.parseInt(examount));
            ex.setTransactionID(exid);
            ex.setUserID(userID);

            switch (extype) {
                case "expense":
                    transaction.updateExpense(ex);
                    transaction.updateExpense2(ex);
                    break;
                case "income":
                    transaction.updateIncome(ex);
                    transaction.updateIncome2(ex);
                    break;
            }
            transaction.delete(ex);

            TransactionDTO tran = new TransactionDTO();
            tran.setAccountID(accID);
            tran.setAmount(amount);
            tran.setCategoryID(catID);
            tran.setDate(date);
            tran.setName(name);
            tran.setNote(note);
            tran.setTransactionType(type);
            tran.setUserID(userID);

            transaction.insert(tran);

            response.sendRedirect("TrackingController");
        } else if ("sort".equals(action)) {
            int accID = Integer.parseInt(request.getParameter("account"));
            int catID = Integer.parseInt(request.getParameter("category"));
            String type = request.getParameter("type");
            String datesort = request.getParameter("date");

            List<TransactionDTO> newlist = transaction.sortTransactions(translist, catID, accID, type, datesort);

            request.setAttribute("transactionList", newlist);

            RequestDispatcher rd = request.getRequestDispatcher("tracking.jsp");
            rd.forward(request, response);
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
