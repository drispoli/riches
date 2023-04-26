package com.fortify.samples.riches;

import com.opensymphony.xwork2.ActionSupport;
import com.fortify.samples.riches.database.ConnectionFactory;
import com.fortify.samples.riches.model.Account;
import com.fortify.samples.riches.model.AccountService;
import net.sf.hibernate.Session;
import net.sf.hibernate.Criteria;
import net.sf.hibernate.Transaction;
import net.sf.hibernate.expression.Expression;

public class PerformTransfer extends ActionSupport
{
    private String from;
    private String to;
    private double amount = 0;

    public String execute() throws Exception
    {
        if (amount <= 0 )
        {
            addFieldError("amount", "Enter an amount");
            return INPUT;
        }

        int status = AccountService.tranferFunds(from, to, amount);
        if (AccountService.NO_FUNDS == status)
        {
            addActionError("Not enough funds available");
            return ERROR;
        }
        addActionMessage("Transfer complete");
        return SUCCESS;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
}