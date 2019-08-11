// to run this code enter  java jdbc0OraImages scott tiger
// This is jdbc0Ora.java.   It connects JDBC to an ORACLE database.
// The database is called orcl and is located on home PC.
// The driver used is an Oracle 'thin' driver.   The other common driver
// is Oracle OCI, where OCI is Oracle Call Interface.  The drivers most
// commonly used are 'thin', 'oci7', and 'oci8'.  The 'thin' one is used
// a lot for applets.
// To run this you want to have usrname and passwd as command line params.

// NOTE, con.setAutoCommit(true) is legal for a connection called con

import java.io.*;
import java.util.*;
import java.sql.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.swing.*;

public class jdbc0OraImages extends JFrame
{
	public static JLabel jlabel = new JLabel("test");

	public jdbc0OraImages()
	{
		setBounds(80, 80, 400, 300);
		// public static JLabel jlabel = new JLabel("test");
		Container contentPane = getContentPane();
		JPanel jpanel = new JPanel();
		jpanel.add(jlabel);
		contentPane.add(jpanel, "Center");
	}

	public static void main(String[] aa)
	{
		String url;
		Blob img;
		ImageIcon icon = null;
		Image img3 = null;
		BufferedImage img2 = null;
		byte[] imgData = null;
		url = "jdbc:oracle:thin:@localhost:1521:orcl"; // jdbc is 'protocol',
		// oracle is 'subprotocol',
		// and thin is the driver; cs514 is the data base
		// instance; the 'database' format is host:port:sid
		Statement stmt;
		Connection con;
		String query = "select * from images";
		try
		{ // invoke the oracle thin driver; register it with DriverManager
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		} // this step 'loads' the drivers for Oracle that are 'found'
		catch (Exception e)
		{
			System.out.println("MR.UnitSitQueries.constructor.Exception: " + e);
		}
		try
		{
			con = DriverManager.getConnection(url, aa[0], aa[1]); // establish
			// connection to DBMS or database
			stmt = con.createStatement(); // creates object from which SQL
											// commands
			// can be sent to the DBMS
			ResultSet rs = stmt.executeQuery(query); // create result object to
														// hold
			// information returned by the DBMS
			// Vector rowData = new Vector();
			while (rs.next())
			{
				img = rs.getBlob(2);
				imgData = img.getBytes(1, (int) img.length());

				// ImageIO.read is static
				try
				{
					img2 = ImageIO.read(new ByteArrayInputStream(imgData));
				}
				catch (Exception e)
				{
				}
				;
				img3 = img2;
				icon = new ImageIcon(img3);
				jdbc0OraImages.jlabel.setIcon(icon);
			}

		}
		catch (SQLException e)
		{
			System.out.println("OOPS" + e.getMessage());
		}
		jdbc0OraImages jfram = new jdbc0OraImages();
		jfram.setVisible(true);

	}
}