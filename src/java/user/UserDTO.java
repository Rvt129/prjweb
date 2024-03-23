/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

public class UserDTO {
    private int UserID;
    private String Username;
    private String Email;
    private String Password;
    private long CurrentBalance;
    private long ExpenseAmount;

    public UserDTO() {
    }

    public UserDTO(int UserID, String Username, String Email, String Password, long CurrentBalance, long ExpenseAmount) {
        this.UserID = UserID;
        this.Username = Username;
        this.Email = Email;
        this.Password = Password;
        this.CurrentBalance = CurrentBalance;
        this.ExpenseAmount = ExpenseAmount;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public long getCurrentBalance() {
        return CurrentBalance;
    }

    public void setCurrentBalance(long CurrentBalance) {
        this.CurrentBalance = CurrentBalance;
    }

    public long getExpenseAmount() {
        return ExpenseAmount;
    }

    public void setExpenseAmount(long ExpenseAmount) {
        this.ExpenseAmount = ExpenseAmount;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "UserID=" + UserID + ", Username=" + Username + ", Email=" + Email + ", Password=" + Password + ", CurrentBalance=" + CurrentBalance + ", ExpenseAmount=" + ExpenseAmount + '}';
    }
    
}
