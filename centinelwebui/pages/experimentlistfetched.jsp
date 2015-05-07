<!DOCTYPE html>
<%@ page import ="java.sql.*,java.util.Properties, java.util.ArrayList,java.util.HashSet" %>
<html lang="en">
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
ArrayList<String> outputList = new ArrayList<String>();
ArrayList<String> printExptList = new ArrayList<String>();

String centinelname ="";
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon">

    <title>Centinel Web User Interface</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


    <!-- DataTables CSS -->
    <link href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">



    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="navbar-brand" href="dashboard.jsp">
		Centinel Web User Interface</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">

                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="userprofile.jsp"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">

                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="addcentinel.jsp"><i class="fa fa-plus-square fa-fw"></i> Add Centinel</a>
                        </li>
                        <li>
                            <a href="upload.jsp"><i class="fa fa-upload fa-fw"></i> Upload Experiments</a>
                        </li>
                        <li>
                            <a href="schedule.jsp"><i class="fa fa-calendar fa-fw"></i> Schedule Experiment</a>
                        </li>
                        <li>
                            <a href="experimentlist.jsp"><i class="fa fa-flask fa-fw"></i> Experiment List</a>
                        </li>
                        <li>
                            <a href="results.jsp"><i class="fa fa-tasks fa-fw"></i> View Results</a>
                        </li>
                        <li>
                            <a href="resultsCompare.jsp"><i class="fa fa-bar-chart fa-fw"></i> Compare Results</a>
                        </li>
                        <li>
                            <a href="server.jsp"><i class="fa fa-server fa-fw"></i> Server Information</a>
                        </li>
                        <li>
                            <a href="locate.jsp"><i class="fa fa-street-view fa-fw"></i> Locate Yourself</a>
                        </li>

                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><span class="text-primary">List of Experiments</span></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
		<!-- Code to get the list of centinels and experiments for the logged in user -->	

