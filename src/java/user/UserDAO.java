/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import util.GenericDAO;

/**
 *
 * @author 84933
 */
public class UserDAO extends GenericDAO<UserDTO> {

    @Override
    public List<UserDTO> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(UserDTO user) {
        String sql = "INSERT INTO [dbo].[User] ([Username], [Email], [Password], [CurrentBalance], [ExpenseAmount]) VALUES (?, ?, ?,?,?)";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("Username", user.getUsername());
        parameterMap.put("Email", user.getEmail());
        parameterMap.put("Password", user.getPassword());
        parameterMap.put("CurrentBalance", "0");
        parameterMap.put("ExpenseAmount", "0");

        return insertGenericDAO(sql, parameterMap);
    }

    public List<UserDTO> getUserByEmail(String email) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[User] WHERE [Email] =?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("Email", email);
        List<UserDTO> list = queryGenericDAO(UserDTO.class, sql, parameterMap);
        return list;
    }

    public List<UserDTO> info(int id) {
        String sql = "SELECT * FROM [dbo].[User] WHERE [UserID] =?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("UserID", id);
        List<UserDTO> list = queryGenericDAO(UserDTO.class, sql, parameterMap);
        return list;
    }

    public List<UserDTO> login(String email, String password) {
        String sql = "SELECT * FROM [dbo].[User]\n"
                + "  WHERE [Email]=? AND [Password]=?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("Email", email);
        parameterMap.put("Password", password);
        List<UserDTO> list = queryGenericDAO(UserDTO.class, sql, parameterMap);
        return list;
    }

    public boolean update(UserDTO userdto) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Username] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[Password] = ?\n"
                + " WHERE [UserID] =?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("Username", userdto.getUsername());
        parameterMap.put("Email", userdto.getEmail());
        parameterMap.put("Password", userdto.getPassword());
        parameterMap.put("UserID", userdto.getUserID());
        return updateGenericDAO(sql, parameterMap);

    }
    public static void main(String[] args) {
        UserDAO dAO=new UserDAO();
        UserDTO dto =new UserDTO(6, "thu", "thuvnbse183213@fpt.edu.vn", "1234", 0, 0);
        dAO.update(dto);
        UserDTO tO=dAO.info(6).get(0);
        System.out.println(tO.toString());
    }
}
