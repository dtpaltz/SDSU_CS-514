// to run this code enter    java jdbc0Ora usrname passwd
// This is jdbc0Ora.java.   It connects JDBC to an ORACLE database.
// The database is called cfedb and is located on cslabdb.
// The driver used is an Oracle 'thin' driver.   The other common driver
// is Oracle OCI, where OCI is Oracle Call Interface.  The drivers most
// commonly used are 'thin', 'oci7', and 'oci8'.  The 'thin' one is used
// a lot for applets.
// To run this you want to have usrname and passwd as command line params.

// NOTE, con.setAutoCommit(true) is legal for a connection called con

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class jdbc_1
{
	public static void main(String[] aa)
	{
		String url;

		//url = "jdbc:oracle:thin:@cslabdb:1525:cfedb";
		url = "jdbc:oracle:thin:@localhost:1521:orcl";
		// jdbc is 'protocol',
		// oracle is 'subprotocol',
		// and thin is the driver; cs514 is the data base
		// instance; the 'database' format is host:port:sid

		Statement stmt;
		Connection con;
		String query = "select ename,pos from empbb02";

		try
		{
			// invoke the oracle thin driver; register it with DriverManager
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
			// this step 'loads' the drivers for Oracle that are 'found'
		}
		catch (Exception e)
		{
			System.out.println("MR.UnitSitQueries.constructor.Exception: " + e);
		}

		try
		{
			con = DriverManager.getConnection(url, "ST03", "student"); // establish
			// connection to DBMS or database
			stmt = con.createStatement(); // creates object from which SQL commands
			// can be sent to the DBMS
			ResultSet rs = stmt.executeQuery(query); // create result object to hold
			
			System.out.println("Player last names and positions...");

			// information returned by the DBMS
			// Vector rowData = new Vector();
			while (rs.next())
			{
				String s1 = rs.getString("ENAME");
				String s2 = rs.getString(2);
				System.out.println(s1 + "  " + s2);
			}
			
			System.out.println("--------------------------");

			ResultSetMetaData rsmd = rs.getMetaData();
			// rs only has two columns
			int i = rsmd.getColumnCount();
			System.out.println("Column count: " + i);
			int jdbcType = rsmd.getColumnType(1);
			String s1 = rsmd.getColumnLabel(2);
			System.out.println("Column 2 label: " + s1);
			// the JDBC type corresponding to ACCESS text has index 12: VARCHAR
			System.out.println("Column data type index: " + jdbcType);
			stmt.close();
			con.close();
		}
		catch (SQLException e)
		{
			System.out.println("Error: " + e.getMessage());
		}
	}
}