<%
 centinelname = request.getParameter("centinelname");
  String sessionUserName = session.getAttribute("uid").toString();
  String sessionUserCountry = session.getAttribute("userCountryCode").toString();

	try{
    Class.forName(dbClassName);

    Properties p = new Properties();
    p.put("user","ashwin");
    p.put("password","ashwin");

    // Now try to connect
       Connection c = DriverManager.getConnection(CONNECTION,p);
	String temp1="select count(*) from centinelweb.experiments where username=\""+sessionUserName.trim()+"\"";

	  st1=c.createStatement();
	rs1=st1.executeQuery(temp1);

	rs1.next();

	int rc=rs1.getInt(1);

	if(rc==0)
	{
		// There are no centinels configured for this user. Throw error

%>
<div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            No Centinels added
                        </div>
                        <div class="panel-body">
                            <p class="text-info">There are no centinels added by you. To schedule experiments, you should first add centinels from the Add Centinels link in the left panel.</p>
                        </div>
                        <div class="panel-footer">
                            No list of experiments available
                        </div>
                    </div>
                </div>
                </div>

<%
	}

	

	else { // Code when there are existing experiments added by the user earlier
// Fetch centinel values and experiment values for the user
	outputList.clear();
	printExptList.clear();
	String sqlQuery1="select * from centinelweb.experiments where username=\""+sessionUserName.trim()+"\"";

	Statement statement1=c.createStatement();
	
        ResultSet resultSet1=statement1.executeQuery(sqlQuery1);
outputList.clear();
	while(resultSet1.next()){
		outputList.add(resultSet1.getString(7) + "," + resultSet1.getString(3));

	}


	String sqlQuery="select * from centinelweb.experiments where username=\""+sessionUserName.trim()+"\" and centinelnode=\""+centinelname+"\"";

	Statement statement=c.createStatement();
	
        ResultSet rst=statement.executeQuery(sqlQuery);
printExptList.clear();
	while(rst.next()){
	
		printExptList.add(rst.getString(2) + "," + rst.getString(3)+ "," + rst.getString(4) + "," + rst.getString(5));
	}




%>

            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Centinel Selection
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                
                                    <form role="form" action="experimentlistfetched.jsp">
		                	<div class="col-lg-6">                        
 					<div class="form-group">
                                            <label>Centinel</label>
                                            <select class="form-control" id="cent" name="centinelname">
						<option disabled selected> -- Select Centinel -- </option>


<%
	HashSet hashS = new HashSet();
for(int i=0;i<outputList.size();i++){
	String centinel = outputList.get(i).split(",")[0];
	String expt = outputList.get(i).split(",")[1];
	if(hashS.add(centinel)){
		out.println( "<option val=" + centinel + ">" + centinel+"</option>");
	}	
}

%>
			</select>
			<script>
			
<%
	HashSet hs = new HashSet();
for(int i=0;i<outputList.size();i++){
	String centinel = outputList.get(i).split(",")[0];
	String expt = outputList.get(i).split(",")[1];
	
	if(hs.add(centinel)){
		out.println( centinel + " = new Array();");
	}
	out.println( centinel + ".push('"+expt+"');");
		
}

%>
		populateSelect();

			$(function() {

			      $('#cent').change(function(){
				populateSelect();
			    });
			    
			});


			function populateSelect(){
			    cat=$('#cent').val();
			    $('#item').html('');
			    

<%
	HashSet hset = new HashSet();
	for(int i=0;i<outputList.size();i++){
	String centinel = outputList.get(i).split(",")[0];
	String expt = outputList.get(i).split(",")[1];
	
	if(hset.add(centinel)){
	out.println("if(cat == '"+ centinel+"') { " + centinel + ".forEach(function(t){ $('#item').append('<option>'+t+'</option>');}); } ");
	}
	}

%>			

	} 
			</script>

                                            <p class="help-block">Centinel Node</p>
                                        </div>
					</div>
					
		                	<div class="col-lg-6"> 
                                        <div class="form-group">
                                           <br/>
	                                        <button type="submit" class="btn btn-primary">Get List</button>
                                            <p class="help-block">Get Experiment List</p>
                                        </div>
                                        </div>




                                        <!-- <button type="reset" class="btn btn-default">Reset Button</button>-->
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->

<!-- ASHWIN: Code for table display starts-->

            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><span class="text-primary">Experiments for Centinel Code: <%=centinelname%></span></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Experiment List
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Experiment</th>
                                            <th>URL File</th>
                                            <th>Schedule</th>
					</tr>
                                    </thead>
                                    <tbody>
<%
// Code for populating the table based on the results retrieved from db

for(int i=0;i<printExptList.size();i++){
	String line = printExptList.get(i).trim();

	String[] splittedLine = line.split(",");
	String fullDate = splittedLine[0];
	String exptName = splittedLine[1];
	String url = splittedLine[2];
	String results = splittedLine[3];

	out.println("<tr>");
	out.println("<td>"+fullDate+"</td>");
	out.println("<td>"+exptName+"</td>");
	out.println("<td><a href=>"+url+"</a></td>");
	out.println("<td><form role='form' action='schedule.jsp'><input type='hidden' name='centineltoschedule' value='"+centinelname+"'><input type='hidden' name='expttoschedule' value='"+exptName+"'><button type='submit' class='btn btn-success'>Schedule</button></form></td>");
	out.println("</tr>");
}

%>
<!--                                        <tr class="odd gradeX">
                                            <td><%=outputList.get(0)%></td>
                                            <td>Internet Explorer 4.0</td>
                                            <td>Win 95+</td>
                                            <td class="center">4</td>

                                        </tr>
                                        
                                        <tr class="gradeU">
                                            <td>Other browsers</td>
                                            <td>All others</td>
                                            <td>-</td>
                                            <td class="center">-</td>

                                        </tr>-->
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
<!-- ASHWIN: Code for table display ends here-->


            </div>
            <!-- /.row -->
        </div>


<%	  
	}
	

	c.close();
	} catch(SQLException se){
	 out.println("SQL ERROR + " + se.getMessage());
	}
	 
	 catch(Exception e){
		    out.println("EROR IS: "+ e.getMessage());
	} 


%>





        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>


    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
</body>

</html>
