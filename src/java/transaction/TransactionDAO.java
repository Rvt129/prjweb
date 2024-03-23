/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transaction;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import user.UserDTO;
import util.GenericDAO;

/**
 *
 * @author 84933
 */
public class TransactionDAO extends GenericDAO<TransactionDTO> {

    @Override
    public List<TransactionDTO> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List<TransactionDTO> getAllTransactions(UserDTO currentUser) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Transaction] WHERE [UserID] =?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("UserID", currentUser.getUserID());
        List<TransactionDTO> list = queryGenericDAO(TransactionDTO.class, sql, parameterMap);
        return list;
    }
    
    public List<TransactionDTO> sortTransactions(List<TransactionDTO> list, int categoryId, int accountId, String type, String date) {
        List<TransactionDTO> sortedList = new ArrayList<>(list);

        // Filter by category ID
        if (categoryId > 0) {
            sortedList.removeIf(transaction -> transaction.getCategoryID() != categoryId);
        }

        // Filter by account ID
        if (accountId > 0) {
            sortedList.removeIf(transaction -> transaction.getAccountID() != accountId);
        }

        // Filter by transaction type (income/expense)
        if (!type.isEmpty()) {
            sortedList.removeIf(transaction -> !transaction.getTransactionType().equalsIgnoreCase(type));
        }

        // Sort by date (ascending/descending)
        if (!date.isEmpty()) {
            if (date.equalsIgnoreCase("asc")) {
                Collections.sort(sortedList, Comparator.comparing(TransactionDTO::getDate));
            } else if (date.equalsIgnoreCase("desc")) {
                Collections.sort(sortedList, Comparator.comparing(TransactionDTO::getDate).reversed());
            }
        }

        return sortedList;
    }

    @Override
    public int insert(TransactionDTO t) {
        String sql = "INSERT INTO [dbo].[Transaction]\n"
                + "           ([UserID]\n"
                + "           ,[Name]\n"
                + "           ,[Amount]\n"
                + "           ,[Date]\n"
                + "           ,[TransactionType]\n"
                + "           ,[AccountID]\n"
                + "           ,[CategoryID]\n"
                + "           ,[Note])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("UserID", t.getUserID());
        parameterMap.put("Name", t.getName());
        parameterMap.put("Amount", t.getAmount());
        parameterMap.put("Date", t.getDate());
        parameterMap.put("TransactionType", t.getTransactionType());
        parameterMap.put("AccountID", t.getAccountID());
        parameterMap.put("CategoryID", t.getCategoryID());
        parameterMap.put("Note", t.getNote());
        return insertGenericDAO(sql, parameterMap);
    }

    public void update(TransactionDTO t) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET Balance = Balance+t.Amount\n"
                + "   FROM [dbo].[Account] a,[dbo].[Transaction] t\n"
                + " WHERE a.[AccountID]=? AND t.TransactionID=?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("AccountID", t.getAccountID());
        parameterMap.put("TransactionID", t.getTransactionID());
        updateGenericDAO(sql, parameterMap);
    }

    public void delete(TransactionDTO t) {
        String sql = "DELETE FROM [dbo].[Transaction]\n"
                + "WHERE [TransactionID] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("TransactionID", t.getTransactionID());
        deleteGenericDAO(sql, parameterMap);
    }

    public void updateExpense(TransactionDTO t) {
        // Update account balance
        String accountSql = "UPDATE [dbo].[Account]\n"
                + "   SET [Balance] = [Balance] + t.Amount \n"
                + "   FROM [dbo].[Account] a, [dbo].[Transaction] t\n"
                + "WHERE a.[AccountID] = ? and t.[TransactionID] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("AccountID", t.getAccountID());
        parameterMap.put("TransactionID", t.getTransactionID());
        updateGenericDAO(accountSql, parameterMap);
    }

    public void updateExpense2(TransactionDTO t) {
        String userSql = "UPDATE [dbo].[User]\n"
                + "   SET[CurrentBalance] = [CurrentBalance] + t.Amount\n"
                + "      ,[ExpenseAmount] = [ExpenseAmount] - t.Amount\n"
                + "	  FROM [dbo].[User] a, [dbo].[Transaction] t\n"
                + " WHERE a.[UserID] = ? and t.[TransactionID] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("UserID", t.getUserID());
        parameterMap.put("TransactionID", t.getTransactionID());
        updateGenericDAO(userSql, parameterMap);
    }

    public void updateIncome(TransactionDTO t) {
        String accountSql = "UPDATE [dbo].[Account]\n"
                + "   SET [Balance] = [Balance] - t.Amount \n"
                + "     FROM [dbo].[Account] a, [dbo].[Transaction] t\n"
                + " WHERE a.[AccountID] = ? and t.[TransactionID] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("AccountID", t.getAccountID());
        parameterMap.put("TransactionID", t.getTransactionID());
        updateGenericDAO(accountSql, parameterMap);
    }

    public void updateIncome2(TransactionDTO t) {
        String userSql = "UPDATE [dbo].[User]\n"
                + "   SET [CurrentBalance] = [CurrentBalance] - t.Amount \n"
                + "	  FROM [dbo].[User] a, [dbo].[Transaction] t\n"
                + " WHERE a.[UserID] = ? and t.[TransactionID] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("UserID", t.getUserID());
        parameterMap.put("TransactionID", t.getTransactionID());
        updateGenericDAO(userSql, parameterMap);
    }

    public static void main(String[] args) {
        // Create a sample TransactionDTO
        TransactionDTO transaction = new TransactionDTO();
        transaction.setTransactionID(7); // Set TransactionID to a valid ID
        transaction.setTransactionType("income"); // Set TransactionType to either "expense" or "income"
        transaction.setAccountID(8); // Set AccountID to a valid ID
        transaction.setUserID(2); // Set UserID to a valid ID
        TransactionDAO yourClass = new TransactionDAO();
        switch (transaction.getTransactionType()) {
            case "expense":
                yourClass.updateExpense(transaction);
                yourClass.updateExpense2(transaction);
                break;
            case "income":
                yourClass.updateIncome(transaction);
                yourClass.updateIncome2(transaction);
                break;
        }

        // Create an instance of YourClass
        // Test the delete method
        // Optionally, test other methods as needed
    }

    public List<TransactionDTO> info(int exid) {
         String sql = "SELECT *\n"
                + "  FROM [dbo].[Transaction] WHERE [TransactionID] =?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("TransactionID", exid);
        List<TransactionDTO> list = queryGenericDAO(TransactionDTO.class, sql, parameterMap);
        return list;
    }
    
}
