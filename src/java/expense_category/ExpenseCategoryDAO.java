/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package expense_category;

import java.util.LinkedHashMap;
import java.util.List;
import util.GenericDAO;

/**
 *
 * @author 84933
 */
public class ExpenseCategoryDAO extends GenericDAO<ExpenseCategoryDTO>{

    @Override
    public List<ExpenseCategoryDTO> findAll() {
        String sql="SELECT * FROM [dbo].[ExpenseCategory]";
        List <ExpenseCategoryDTO> category =  queryGenericDAO(ExpenseCategoryDTO.class);
        return category;
    }

    @Override
    public int insert(ExpenseCategoryDTO t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<ExpenseCategoryDTO> findCate(int cate) {
        String sql="SELECT * FROM [dbo].[ExpenseCategory] WHERE [CategoyID]=?";
         parameterMap = new LinkedHashMap<>();
        parameterMap.put("CategoryID", cate);
        return queryGenericDAO(ExpenseCategoryDTO.class, sql, parameterMap);
    }
    
}
