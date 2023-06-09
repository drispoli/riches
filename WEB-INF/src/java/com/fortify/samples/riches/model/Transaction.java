package com.fortify.samples.riches.model;

import java.sql.Date;

public class Transaction
{
    private Long id;
    private String acctno;
    private String description;
    private double amount;
    private Date date;

    public Transaction() {
    }

    public Transaction(String acctno, double amount, Date date, String description, Long id) {
        this.acctno = acctno;
        this.amount = amount;
        this.date = date;
        this.description = description;
        this.id = id;
    }

    public Transaction(String acctno, double amount, Date date, String description) {
        this.acctno = acctno;
        this.amount = amount;
        this.date = date;
        this.description = description;
    }    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAcctno() {
        return acctno;
    }

    public void setAcctno(String acctno) {
        this.acctno = acctno;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
