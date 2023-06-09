package com.fortify.samples.riches.model;

public class Account
{
    private Long id;
    private String username;
    private String acctno;
    private double balance;

    public Account()
    {
    }
    
    public Account(Long id, String username, String acctno, double balance) {
        this.id = id;
        this.username = username;
        this.acctno = acctno;
        this.balance = balance;
    }

    public Account(String username, String acctno, double balance) {
        this.username = username;
        this.acctno = acctno;
        this.balance = balance;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAcctno() {
        return acctno;
    }

    public void setAcctno(String acctno) {
        this.acctno = acctno;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }
}
