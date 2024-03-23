/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account;

import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.List;
import user.UserDTO;
import util.GenericDAO;

/**
 *
 * @author 84933
 */
public class AccountDAO extends GenericDAO<AccountDTO> {

    @Override
    public List<AccountDTO> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(AccountDTO t) {
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("AccountName", t.getAccountName());
        parameterMap.put("WalletType", t.getWalletType());
        parameterMap.put("UserID", t.getUserID());
        parameterMap.put("Balance", t.getBalance());
        parameterMap.put("Note", t.getNote());
        String sql; 
        switch(t.getWalletType()){
            case 2 :
                sql= "INSERT INTO [dbo].[Account]\n"
                + "           ([AccountName]\n"
                + "           ,[WalletType]\n"
                + "           ,[UserID]\n"
                + "           ,[Balance]\n"
                + "           ,[Note]\n"
                + "           ,[BankID])\n"
   
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
     
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
              parameterMap.put("BankID", t.getBankID());
              break;
            case 3:
                 sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([AccountName]\n"
                + "           ,[WalletType]\n"
                + "           ,[UserID]\n"
                + "           ,[Balance]\n"
                + "           ,[Note]\n"
                + "           ,[EWalletID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
  
                + "           ,?\n"
                + "           ,?)";
           parameterMap.put("EWalletID", t.getEWalletID());
           break;
           default:
               sql= "INSERT INTO [dbo].[Account]\n"
                + "           ([AccountName]\n"
                + "           ,[WalletType]\n"
                + "           ,[UserID]\n"
                + "           ,[Balance]\n"
                + "           ,[Note])\n"

                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
             
                + "           ,?)";
               break;
        }

        return insertGenericDAO(sql, parameterMap);
    }

    public List<AccountDTO> findAll(UserDTO currentUser) {
        String sql = "SELECT * FROM Account a WHERE a.UserID = ? AND a.IsActive =1 ";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("UserID", currentUser.getUserID());
        List<AccountDTO> list = queryGenericDAO(AccountDTO.class, sql, parameterMap);
        //tra ve du lieu can

        return list;
    }

    public void update(AccountDTO accountDTO) {
         parameterMap = new LinkedHashMap<>();
        parameterMap.put("AccountName", accountDTO.getAccountName());
        parameterMap.put("WalletType", accountDTO.getWalletType());
        parameterMap.put("Note", accountDTO.getNote());
        String sql;
        switch (accountDTO.getWalletType()) {
            case 2:
                sql= "UPDATE [dbo].[Account]\n"
                        + "   SET [AccountName] = ?\n"
                        + "      ,[WalletType] = ?\n"
                        + "      ,[Note] = ?\n"
                        + "      ,[BankID] = ?\n"
                        + "      ,[EWalletID] = ?\n"
                        + " WHERE [AccountID] = ?";
                parameterMap.put("BankID", accountDTO.getBankID());
                parameterMap.put("EWalletID",null);
                break;
            case 3:
                sql= "UPDATE [dbo].[Account]\n"
                        + "   SET [AccountName] = ?\n"
                        + "      ,[WalletType] = ?\n"
                        + "      ,[Note] = ?\n"
                        + "      ,[BankID] = ?\n"
                        + "      ,[EWalletID] = ?\n"
                        + " WHERE [AccountID] = ?";
                parameterMap.put("BankID",null);
                parameterMap.put("EWalletID", accountDTO.getEWalletID());
                break;
            default:
                sql= "UPDATE [dbo].[Account]\n"
                        + "   SET [AccountName] = ?\n"
                        + "      ,[WalletType] = ?\n"
                        + "      ,[Note] = ?\n"
                        + "      ,[BankID] = ?\n"
                        + "      ,[EWalletID] = ?\n"
                        + " WHERE [AccountID] = ?";
                parameterMap.put("BankID",null);
                parameterMap.put("EWalletID",null);
                break;
        }
        parameterMap.put("AccountID", accountDTO.getAccountID());
        updateGenericDAO(sql, parameterMap);
    }

    public void delete(AccountDTO accountDTO) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [IsActive] = 0\n"
                + " WHERE [AccountID]=?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("AccountID", accountDTO.getAccountID());
        deleteGenericDAO(sql, parameterMap);
    }

    public static void main(String[] args) {
         AccountDTO dto =new AccountDTO();
         dto.setAccountName("test");
         dto.setBalance(0);
         dto.setBankID(3);
         dto.setWalletType(2);
         dto.setUserID(1);
         dto.setNote(null);
         dto.setAccountID(26);
        AccountDAO dao= new AccountDAO();
         dao.update(dto);
         System.out.println(dto.toString());
    }
}
