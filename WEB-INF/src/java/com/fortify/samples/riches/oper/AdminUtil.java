package com.fortify.samples.riches.oper;

import com.fortify.samples.riches.database.ConnFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Cookie;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.List;

public class AdminUtil
{
    public static boolean isAdmin(int roleid) throws Exception
    {
        boolean auth = false;
        Connection conn = ConnFactory.getInstance().getConnection();
        ResultSet rs = null;
        try
        {
            Statement statement =  conn.createStatement();
            rs = statement.executeQuery("SELECT rolename FROM auth WHERE roleid = " + roleid);
            rs.next();

            if (rs !=null && rs.getString("rolename").equals("admin"))
                auth =  true;
            conn.close();
        }
        catch(Exception e)
        {
            throw e;         
        }
        return auth;
    }

	public static void debugAdminRoles(List roles) throws Exception
    {
        boolean auth = false;

		Connection conn = null;
		Statement statement = null;
		ResultSet rs = null;

        try {
		  conn = ConnFactory.getInstance().getConnection();
          statement =  conn.createStatement();

		  for (int index=0; index < roles.size(); index++) {
		    int roleid = ((Integer)roles.get(index)).intValue();

            rs = statement.executeQuery("SELECT rolename FROM auth WHERE roleid = " + roleid);
            rs.next();

            if (rs !=null && rs.getString("rolename").equals("admin")) {
                System.err.println("Roleid: "+roleid+" is an admin");
				rs.close();
				rs = null; ;
			}
		  }
        }
        catch(Exception e) {
			if (rs != null) {
				rs.close();
				rs = null;
			}
            throw e;
        }
		finally {
		   System.err.println("Terminating here temporarily");
		   System.exit(-1);

		   if (statement != null) {
			   statement.close();
			   statement = null;
		   }
		}
    }
    
    public static boolean isAuth(HttpServletRequest request) throws Exception
    {
        Cookie[] cookies = request.getCookies();
        int authType = -1;
        for (int i=0; i<cookies.length;i++)
        {
            if (cookies[i].getName().equals("authType"))
            {
                authType = Integer.parseInt(cookies[i].getValue());
                break;
            }
        }
        return AdminUtil.isAdmin(authType);
    }
}
