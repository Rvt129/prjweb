/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package e_wallet;

import java.util.List;
import util.GenericDAO;
import wallet.WalletDTO;

/**
 *
 * @author 84933
 */
public class EWalletDAO extends GenericDAO<EWalletDTO>{

    @Override
    public List<EWalletDTO> findAll() {
         String sql = "SELECT * FROM EWallet"; 
        List<EWalletDTO> list = queryGenericDAO(EWalletDTO.class);
        //tra ve du lieu can
        
        return list;    }

    @Override
    public int insert(EWalletDTO t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
  
    
}
