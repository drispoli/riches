package com.fortify.samples.riches.oper;

import com.opensymphony.xwork2.ActionSupport;
import com.fortify.samples.riches.database.ConnFactory;
import com.fortify.samples.riches.model.ProfileService;
import com.fortify.samples.riches.model.Message;
import com.fortify.samples.riches.model.MessageService;

import java.io.InputStream;
import java.sql.Date;
import java.sql.Connection;
import java.sql.Statement;

public class SendMessage extends ActionSupport {

    private String to;
    private String subject;
    private String body;
    private String severity;

    public String execute(){

        if (isInvalidEmail(to)) return INPUT;

        String[] cmd = getMailCommand();
        String message = sendMail(cmd);

        addActionMessage(message);
        return SUCCESS;
    }

    private static  boolean isInvalidEmail(String email)
    {

	System.out.println("email: " + email);
        if (email != null && email.matches("[0-9a-zA-Z\\.\\-_]+@.+"))
            return false;
        else
            return true;
    }

    public String[] getMailCommand()
    {
        String java = System.getProperty("java.home") + "/bin/java";
        String cp = System.getProperty("catalina.home") + "/webapps/riches/WEB-INF/classes";

        String[] cmd = new String[3];
        if (System.getProperty("os.name").toLowerCase().contains("windows"))
        {
            cmd[0] = "cmd.exe";
            cmd[1] = "/c";
        }
        else
        {
            cmd[0] = "/bin/sh";
            cmd[1] = "-c";
        }
        cmd[2] = java + " -cp "+ cp +" com.fortify.samples.riches.legacy.mail.SendMail \"" + subject + "\" \"" + severity + "\" \"" + body + "\" " + to;

        return cmd;
    }

    public String sendMail(String[] cmd)
    {
        Runtime rt = Runtime.getRuntime();
        //call "legacy" mail program
        Process proc = null;
        StringBuilder message = new StringBuilder();
        try
        {
            proc = rt.exec(cmd);
            System.out.println(cmd[2]);

            InputStream is = proc.getInputStream();
            byte[] buf = new byte[256];
            int read;
            while( (read = is.read()) > 0)
            {
                message.append((char)read);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if (proc != null)
                proc.destroy();
        }

        //update local mail too
        updateMail();
        return message.toString();
    }

   private void updateMail() {
        String sender = "Riches Bank";
        Date date = new Date(System.currentTimeMillis());
        try
        {
            System.out.println(ProfileService.getUsername(to));
            System.out.println(sender);
            System.out.println(subject);
	    System.out.println(severity);
            System.out.println(body);
            System.out.println(date);
            
	    Message message = new Message(ProfileService.getUsername(to), sender, subject, severity, body, date);
            MessageService.addMessage(message);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }        
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String severity) {
        this.severity = severity;
    }
}