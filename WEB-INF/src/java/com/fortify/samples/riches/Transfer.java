package com.fortify.samples.riches;

import com.opensymphony.xwork2.ActionSupport;
import com.fortify.samples.riches.database.ConnectionFactory;
import com.fortify.samples.riches.model.Account;
import com.fortify.samples.riches.model.AccountService;
import net.sf.hibernate.Session;
import net.sf.hibernate.Query;
import net.sf.hibernate.Criteria;
import net.sf.hibernate.expression.Expression;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class Transfer extends ActionSupport 
{
    private List accounts;

    public String execute() throws Exception
    {
        HttpServletRequest request = ServletActionContext.getRequest();
        String username = request.getRemoteUser();
        accounts = AccountService.getAccounts(username);

        return SUCCESS;
    }

    public List getAccounts() {
        return accounts;
    }

    public void setAccounts(List accounts) {
        this.accounts = accounts;
    }
}