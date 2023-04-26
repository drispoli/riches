package com.fortify.samples.riches.model;

import net.sf.hibernate.*;
import net.sf.hibernate.expression.Expression;
import java.util.List;
import java.sql.Date;


import com.fortify.samples.riches.database.ConnectionFactory;

public class AccountService
{
    public static final int NO_FUNDS = -1;
    public static final int SUCCESS = 0;

    public static boolean addAccount(Account account) throws Exception
    {
        Profile profile = ProfileService.getProfile(account.getUsername());
        if (profile == null)
            return false;

        Session session = null;
        try
        {
            session = ConnectionFactory.getInstance().getSession();
            net.sf.hibernate.Transaction tx = session.beginTransaction();
            session.save(account);
            tx.commit();
            session.flush();
            session.close();
        }
        catch(Exception e)
        {
            throw e;
        }
        finally
        {
            if (session != null)
                session.close();
        }
        return true;
    }

    public static List getAccounts(String username) throws Exception
    {
        Session session = null;
        try
        {
            session = ConnectionFactory.getInstance().getSession();
            Criteria criteria = session.createCriteria(Account.class);
            criteria.add(Expression.eq("username", username));
            return criteria.list();
        }
        catch(Exception e)
        {
            throw e;
        }
        finally
        {
            if (session != null)
                session.close();
        }
    }

    public static int writeCheck(String name, String addr, String memo, String acct, double amount) throws Exception
    {
        Account fromAcct;
        Session session = ConnectionFactory.getInstance().getSession();
        Criteria criteria = session.createCriteria(Account.class);

        criteria.add(Expression.eq("acctno", acct));
        fromAcct = (Account) criteria.uniqueResult();
System.out.println("check from: " + fromAcct.getAcctno());
        if (amount > fromAcct.getBalance())
        {
            return NO_FUNDS;
        }
        fromAcct.setBalance(fromAcct.getBalance() - amount);
        TransactionService.addTransaction(new Transaction(acct, -amount, new Date(System.currentTimeMillis()),"Check"));        

        net.sf.hibernate.Transaction transaction = null;
        session = ConnectionFactory.getInstance().getSession();
        try
        {
            transaction = session.beginTransaction();
            session.update(fromAcct);
            transaction.commit();
        }
        catch (Exception e)
        {
            if (transaction != null)
            {
                transaction.rollback();
                throw e;
            }

        }
        finally
        {
            session.close();
        }

        return SUCCESS;
    }

    public static int tranferFunds(String from, String to, double amount) throws Exception
    {
        Account fromAcct;
        Account toAcct;

        Session session = ConnectionFactory.getInstance().getSession();
        Criteria criteria = session.createCriteria(Account.class);
        criteria.add(Expression.eq("acctno", from));
        fromAcct = (Account) criteria.uniqueResult();
System.out.println("trans from: " + fromAcct.getAcctno());

        criteria = session.createCriteria(Account.class);
        criteria.add(Expression.eq("acctno", to));
        toAcct = (Account) criteria.uniqueResult();
System.out.println("trans to: " + toAcct.getAcctno());

        session.close();

        //Race
        if (amount > fromAcct.getBalance())
        {
            return NO_FUNDS;
        }

        fromAcct.setBalance(fromAcct.getBalance() - amount);
        TransactionService.addTransaction(new Transaction(from, -amount, new Date(System.currentTimeMillis()),"Withdrawl"));        
        toAcct.setBalance(toAcct.getBalance() + amount);
        TransactionService.addTransaction(new Transaction(to, amount, new Date(System.currentTimeMillis()),"Deposit"));
        net.sf.hibernate.Transaction transaction = null;
        session = ConnectionFactory.getInstance().getSession();
        try
        {
            transaction = session.beginTransaction();
            session.update(toAcct);
            session.update(fromAcct);
            transaction.commit();
        }
        catch (Exception e)
        {
            if (transaction != null)
            {
                transaction.rollback();
                throw e;
            }

        }
        finally
        {
            session.close();
        }

        return SUCCESS;
    }
    
}
