package com.cell2iwebservice.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;

import java.util.logging.Logger;
import java.util.logging.Level;

import com.cell2iwebservice.utilities.DatabaseOpener;
import com.cell2iwebservice.utilities.Properties;

public class DAO {
	protected static PreparedStatement preparedStatement = null;
	protected static CallableStatement callableStatement = null;
	protected static Connection sqlConnection            = null;
	protected static ResultSet resultSet                 = null;
	
	protected static final Logger DaoLogger = Logger.getLogger(DAO.class.getName());
    protected static String columnSeperator = Properties.getColumnSeperator();
	protected static String lineSeperator   = Properties.getLineSeperator();
	protected static String packageName     = Properties.getPackageName();
	

	public static void connectionOpen() throws SQLException {
		sqlConnection = DatabaseOpener.open();
	}

	// close all resultSet, preparedStatement, Connection
	public static void connectionClose() throws SQLException {
		try {
			resultSet.close();
			DaoLogger.info("DB: resultSet successfully closed.");
		} catch (Exception e) {
			DaoLogger.warning("DB: resultSet closing unsuccessfull!!!");
		}

		try {
			preparedStatement.close();
			DaoLogger.info("DB: preparedStatement successfully closed.");
		} catch (Exception e) {
			DaoLogger.warning("DB: preparedStatement closing unsuccessfull!!!");
		}

		try {
			sqlConnection.close();
			DaoLogger.info("Connection closed");
		} catch (Exception ex) {
			DaoLogger.log(Level.SEVERE, "DB: Connection Unsuccessful!", ex);
		}
	}

	// XXX:  not working, fix it without sql injection risk
	// TODO: fix it
	/*
	protected static String getFunctionInfo(String functionName, List<String> sqlFunctionParameters, int parameterCount) {
		String resultString = "";
		int parameterLength = 0;
		String infoSql = "";

		// set parameter string
		try {
			parameterLength = sqlFunctionParameters.size();
			infoSql = "{ ? = call " + packageName + "." + functionName + "(?";

			for (int i = 1; i < parameterLength; i++) {
				infoSql += ",?";
			}
			
			infoSql += ") }";

		} catch (Exception e) {
			System.out.println("ERROR: " + e);
		}
		
		System.out.println("infoSql : " + infoSql);

		// connect and make connection
		try {
			connectionOpen();
			callableStatement = sqlConnection.prepareCall(infoSql);
			callableStatement.registerOutParameter(1, OracleTypes.CURSOR);
			System.out.println("Hata yok!");

			for (int seq = 1; seq <= parameterLength; seq++) {
				System.out.println(Integer.toString(seq) + sqlFunctionParameters.get(seq));
				callableStatement.setString(seq, sqlFunctionParameters.get(seq));
			}

			System.out.println("döngðden sonra");

			callableStatement.execute();
			resultSet = ((OracleCallableStatement) callableStatement).getCursor(1);
			System.out.println("cursor alýndýktan sonra");
			
			int elementCount = 1;
			boolean hasNext = resultSet.next();
			ArrayList<ArrayList<String>> elements = new ArrayList<ArrayList<String>>();
			
			while (hasNext && elementCount < parameterCount) {
				System.out.println("döngü");
				ArrayList<String> e = new ArrayList<String>();
			
				for(i = 1; i <= parameterCount; i++) {
					 e.add(resultSet.getString(i));
				}
				
				elements.add(e);
				
				hasNext = resultSet.next();
				
			}
			
			connectionClose();
			
		} catch (SQLException e) {
			System.out.println(e);
		}

		return resultString;
	}
	*/
}
