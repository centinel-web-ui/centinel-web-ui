<%@ page import ="java.sql.*,java.util.Properties" %>

<%!
  private static final String dbClassName = "com.mysql.jdbc.Driver";
  private static final String CONNECTION = "jdbc:mysql://127.0.0.1/centinelweb";
  private PreparedStatement preparedStatement = null;
public boolean duplicateUserFlag = false;
public boolean duplicateEmailFlag = false;
public String message = "";

           Statement st,st1,st2,st3,st4,st5;
	PreparedStatement pst,pst1,pst2,pst3,pst4,pst5;
           ResultSet rs,rs1,rs2,rs3,rs5; 
           int count=0; 
           String pass,param1;
		   
%>


<%
    String username = request.getParameter("username");   
    String pwd = request.getParameter("password");

	try{
    Class.forName(dbClassName);

    Properties p = new Properties();
    p.put("user","ashwin");
    p.put("password","ashwin");

    // Now try to connect
    Connection con = DriverManager.getConnection(CONNECTION,p);

	  st=con.createStatement();

	  st1=con.createStatement();

String temp1="select count(*) from centinelweb.centinelusers where user_name=\""+username+"\"";
out.println(temp1);
rs1=st1.executeQuery(temp1);
	rs1.next();
	int rc=rs1.getInt(1);
	if(rc==1)
	{
	String temp="select * from centinelweb.centinelusers where user_name=\""+username+"\"";
	rs=st.executeQuery(temp);


        while(rs.next())
		{
			
		String dbName=rs.getString(1);
		String dbpwd=rs.getString(2);
		String userFullName=rs.getString(3);
		String userCountryCode=rs.getString(5);
		session.setAttribute("uid",dbName);
		if(userFullName != null){
		session.setAttribute("userFullName",userFullName);
		session.setAttribute("userCountryCode",userCountryCode);



		}	
		else {
		session.setAttribute("userFullName",dbName);
		}

		st.close();
	
	if(username.equalsIgnoreCase(dbName) && pwd.equalsIgnoreCase(dbpwd)){
		response.sendRedirect("dashboard.jsp");
	} else {
		session.setAttribute("uid",null);
         String loginErrMsg="User does not exist or Wrong Password entered";
	 session.setAttribute("loginErrorMessage",loginErrMsg);
         response.sendRedirect("index.jsp");     
		
	}

	} // end while

}
else
	{

         String loginErrMsg="User does not exist or Wrong Password entered";
	 session.setAttribute("loginErrorMessage",loginErrMsg);
         response.sendRedirect("index.jsp");     

	}
	} catch(Exception e){
	}

%>


