package com.enda.caissemanager.connection;
import java.util.Properties;
import java.io.*;

public class lirefichier {
	
public String gethostfromfile() throws IOException {
	Properties prop = new Properties();
	/* Ici le fichier contenant les données de configuration est nommé 'db.myproperties' */
	FileInputStream in;
	in = new FileInputStream("dbconnection.properties");
	prop.load(in);
	in.close();
	// Extraction des propriétés
	String host = prop.getProperty("jdbc.host");
	//String user = prop.getProperty("jdbc.user");
	//String password = prop.getProperty("jdbc.password");
	//String port = prop.getProperty("jdbc.port"); 
	return host;
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
