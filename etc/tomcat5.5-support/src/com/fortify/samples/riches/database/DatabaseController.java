package com.fortify.samples.riches.database;

import org.apache.tomcat.dbcp.dbcp.BasicDataSource;

import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseController implements ServletContextListener {

	private BasicDataSource datasource = null;
	public static final String JDBC_RESOURCES = "java:comp/env/jdbc/riches";

    /**
	 * Makes a string safe for use in regex replace (String.replaceAll(), Matcher.appendReplacement())
	 * by escaping any special characters
	 */
	public static String sanitizeForReplace(String val){
		val = val.replaceAll("[\\\\]", "\\\\\\\\");
		return val.replaceAll("[\\$]", "\\\\\\$");
	}

	public void contextInitialized(ServletContextEvent event) {

		try {
			datasource = (org.apache.tomcat.dbcp.dbcp.BasicDataSource)new InitialContext().lookup(JDBC_RESOURCES);
		} catch (NamingException ex) {
			throw new RuntimeException("Could not locate JNDI information for JDBC (" + JDBC_RESOURCES + ").\n"
					+ "Riches will not be able to connect to any database.\n"
					+ "This problem must be corrected before proceeding.");
		}

		datasource.setUrl(datasource.getUrl().replaceAll("TOMCAT_HOME", sanitizeForReplace(System.getProperty("catalina.home"))));
		System.out.println("Starting built in database in-process with Tomcat...");
		System.out.println("JDBC URL is: " + datasource.getUrl());
	}


	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("Stopping the built in database...");
		try {
			Connection conn = datasource.getConnection();
			conn.createStatement().execute("SHUTDOWN COMPACT");
			conn.close();
		}
		catch(SQLException e) {
			System.err.println("Cannot shutdown the builtin database:" + e.getMessage());
		}
	}
}



