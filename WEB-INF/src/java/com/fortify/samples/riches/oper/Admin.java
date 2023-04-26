package com.fortify.samples.riches.oper;

import com.opensymphony.xwork2.ActionSupport;
import com.fortify.samples.riches.model.ProfileService;

import java.util.List;

import org.apache.struts2.ServletActionContext;

public class Admin extends ActionSupport
{
    private List addresses;
    private boolean auth;

    public String execute() throws Exception
    {
        addresses = ProfileService.getAllEmail();
        setAuth(AdminUtil.isAuth(ServletActionContext.getRequest()));
        return SUCCESS;
    }


    public boolean isAuth() {
        return auth;
    }

    public void setAuth(boolean auth) {
        this.auth = auth;
    }

    public List getAddresses() {
        return addresses;
    }

    public void setAddresses(List addresses) {
        this.addresses = addresses;
    }
}
