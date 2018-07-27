package com.cell2iwebservice.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import com.cell2iwebservice.utilities.DatabaseOpener;
import com.cell2iwebservice.utilities.Properties;

public class DAO {
	protected static PreparedStatement preparedStatement = null;
	protected static CallableStatement callableStatement = null;
	protected static Connection sqlConnection            = null;
	protected static ResultSet resultSet                 = null;
	
    protected static String columnSeperator = Properties.getColumnSeperator();
	protected static String lineSeperator   = Properties.getLineSeperator();
	protected static String packageName     = Properties.getPackageName();
	

	public static void connectionOpen() throws SQLException {
		sqlConnection = DatabaseOpener.open();
	}

	public static void connectionClose() throws SQLException {
			resultSet.close();
			preparedStatement.close();
			sqlConnection.close();
	}
}
