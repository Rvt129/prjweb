/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import account.AccountDAO;
import account.AccountDTO;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import transaction.TransactionDAO;
import transaction.TransactionDTO;
import transfer.TransferDAO;
import transfer.TransferDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author 84933
 */
public class WalletController extends HttpServlet {

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
        HttpSession session = request.getSession();
        UserDTO currentUser = null;

        currentUser = (UserDTO) session.getAttribute("usersession");
        log("Debug: " + currentUser);
        if (currentUser == null) {
            log("Debug: Redirect to login page" + currentUser);
            response.sendRedirect("LoginController");
            return;
        }
        AccountDAO account = new AccountDAO();
        List<AccountDTO> acclist = account.findAll(currentUser);

        UserDAO user = new UserDAO();
        UserDTO userDTO = user.info(currentUser.getUserID()).get(0);
        request.setAttribute("user", userDTO);
        request.setAttribute("accountList", acclist);
        if (action == null || action.equals("wallet")) {
            RequestDispatcher rd = request.getRequestDispatcher("wallet.jsp");
            rd.forward(request, response);
        } else if (action.equals("createaccount")) {
            int WalletType = Integer.parseInt(request.getParameter("wallettype"));
            String AccountName = request.getParameter("Name");
            String BankID = request.getParameter("banktype");
            String EWalletID = request.getParameter("ewallettype");
            String Note = request.getParameter("Note");
            AccountDTO accountDTO = new AccountDTO();
            int index = 0;
            for (AccountDTO accountd : acclist) {
                if (accountd.getAccountName().contains(AccountName)) {

                    index++;
                }
            }
            if (index > 0) {
                AccountName += "(" + Integer.toString(index) + ")";
            }
            accountDTO.setAccountName(AccountName);
            accountDTO.setWalletType(WalletType);

            accountDTO.setNote(Note);
            if (BankID != null) {
                accountDTO.setBankID(Integer.parseInt(BankID));
            }
            if (EWalletID != null) {
                accountDTO.setEWalletID(Integer.parseInt(EWalletID));
            }
            accountDTO.setUserID(userDTO.getUserID());
            AccountDAO dao = new AccountDAO();
            accountDTO.setBalance(0);
            dao.insert(accountDTO);
            response.sendRedirect("WalletController");

        } else if (action.equals("updateaccount")) {
            AccountDTO accountDTO = new AccountDTO();
            int AccountID = Integer.parseInt(request.getParameter("AccountID"));
            String AccountName = request.getParameter("Name");
            int wallet = Integer.parseInt(request.getParameter("wallettype"));
            String banktypeupdate = request.getParameter("bankupdates");
            String ewalletupdate = request.getParameter("ewallettype_updates");
            if (ewalletupdate != null) {
                accountDTO.setEWalletID(Integer.parseInt(ewalletupdate));
            }
            if (banktypeupdate != null) {
                accountDTO.setBankID(Integer.parseInt(banktypeupdate));
            }

            String Note = request.getParameter("Note");

            int index = 0;
            for (AccountDTO accountd : acclist) {
                if (accountd.getAccountName().contains(AccountName)) {

                    index++;
                }
            }
            if (index > 0) {
                AccountName += "(" + Integer.toString(index) + ")";
            }
            accountDTO.setAccountName(AccountName);
            accountDTO.setNote(Note);

            AccountDAO dao = new AccountDAO();
            accountDTO.setWalletType(wallet);
            accountDTO.setAccountID(AccountID);

            dao.update(accountDTO);
            response.sendRedirect("WalletController");

        } else if (action.equals("deleteAccount")) {
            int AccountID = Integer.parseInt(request.getParameter("id"));
            AccountDTO accountDTO = new AccountDTO();
            accountDTO.setAccountID(AccountID);
            AccountDAO dao = new AccountDAO();
            dao.delete(accountDTO);
            response.sendRedirect("WalletController");

        } else if (action.equals("addfund")) {
            String balance = request.getParameter("balance");
            String AccountID = request.getParameter("accountlist");
            int CategoryID = Integer.parseInt(request.getParameter("category"));
            String Name = request.getParameter("incomeName");
            String note =request.getParameter("note");
            String date =request.getParameter("date");
            TransactionDTO income = new TransactionDTO();

            TransactionDAO dao = new TransactionDAO();

            income.setUserID(currentUser.getUserID());

            int index = 0;
            List<TransactionDTO> transactions = dao.getAllTransactions(currentUser);
            for (TransactionDTO transactionDTO : transactions) {
                if (transactionDTO.getName().contains(Name)) {

                    index++;
                }
            }
            if (index > 0) {
                Name += "(" + Integer.toString(index) + ")";
            }
            income.setName(Name);
            income.setTransactionType("income");
            income.setDate(date);

            income.setAmount(Integer.parseInt(balance));

            income.setAccountID(Integer.parseInt(AccountID));
            income.setCategoryID(CategoryID);
            income.setNote(note);
            dao.insert(income);
            response.sendRedirect("WalletController");

        } else if (action.equals("transfer")) {
            long balance = Long.parseLong(request.getParameter("balance"));
            int FromAccountID = Integer.parseInt(request.getParameter("fromaccount"));
            String ToaccountID = request.getParameter("toaccount");
            LocalDate currentDate = LocalDate.now();

            // Định dạng thời gian theo "dd-MM-yyyy"
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = currentDate.format(formatter);
            TransferDTO transfer = new TransferDTO();
            transfer.setDate(formattedDate);
            transfer.setUserID(currentUser.getUserID());
            TransferDAO dao = new TransferDAO();
            for (AccountDTO accountDTO : acclist) {
                if (accountDTO.getAccountID() == FromAccountID) {
                    if (accountDTO.getBalance() >= balance) {
                        transfer.setFromAccountID(FromAccountID);
                        transfer.setAmount(balance);
                    } else {
                        request.setAttribute("error", "Your account does not have enough money to transfer");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("wallet.jsp");
                        dispatcher.forward(request, response);

                    }
                }
            }
            transfer.setToAccountID(Integer.parseInt(ToaccountID));
            dao.insert(transfer);
            response.sendRedirect("WalletController");

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
        HttpSession session = request.getSession();
        UserDTO currentUser = (UserDTO) session.getAttribute("usersession");
        AccountDAO account = new AccountDAO();
        List<AccountDTO> acclist = account.findAll(currentUser);
        UserDAO user = new UserDAO();
        UserDTO userDTO = user.info(currentUser.getUserID()).get(0);
        request.setAttribute("user", userDTO);
        request.setAttribute("accountList", acclist);
        RequestDispatcher rd = request.getRequestDispatcher("wallet.jsp");
        rd.forward(request, response);
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
