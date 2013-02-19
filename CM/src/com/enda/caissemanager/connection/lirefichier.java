package com.enda.caissemanager.connection;
import java.util.Properties;
import java.io.*;

public class lirefichier {
public String host;
public String user;
public String password;
public String port; 
public String dbname;

public lirefichier() {
	
	InputStream in;
	try {
	//in = getClass().getClassLoader().getResourceAsStream("dbconnection.properties");
	in = getClass().getClassLoader().getResourceAsStream("../../conf/dbconnection.properties");
	Properties prop = new Properties();
	prop.load(in);
	
	// Extraction des propriétés
	host = prop.getProperty("jdbc.host");
	user = prop.getProperty("jdbc.user");
	password = prop.getProperty("jdbc.password");
	port = prop.getProperty("jdbc.port"); 
	dbname = prop.getProperty("jdbc.dbname");
	
	in.close();
	}
	catch(Exception ex) {
		System.out.println(ex.getMessage());
	}
	
}

public String getuserfromfile() throws IOException {
	Properties prop = new Properties();
	/* Ici le fichier contenant les données de configuration est nommé 'db.myproperties' */
	FileInputStream in;
	in = new FileInputStream("dbconnection.properties");
	prop.load(in);
	in.close();
	// Extraction des propriétés
	String user = prop.getProperty("jdbc.user");
	
	return user;
}

public String getpasswordfromfile() throws IOException {
	Properties prop = new Properties();
	/* Ici le fichier contenant les données de configuration est nommé 'db.myproperties' */
	FileInputStream in;
	in = new FileInputStream("dbconnection.properties");
	prop.load(in);
	in.close();
	// Extraction des propriétés
	String password = prop.getProperty("jdbc.password");
	return password;
}

public String getportfromfile() throws IOException {
	Properties prop = new Properties();
	/* Ici le fichier contenant les données de configuration est nommé 'db.myproperties' */
	FileInputStream in;
	in = new FileInputStream("dbconnection.properties");
	prop.load(in);
	in.close();
	// Extraction des propriétés
	
	String port = prop.getProperty("jdbc.port"); 
	return port;
}

public String getdbnamefromfile() throws IOException {
	Properties prop = new Properties();
	/* Ici le fichier contenant les données de configuration est nommé 'db.myproperties' */
	FileInputStream in;
	in = new FileInputStream("dbconnection.properties");
	prop.load(in);
	in.close();
	// Extraction des propriétés
	
	String dbname = prop.getProperty("jdbc.dbname"); 
	return dbname;
}

public String getpath() throws IOException {
	return System.getProperty("user.dir");
}


}
