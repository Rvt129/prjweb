/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transfer;

import java.util.LinkedHashMap;
import java.util.List;
import util.GenericDAO;

/**
 *
 * @author 84933
 */
public class TransferDAO extends GenericDAO<TransferDTO>{

    @Override
    public List<TransferDTO> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(TransferDTO t) {
        String sql="INSERT INTO [dbo].[Transfer]\n" +
"           ([FromAccountID]\n" +
"           ,[ToAccountID]\n" +
"           ,[Amount]\n" +
"           ,[UserID]\n" +
"           ,[Date])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("FromAccountID", t.getFromAccountID());
        parameterMap.put("ToAccountID", t.getToAccountID());
        parameterMap.put("Amount", t.getAmount());
        parameterMap.put("UserID", t.getUserID());
        parameterMap.put("Date", t.getDate());
        return insertGenericDAO(sql, parameterMap);
    }
    
}
