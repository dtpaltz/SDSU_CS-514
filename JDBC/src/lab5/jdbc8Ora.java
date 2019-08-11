package lab5;

//Illustrates the use of  PreparedStatement for a repeated update.

import java.io.*;
import java.sql.*;

public class jdbc8Ora
{
	static BufferedReader getData = new BufferedReader(new InputStreamReader(System.in));
	static int deptno;
	static String dname, restaurant, location, motto;

	public static void main(String[] aa) throws IOException
	{
		String url;
		url = "jdbc:oracle:thin:@130.191.28.142:1525:cfedb";
		Connection conn;
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}
		catch (Exception e)
		{
			System.out.println("MR.UnitSitQueries.constructor.Exception: " + e);
		}
		
		try
		{
			conn = DriverManager.getConnection(url, "eckberg", "carl");
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO deptbb02 VALUES(?,?,?,?,?)");

			boolean done = false;
			while (!done)
			{
				gimmeData();
				
				if (deptno == 0)
				{
					done = true;
					continue;
				}
				
				pstmt.setString(2, dname);
				pstmt.setString(3, restaurant);
				pstmt.setString(4, location);
				pstmt.setInt(1, deptno);
				pstmt.setString(5, motto);
				pstmt.executeUpdate();
			}
			
			pstmt.close();
			conn.close();
		}
		catch (SQLException e)
		{
			System.err.println("OOPS " + e.getMessage());
		}
	}

	static void gimmeData() throws IOException
	{
		System.out.println("Enter a department number.  Enter 0 to quit.");
		deptno = Integer.parseInt(getData.readLine());
		if (deptno != 0)
		{
			System.out.println("Enter a department name.");
			dname = getData.readLine();
			System.out.println("Enter a restaurant.");
			restaurant = getData.readLine();
			System.out.println("Enter a location.");
			location = getData.readLine();
			System.out.println("Enter a motto.");
			motto = getData.readLine();
		}
	}
}
