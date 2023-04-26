package com.fortify.samples.riches.model;

import net.sf.hibernate.*;
import com.fortify.samples.riches.database.ConnectionFactory;
import org.apache.struts2.ServletActionContext;

import java.util.List;
import java.util.logging.Logger;
import java.util.logging.FileHandler;
import java.util.logging.Level;

public class TransactionService {

    public static List getTransactions(String acctno) throws Exception
    {
        Session session = ConnectionFactory.getInstance().getSession();
        String queryStr = "from Transaction transaction where transaction.acctno ='" + acctno + "' ORDER BY date DESC";
        ServletActionContext.getServletContext().log(queryStr);    
        Query query = session.createQuery(queryStr);
        List transactions = query.list();
        session.close();
		
		// TODO: remove this before deploying to production
		debugTransactions(transactions);
        return transactions;
    }

	public static List getTransactions(Long acctno) throws Exception
    {
        Session session = ConnectionFactory.getInstance().getSession();
        String queryStr = "from Transaction transaction where transaction.acctno ='" + acctno + "' ORDER BY date DESC";
        if (ServletActionContext.getServletContext() != null)
			ServletActionContext.getServletContext().log(queryStr);    
        Query query = session.createQuery(queryStr);
        List transactions = query.list();
        session.close();
		
        return transactions;
    }
	
	public static void debugTransactions(List transactions) throws Exception 
	{
		Logger debugLogger = Logger.getLogger(TransactionService.class.getName());
		debugLogger.setLevel(Level.FINEST);
		FileHandler fh = new FileHandler("debug.log");
		fh.setLevel(Level.FINEST);
		debugLogger.addHandler(fh);
		
		for (int index=0; index < transactions.size(); index++)
		{
			Transaction proposedTransaction = (Transaction)transactions.get(index);
			String privateTransactionMessage = "Request transaction statement: "+proposedTransaction.getId()+": "
			+ proposedTransaction.getAcctno() + "; "
			+ proposedTransaction.getAmount() + "; "
			+ proposedTransaction.getDate() + "; "
			+ proposedTransaction.getDescription();
			
			debugLogger.finest(privateTransactionMessage);	
		}
	}
	
    public static void addTransaction(Transaction transaction)
    {
        Session session = null;
        try
        {
            session = ConnectionFactory.getInstance().getSession();
            net.sf.hibernate.Transaction tx = session.beginTransaction();
            session.save(transaction);
            tx.commit();
            session.flush();
            session.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
