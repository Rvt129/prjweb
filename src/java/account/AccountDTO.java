/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account;


import lombok.ToString;

/**
 *
 * @author 84933
 */
@ToString



public class AccountDTO {
    private int AccountID;
    private String AccountName;
    private int WalletType;
    private int UserID;
    private int BankID;
    private int EWalletID;
    private long Balance =0 ;
    private String Note;
    private int IsActive = 1;

    public AccountDTO(int AccountID, String AccountName, int WalletType, int UserID, int BankID, int EWalletID, long Balance, String Note) {
        this.AccountID = AccountID;
        this.AccountName = AccountName;
        this.WalletType = WalletType;
        this.UserID = UserID;
        this.BankID = BankID;
        this.EWalletID = EWalletID;
        this.Balance = Balance;
        this.Note = Note;
    }

    public AccountDTO(String AccountName, int WalletType, int UserID, int BankID, int EWalletID, String Note) {
        this.AccountName = AccountName;
        this.WalletType = WalletType;
        this.UserID = UserID;
        this.BankID = BankID;
        this.EWalletID = EWalletID;
        this.Note = Note;
    }

    public AccountDTO() {
    }
    
    public String getAccountName() {
        return this.AccountName;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public void setAccountName(String AccountName) {
        this.AccountName = AccountName;
    }

    public void setWalletType(int WalletType) {
        this.WalletType = WalletType;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public void setBankID(int BankID) {
        this.BankID = BankID;
    }

    public void setEWalletID(int EWalletID) {
        this.EWalletID = EWalletID;
    }

    public void setBalance(long Balance) {
        this.Balance = Balance;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public void setIsActive(int IsActive) {
        this.IsActive = IsActive;
    }

    public int getAccountID() {
        return AccountID;
    }

    public int getWalletType() {
        return WalletType;
    }

    public int getUserID() {
        return UserID;
    }

    public int getBankID() {
        return BankID;
    }

    public int getEWalletID() {
        return EWalletID;
    }

    public long getBalance() {
        return Balance;
    }

    public String getNote() {
        return Note;
    }

    public int getIsActive() {
        return IsActive;
    }
    
    
}
