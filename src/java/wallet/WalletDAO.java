/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wallet;

import java.util.List;
import util.GenericDAO;

/**
 *
 * @author 84933
 */
public class WalletDAO extends GenericDAO<WalletDTO>{

    @Override
    public List<WalletDTO> findAll() {
        String sql = "SELECT * FROM Wallet"; 
        List<WalletDTO> list = queryGenericDAO(WalletDTO.class);
        //tra ve du lieu can
        
        return list;
    }

    @Override
    public int insert(WalletDTO t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
    
}
