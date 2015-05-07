<!DOCTYPE html>
<html lang="en">
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon">
<%@ page import ="java.sql.*,java.util.Properties" %>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<%!
  private static final String dbClassName = "com.mysql.jdbc.Driver";
  private static final String CONNECTION = "jdbc:mysql://127.0.0.1/centinelweb";
  private PreparedStatement preparedStatement = null;
public boolean duplicateUserFlag = false;
public boolean duplicateEmailFlag = false;
public String message = "";
%>

  <div class="container" >
			<div class="col-md-5 col-md-offset-5">
				<img src="../images/iclab.png" width="40%" height="27%"></img>
			</div>


<%
    String username = request.getParameter("username");
  String name = request.getParameter("name");      
    String email = request.getParameter("email");   
    String pwd = request.getParameter("password");
    String countrycode = request.getParameter("country");

	try{
    Class.forName(dbClassName);

    Properties p = new Properties();
    p.put("user","ashwin");
    p.put("password","ashwin");

    // Now try to connect
    Connection c = DriverManager.getConnection(CONNECTION,p);

duplicateUserFlag = false;
duplicateEmailFlag = false;

	// Create prepared statement object 
	preparedStatement = c.prepareStatement("insert into centinelweb.centinelusers values (?,?,?,?,?)");

      preparedStatement.setString(1, username);
      preparedStatement.setString(2, pwd);
      preparedStatement.setString(3, name);
      preparedStatement.setString(4, email);
      preparedStatement.setString(5, countrycode);
      int returnValue = preparedStatement.executeUpdate();
	if(returnValue ==1 ){
	     %>


            <div class="col-md-6 col-md-offset-3">

                <div class="login-panel panel panel-default">
			
                    <div class="panel-heading">

                        <h3 class="panel-title"><span class="text-success">Registration Successful</span></h3>
                    </div>
                    <div class="panel-body">
			<p> You have been succesfully registered with Centinel.</p>
			<p> Go back to <a href="index.jsp">Login Page.</a></p>
			<p> For further information about Centinel and ICLab, please visit <a href="https://iclab.org/">ICLab</a> </p>
                        
			<p> For more details about this Web User Interface, please visit our <a href="www3.cs.stonybrook.edu/~atumma/534/">Project Page</a>.</p>

                    </div>
                </div>
            </div>


<%  
	} else {

	    
	}
	

	c.close();
	} catch(SQLException se){
	 if(se.getMessage().toLowerCase().contains("primary")){
		 duplicateUserFlag = true;
		
	 }
	 if(se.getMessage().toLowerCase().contains("email")){
		 duplicateEmailFlag = true;
		
	 }
	} catch(Exception e){
		
	} 

	if(duplicateUserFlag){
		    //out.println("<span class=\"text-success\">This user already exists </span>");
			message ="User " + username + " already exists. Please specify another username.";
	} if(duplicateEmailFlag) {
			message = "Email " + email + " already exists. <br/>Please specify another email address.";
	}
	

%>

 <div class="col-md-8 col-md-offset-4">
	<span class="text-danger"><font size="4px"><%=message %></font></span>
</div>
</div>
