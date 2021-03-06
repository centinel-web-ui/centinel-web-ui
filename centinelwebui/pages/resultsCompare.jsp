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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
                        <h1 class="page-header"><span class="text-primary">Results Comparison</span></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
<%
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
                            Cannot compare results
                        </div>
                    </div>
                </div>
                </div>

<%
	}

	

	else { // Code when there are existing experiments added by the user earlier
// Fetch centinel values and experiment values for the user
	String sqlQuery="select * from centinelweb.results where username=\""+sessionUserName.trim()+"\"";
	Statement statement=c.createStatement();
	
        ResultSet rst=statement.executeQuery(sqlQuery);

	while(rst.next()){
		// Centinel code , date, result json file
		outputList.add(rst.getString(2) + "," + rst.getString(3)+ "," + rst.getString(4));
	}

%>

                
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                Specify criteria for Results Comparison
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <form role="form" action="resultsComparePing.jsp">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <p> </p>
                                                <p> </p>
                                                <br/>
                                                <p class="text-primary">Compare Ping Results</span></p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label>JSON File 1</label>
                                                <select class="form-control" id="ping1" name="ping1">
                                                    <option disabled selected> -- Select Ping File -- </option>
                                                    <option val="ping1.json">ping1.json</option>
                                                    <option val="ping2.json">ping2.json</option>
                                                </select>
                                                <p class="help-block">Results Ping File 1</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label>JSON File 2</label>
                                                <select class="form-control" id="ping2" name="ping2">
                                                    <option disabled selected> -- Select Ping File -- </option>
                                                    <option val="ping1.json">ping1.json</option>
                                                    <option val="ping2.json">ping2.json</option>
                                                </select>
                                                <p class="help-block">Results Ping File 2</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <br/>
                                                <button type="submit" class="btn btn-primary">Compare</button>
                                                <p class="help-block">Compare Results</p>
                                            </div>
                                        </div>
                                        <!-- <button type="reset" class="btn btn-default">Reset Button</button>-->
                                    </form>
                                </div>
                                <!-- Next form starts here  -->
                                <div class="row">
                                    <form role="form" action="resultsCompareHTTP.jsp">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <p> </p>
                                                <p> </p>
                                                <br/>
                                                <p class="text-primary">Compare HTTP Request Results</span></p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label>JSON File 1</label>
                                                <select class="form-control" id="http1" name="http1">
                                                    <option disabled selected> -- Select HTTP File -- </option>
                                                    <option val="http_request1.json">http_request1.json</option>
                                                    <option val="http_request2.json">http_request2.json</option>
                                                </select>
                                                <p class="help-block">Results HTTP File 1</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label>JSON File 2</label>
                                                <select class="form-control" id="http2" name="http2">
                                                    <option disabled selected> -- Select HTTP File -- </option>
                                                    <option val="http_request1.json">http_request1.json</option>
                                                    <option val="http_request2.json">http_request2.json</option>
                                                </select>
                                                <p class="help-block">Results HTTP File 2</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <br/>
                                                <button type="submit" class="btn btn-primary">Compare</button>
                                                <p class="help-block">Compare Results</p>
                                            </div>
                                        </div>
                                        <!-- <button type="reset" class="btn btn-default">Reset Button</button>-->
                                    </form>
                                </div>
                                <hr/>
                                <!-- Next form starts here  -->
                                <div class="row">
                                    <form role="form" action="resultsCompareMultiple.jsp">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <p> </p>
                                                <p> </p>
                                                <br/>
                                                <p class="text-primary">With Time Required for Completion</span></p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label>Number of Files</label>
                                                <select class="form-control" id="numfiles" name="numberfiles">
                                                    <option disabled selected >-- Select Number -- </option>
                                                    <option val="2">2</option>
                                                    <option val="3">3</option>
                                                    <option val="4">4</option>
                                                    <option val="5">5</option>
                                                </select>
                                                <p class="help-block"># of files for comparison</p>
                                            </div>
                                        </div>
                                        <script>
                                            $('#numfiles').change(function() {
                                            
                                                  var val = parseInt($(this).val(), 10);
                                                  var html = '';
                                                  for (var i = 0; i < val; i++) {
                                            	    html += '<div class="col-lg-3"><div class="form-group"><label>JSON File '+(i+1)+'</label><select class="form-control" id="ping1" name="jsonfile'+(i+1)+'"><option disabled selected >-- Select File -- </option><option val="ping1">ping1.json</option><option val="ping2">ping2.json</option><option val="ping3">ping3.json</option></select><p class="help-block">Results File '+(i+1)+'</p></div></div>';
                                                  }
                                                  $('#selectContainer').html(html);
                                            });
                                        </script>
                                        <div id="selectContainer"></div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <br/>
                                                <button type="submit" class="btn btn-primary">Compare</button>
                                                <p class="help-block">Compare Results</p>
                                            </div>
                                        </div>
                                        <!-- <button type="reset" class="btn btn-default">Reset Button</button>-->
                                    </form>
                                </div>


                         <!-- Next form starts here  -->
                                <div class="row">
                                    <form role="form" action="resultsCompareMultipleGraph.jsp">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <p> </p>
                                                <p> </p>
                                                <br/>
                                                <p class="text-primary">With TTL Values for sites</span></p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label>Number of Files</label>
                                                <select class="form-control" id="numfiles1" name="numberfiles1">
                                                    <option disabled selected >-- Select Number -- </option>
                                                    <option val="2">2</option>
                                                    <option val="3">3</option>
                                                    <option val="4">4</option>
                                                    <option val="5">5</option>
                                                </select>
                                                <p class="help-block"># of files for comparison</p>
                                            </div>
                                        </div>
                                        <script>
                                            $('#numfiles1').change(function() {
                                            
                                                  var val = parseInt($(this).val(), 10);
                                                  var html = '';
                                                  for (var i = 0; i < val; i++) {
                                            	    html += '<div class="col-lg-3"><div class="form-group"><label>JSON File '+(i+1)+'</label><select class="form-control" id="ping1" name="jsonfile'+(i+1)+'"><option disabled selected >-- Select File -- </option><option val="ping1">ping1.json</option><option val="ping2">ping2.json</option><option val="ping3">ping3.json</option></select><p class="help-block">Results File '+(i+1)+'</p></div></div>';
                                                  }
                                                  $('#selectContainerGraph').html(html);
                                            });
                                        </script>
                                        <div id="selectContainerGraph"></div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <br/>
                                                <button type="submit" class="btn btn-primary">Compare</button>
                                                <p class="help-block">Compare Results</p>
                                            </div>
                                        </div>
                                        <!-- <button type="reset" class="btn btn-default">Reset Button</button>-->
                                    </form>
                                </div>
       


                                <!-- /.row (nested) -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
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
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../dist/js/sb-admin-2.js"></script>
    </body>
</html>
