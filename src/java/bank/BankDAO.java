/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bank;

import java.util.List;
import util.GenericDAO;

/**
 *
 * @author 84933
 */
public class BankDAO extends GenericDAO<BankDTO>{

    @Override
    public List<BankDTO> findAll() {
        String sql = "SELECT * FROM Bank";
        List<BankDTO> list = queryGenericDAO(BankDTO.class);
        //tra ve du lieu can

        return list;
    }

    @Override
    public int insert(BankDTO t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
