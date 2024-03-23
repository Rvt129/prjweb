/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.io.IOException;
import java.time.Year;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import transaction.TransactionDAO;
import transaction.TransactionDTO;
import user.UserDTO;

/**
 *
 * @author 84933
 */
public class ReportController extends HttpServlet {

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
        UserDTO currentUser = null;

        currentUser = (UserDTO) session.getAttribute("usersession");
        log("Debug: " + currentUser);
        if (currentUser == null) {
            log("Debug: Redirect to login page" + currentUser);
            response.sendRedirect("login.jsp");
            return;
        }
        TransactionDAO dao = new TransactionDAO();
        Map<Integer, Long> categorySpending = new HashMap<>();
        List<TransactionDTO> transactions = dao.getAllTransactions(currentUser);
        Map<Integer, Long> monthlyExpenses = new HashMap<>();
        if (action == null || action.equals("report")) {

            Year currentYear = Year.now();
            String yearAsString = String.valueOf(currentYear);
            for (TransactionDTO transaction : transactions) {
                String getYear = transaction.getDate().substring(0, 4);
                if (yearAsString.equalsIgnoreCase(getYear)) {
                    int month = Integer.parseInt(transaction.getDate().substring(5, 7));
                    long amount = transaction.getAmount();
                    if (transaction.getTransactionType().equals("expense")) {
                        monthlyExpenses.put(month, monthlyExpenses.getOrDefault(month, 0L) + amount);
                    }
                }
            }
            List<Long> data = new ArrayList<>();
            for (int i = 1; i <= 12; i++) {
                data.add(monthlyExpenses.getOrDefault(i, 0L));
            }
            StringBuilder jsonBuilder = new StringBuilder("[");
            for (int i = 0; i < data.size(); i++) {
                jsonBuilder.append(data.get(i));
                if (i < data.size() - 1) {
                    jsonBuilder.append(",");
                }
            }

            jsonBuilder.append("]");
            String dataJs = jsonBuilder.toString();
            //pie

            for (TransactionDTO dto : transactions) {
                if (dto.getTransactionType().equals("expense")) {
                    if (dto.getDate().substring(0, 4).equalsIgnoreCase(yearAsString)) {
                        int cate = dto.getCategoryID();
                        long amount = dto.getAmount();
                        categorySpending.put(cate, categorySpending.getOrDefault(cate, 0L) + amount);
                    }
                }
            }
            if (categorySpending.isEmpty()) {
                request.setAttribute("notice", "No record expenditure notes for this year.");
            }
            request.setAttribute("categorySpending", categorySpending);

            long shopping = 0;
            long rent = 0;
            long other = 0;
            long transport = 0;
            long food = 0;
            long entertain = 0;
            long edu = 0;
            long health = 0;
            long income = 0;
            for (TransactionDTO dto : transactions) {
                if (dto.getTransactionType().equals("expense")) {
                    if (dto.getDate().substring(0, 4).equalsIgnoreCase(yearAsString)) {
                        if (dto.getCategoryID() == 1) {
                            food += dto.getAmount();
                        } else if (dto.getCategoryID() == 2) {
                            transport += dto.getAmount();
                        } else if (dto.getCategoryID() == 3) {
                            shopping += dto.getAmount();
                        } else if (dto.getCategoryID() == 4) {
                            rent += dto.getAmount();
                        } else if (dto.getCategoryID() == 5) {
                            entertain += dto.getAmount();
                        } else if (dto.getCategoryID() == 6) {
                            edu += dto.getAmount();
                        } else if (dto.getCategoryID() == 7) {
                            health += dto.getAmount();
                        } else if (dto.getCategoryID() == 8) {
                            income += dto.getAmount();
                        } else if (dto.getCategoryID() == 9) {
                            other += dto.getAmount();
                        }

                    }
                }
            }
            request.setAttribute("shopping", shopping);
            request.setAttribute("food", food);
            request.setAttribute("transport", transport);
            request.setAttribute("rent", rent);
            request.setAttribute("entertain", entertain);
            request.setAttribute("edu", edu);
            request.setAttribute("health", health);
            request.setAttribute("income", income);
            request.setAttribute("other", other);

            request.setAttribute("dataJs", dataJs);
            request.setAttribute("yearselect", yearAsString);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);

        } else if (action.equals("reportyear")) {
            String year = request.getParameter("year");

            for (TransactionDTO transaction : transactions) {
                String getYear = transaction.getDate().substring(0, 4);
                if (year.equalsIgnoreCase(getYear)) {
                    int month = Integer.parseInt(transaction.getDate().substring(5, 7));
                    long amount = transaction.getAmount();
                    if (transaction.getTransactionType().equals("expense")) {
                        monthlyExpenses.put(month, monthlyExpenses.getOrDefault(month, 0L) + amount);
                    }

                }
            }
            List<Long> data = new ArrayList<>();
            for (int i = 1; i <= 12; i++) {
                data.add(monthlyExpenses.getOrDefault(i, 0L));
            }
            StringBuilder jsonBuilder = new StringBuilder("[");
            for (int i = 0; i < data.size(); i++) {
                jsonBuilder.append(data.get(i));
                if (i < data.size() - 1) {
                    jsonBuilder.append(",");
                }
            }
            jsonBuilder.append("]");
            String dataJs = jsonBuilder.toString();

            //pie
            for (TransactionDTO dto : transactions) {
                if (dto.getTransactionType().equals("expense")) {
                    if (dto.getDate().substring(0, 4).equalsIgnoreCase(year)) {
                        int cate = dto.getCategoryID();
                        long amount = dto.getAmount();
                        categorySpending.put(cate, categorySpending.getOrDefault(cate, 0L) + amount);
                    }
                }
            }
            if (categorySpending.isEmpty()) {
                request.setAttribute("notice", "No record expenditure notes for this year.");
            }
            request.setAttribute("categorySpending", categorySpending);

            long shopping = 0;
            long rent = 0;
            long other = 0;
            long transport = 0;
            long food = 0;
            long entertain = 0;
            long edu = 0;
            long health = 0;
            long income = 0;
            for (TransactionDTO dto : transactions) {
                if (dto.getTransactionType().equals("expense")) {
                    if (dto.getDate().substring(0, 4).equalsIgnoreCase(year)) {
                        if (dto.getCategoryID() == 1) {
                            food += dto.getAmount();
                        } else if (dto.getCategoryID() == 2) {
                            transport += dto.getAmount();
                        } else if (dto.getCategoryID() == 3) {
                            shopping += dto.getAmount();
                        } else if (dto.getCategoryID() == 4) {
                            rent += dto.getAmount();
                        } else if (dto.getCategoryID() == 5) {
                            entertain += dto.getAmount();
                        } else if (dto.getCategoryID() == 6) {
                            edu += dto.getAmount();
                        } else if (dto.getCategoryID() == 7) {
                            health += dto.getAmount();
                        } else if (dto.getCategoryID() == 8) {
                            income += dto.getAmount();
                        } else if (dto.getCategoryID() == 9) {
                            other += dto.getAmount();
                        }

                    }
                }
            }
            request.setAttribute("shopping", shopping);
            request.setAttribute("food", food);
            request.setAttribute("transport", transport);
            request.setAttribute("rent", rent);
            request.setAttribute("entertain", entertain);
            request.setAttribute("edu", edu);
            request.setAttribute("health", health);
            request.setAttribute("income", income);
            request.setAttribute("other", other);
            // Truyền dataJson trong phản hồi
            request.setAttribute("dataJs", dataJs);
            request.setAttribute("yearselect", year);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
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
