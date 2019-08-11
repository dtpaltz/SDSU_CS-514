package lab5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Problem1
{
	public static void main(String[] args)
	{
		try
		{
			//String url = "jdbc:oracle:thin:@cslabdb:1525:cfedb";
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "st03";
			String pass = "cs514";
			int MendozaLine = 200;
			
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM infobb02 ORDER BY average DESC");


			while (rs.next())
			{
				int empno = rs.getInt("empno");
				int avg = rs.getInt("average");
				
				if (avg == 0)
				{
					System.out.println("Employee with eid " + empno + " has no batting average");
				}
				else if (avg < MendozaLine)
				{
					System.out.println("Employee with eid " + empno + " has an average below the Mendoza line");
				}
				else
				{
					System.out.println("Employee with eid " + empno + " has a batting average of " + avg);
				}
			}

			rs.close();
			stmt.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e.getMessage());
		}
	}
}
