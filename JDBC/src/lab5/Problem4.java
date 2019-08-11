package lab5;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Problem4
{
	public static void main(String[] args)
	{
		// String url = "jdbc:oracle:thin:@cslabdb:1525:cfedb";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "st03";
		String pass = "cs514";

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
			Connection conn = DriverManager.getConnection(url, user, pass);
			BufferedReader buffer = new BufferedReader(new InputStreamReader(System.in));
			PreparedStatement pstmt = conn.prepareStatement("UPDATE empbb02 SET sal = ?	 WHERE empno = ?");
			pstmt.setQueryTimeout(10);

			while (true)
			{
				try
				{
					System.out.println("Enter an employee number... (enter 0 to quit)");
					String empno = buffer.readLine();

					if (empno.trim().equals("0"))
					{
						break;
					}

					System.out.println("Enter a new salary for employee " + empno);
					int newSal = Integer.parseInt(buffer.readLine());

					pstmt.setInt(1, newSal);
					pstmt.setString(2, empno.trim());

					int rowsUpdated = pstmt.executeUpdate();
					System.out.println(rowsUpdated + " rows updated.\n");
				}
				catch (Exception e)
				{
					System.out.println("Error: " + e.getMessage());
				}
			}

			System.out.println("Finished!");
			pstmt.close();
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e.getMessage());
		}
	}
}
