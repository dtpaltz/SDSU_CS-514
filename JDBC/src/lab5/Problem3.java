package lab5;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Types;

public class Problem3
{
	public static void main(String[] args)
	{
		try
		{
			//String url = "jdbc:oracle:thin:@cslabdb:1525:cfedb";
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "st03";
			String pass = "cs514";

			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
			Connection con = DriverManager.getConnection(url, user, pass);
			
			CallableStatement cs = con.prepareCall("{call PLAYERAVERAGES(?,?,?)}");
			cs.setString(1, "johnson");
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.registerOutParameter(2, Types.VARCHAR);
			cs.registerOutParameter(3, Types.VARCHAR);
			cs.execute();
			
			String p_name = cs.getString(1);
			String p_era = cs.getString(2);
			String p_average = cs.getString(3);
			
			System.out.println("Player " + p_name + " has an era of " + p_era + " and an average of " + p_average);
			
			cs.close();
			con.close();
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e.getMessage());
		}
	}
}
