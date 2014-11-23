
<%@ page language="java" import="java.io.*,java.util.*,java.sql.*"%>

<%
  System.out.println("JSP Name :: con1.jsp start"); 

    String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	System.out.println("basePath ::" + basePath);
	
	//String connectionURL = "jdbc:mysql://10.1.52.241/drdo";
	String connectionURL = "jdbc:mysql://localhost:3306/temp2";
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	java.util.Properties properties = new java.util.Properties();
	properties.put("user", "root");
	properties.put("password", "");
	//properties.put("user", "drdo");
	//properties.put("password", "a*3DeczH2g");
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	 con = DriverManager.getConnection(connectionURL, properties); //to_date(('"+tDate+"')
     System.out.println("JSP Name :: con1.jsp end"); 
	 String labName="";//used for fetching hits for a lab       
%>

