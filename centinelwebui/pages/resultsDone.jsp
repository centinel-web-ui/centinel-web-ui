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
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon">

    <title>Centinel Web User Interface</title>
    <!-- jQuery -->
<!--    <script src="../bower_components/jquery/dist/jquery.min.js"></script>-->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css">


	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">




    <!-- DataTables JavaScript -->
<!--    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>-->
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>




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



<style>
.date-form { margin: 10px; }

label.control-label span { cursor: pointer; }
</style>

<script type="text/javascript">
    //<![CDATA[
        $(window).load(function(){ 
			$("date-picker").datepicker();
 });
    //]]>
</script>
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
                    <h1 class="page-header"><span class="text-primary">Results</span></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
		<!-- Code to get the list of centinels and experiments for the logged in user -->	

<%

String centinelnode = request.getParameter("centinelnode");
String datevalue = request.getParameter("datevalue");
String resultsnode = request.getParameter("resultsnode");


  String sessionUserName = session.getAttribute("uid").toString();
  String sessionUserCountry = session.getAttribute("userCountryCode").toString();

	try{
    Class.forName(dbClassName);

    Properties p = new Properties();
    p.put("user","ashwin");
    p.put("password","ashwin");

    // Now try to connect
       Connection c = DriverManager.getConnection(CONNECTION,p);
	String temp1="select count(*) from centinelweb.centinels where username=\""+sessionUserName.trim()+"\"";
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
                            Cannot schedule experiments
                        </div>
                    </div>
                </div>
                </div>

<%
	}

	

	else { // Code when there are existing experiments added by the user earlier
// Fetch centinel values and experiment values for the user
	String sqlQuery="select * from centinelweb.results where username=\""+sessionUserName.trim()+"\" and centinelcode=\""+centinelnode+"\""+" and jsonfile=\""+resultsnode+"\"";

	Statement statement=c.createStatement();
	
        ResultSet rst=statement.executeQuery(sqlQuery);
	String resultType=""; // To get that kind of output to the screen
	while(rst.next()){
		resultType=rst.getString(4).split("-")[0];
		
		// Based on this result type, read the file, and display values
		
	}

	// RESULT TYPE = http_request
	if(resultType.equalsIgnoreCase("http_request")){

%>

<!-- ASHWIN: Code for displaying the summary is here: -->
<div class="row">
                <div class="col-lg-8">

			 <div class="panel-body">
                            <div class="alert alert-info">

			       <div id="clienttime"></div>
			       <div id="schedulename"></div>
			       <div id="timetaken"></div>
		             </div>
			 </div>
	</div>

</div>
<!-- ASHWIN: Code for summary ends here>


<!-- ASHWIN: Code for table display starts-->

            <!-- /.row -->
            <div class="row">

                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Results for Centinel <%=centinelnode%>, and JSON: <%=resultsnode%>: 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Host</th>
                                            <th>Method</th>
                                            <th>SSL</th>
					    <th>Response Status</th>
					    <th>Response Reason</th>
					</tr>
                                    </thead>

                                    <tbody>
					

				<script>
					var hostsArray = [];
					var methodArray = [];
					var sslArray = [];
					var responseStatusArray = [];
					var responseReasonArray = [];

					function myFunction(arr) {

				//var dataTable = $('#dataTables-example').DataTable();
				var dataTable = $('#dataTables-example1').DataTable();
					    var j;
						for(i=0;i<arr[0].http_request.length ;i++){
							hostsArray.push(arr[0].http_request[i].request.host);
							methodArray.push(arr[0].http_request[i].request.method);
							sslArray.push(arr[0].http_request[i].request.ssl);
							sslArray.push(arr[0].http_request[i].request.ssl);
							document.getElementById("clienttime").innerHTML = arr[0].meta.client_time;
document.getElementById("clienttime").innerHTML = '<p><i class="fa fa-list-alt fa-fw"></i><span class="alert-link"> Client Time: </span>'+arr[0].meta.client_time +'</p>';
document.getElementById("schedulename").innerHTML = '<p><i class="fa fa-list-alt fa-fw"></i><span class="alert-link"> Schedule Name: </span>'+arr[0].meta.schedule_name+'</p>';

document.getElementById("timetaken").innerHTML = '<p><i class="fa fa-list-alt fa-fw"></i><span class="alert-link"> Time Taken: </span>'+arr[0].meta.time_taken+'</p>';


							if("status" in arr[0].http_request[i].response){
							responseStatusArray.push('<span class=text-success>'+arr[0].http_request[i].response.status+'</span>');
							responseReasonArray.push('<span class=text-success>' + arr[0].http_request[i].response.reason+'</span>');
							} else {
							responseStatusArray.push('<span class=text-danger>Failure</span>');
							responseReasonArray.push('<span class=text-danger>'+arr[0].http_request[i].response.failure+'</span>');
							}
							

						}


						for(j=0;j<hostsArray.length;j++){
							
							dataTable.row.add([hostsArray[j],methodArray[j],sslArray[j],responseStatusArray[j],responseReasonArray[j]]).draw();
						}


					}

				</script>

				<script src="data.json"></script>
					<!--
					<tr>
                                            <td>MyB</td>
                                            <td>Internet Explorer 4.0</td>
                                            <td>Win 95+</td>

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
	<% } // End of resulttype = http_request
else if (resultType.equalsIgnoreCase("ping")){

 %>
	
<!-- ASHWIN: Code for displaying the summary is here: -->
<div class="row">
                <div class="col-lg-8">

			 <div class="panel-body">
                            <div class="alert alert-info">

			       <div id="clienttime"></div>
			       <div id="schedulename"></div>
			       <div id="timetaken"></div>
		             </div>
			 </div>
	</div>

</div>
<!-- ASHWIN: Code for summary ends here>


<!-- ASHWIN: Code for table display starts-->

            <!-- /.row -->
            <div class="row">

                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Results for Centinel and File: 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Host</th>
                                            <th>Success</th>
					</tr>
                                    </thead>

                                    <tbody>
					

				<script>
					var hostsArray = [];
					var successArray = [];

					function myFunction(arr) {

				//var dataTable = $('#dataTables-example').DataTable();
				var dataTable = $('#dataTables-example1').DataTable();
					    var j;
						for(i=0;i<arr[0].ping.length ;i++){
							hostsArray.push(arr[0].ping[i].host);
							if(arr[0].ping[i].success == "true"){
							successArray.push('<span class=text-success>true</span>');
							} else {
							successArray.push('<span class=text-danger>false</span>');
							}
							document.getElementById("clienttime").innerHTML = arr[0].meta.client_time;
document.getElementById("clienttime").innerHTML = '<p><i class="fa fa-list-alt fa-fw"></i><span class="alert-link"> Client Time: </span>'+arr[0].meta.client_time +'</p>';
document.getElementById("schedulename").innerHTML = '<p><i class="fa fa-list-alt fa-fw"></i><span class="alert-link"> Schedule Name: </span>'+arr[0].meta.schedule_name+'</p>';

document.getElementById("timetaken").innerHTML = '<p><i class="fa fa-list-alt fa-fw"></i><span class="alert-link"> Time Taken: </span>'+arr[0].meta.time_taken+'</p>';


						}


						for(j=0;j<hostsArray.length;j++){
							
							dataTable.row.add([hostsArray[j],successArray[j]]).draw();
						}


					}

				</script>

				<script src="ping.json"></script>
					<!--
					<tr>
                                            <td>MyB</td>
                                            <td>Internet Explorer 4.0</td>
                                            <td>Win 95+</td>

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

	<% } // End of resulttype = ping
else if (resultType.equalsIgnoreCase("ssl_strip")){

 %>
	
<!-- ASHWIN: Code for displaying the summary is here: -->
<div class="row">
                <div class="col-lg-8">

			 <div class="panel-body">
                            <div class="alert alert-info">

			       <div id="clienttime"></div>
			       <div id="schedulename"></div>
			       <div id="timetaken"></div>
		             </div>
			 </div>
	</div>

</div>
<!-- ASHWIN: Code for summary ends here>


<!-- ASHWIN: Code for table display starts-->

            <!-- /.row -->
            <div class="row">

                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Results for Centinel and File: 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Site</th>
                                            <th>Success</th>
                                            <th>Status</th>
					</tr>
                                    </thead>

                                    <tbody>
					

				<script>
					var siteArray = [];
					var successArray = [];
					var statusArray = [];

					function myFunction(arr) {

				//var dataTable = $('#dataTables-example').DataTable();
				var dataTable = $('#dataTables-example1').DataTable();
					    var j;
						for(i=0;i<arr[0].ssl_strip.length ;i++){
							siteArray.push(arr[0].ssl_strip[i].site);
							successArray.push(arr[0].ssl_strip[i].success);
							statusArray.push(arr[0].ssl_strip[i].status);

							document.getElementById("clienttime").innerHTML = arr[0].meta.client_time;
document.getElementById("clienttime").innerHTML = '<p><i class="fa fa-list-alt fa-fw"></i><span class="alert-link"> Client Time: </span>'+arr[0].meta.client_time +'</p>';
document.getElementById("schedulename").innerHTML = '<p><i class="fa fa-list-alt fa-fw"></i><span class="alert-link"> Schedule Name: </span>'+arr[0].meta.schedule_name+'</p>';

document.getElementById("timetaken").innerHTML = '<p><i class="fa fa-list-alt fa-fw"></i><span class="alert-link"> Time Taken: </span>'+arr[0].meta.time_taken+'</p>';


						}


						for(j=0;j<siteArray.length;j++){
							
							dataTable.row.add([siteArray[j],successArray[j],statusArray[j]]).draw();
						}


					}

				</script>

				<script src="ssl_strip.json"></script>
					<!--
					<tr>
                                            <td>MyB</td>
                                            <td>Internet Explorer 4.0</td>
                                            <td>Win 95+</td>

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

<% } // End of resulttype = ssl_strip %>







<!-- ASHWIN: Code for table display ends here-->


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

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


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
