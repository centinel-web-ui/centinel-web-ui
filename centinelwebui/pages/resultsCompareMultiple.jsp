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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/prettify/r224/prettify.min.js"></script>

  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/prettify/r224/prettify.min.css">
    <!-- Morris Charts CSS -->
    <link href="../bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- Morris Charts JavaScript -->
    <script src="../bower_components/raphael/raphael-min.js"></script>
    <script src="../bower_components/morrisjs/morris.min.js"></script>



<!--	    <script src="../js/morris-data.js"></script> -->



  <script src="example.js"></script>
  <link rel="stylesheet" href="example.css">


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
<%!
	String jsonfiles[] = new String[5];
	int numFilesCount =0;
%>
<%
	String numFiles = request.getParameter("numberfiles");
		numFilesCount = Integer.parseInt(numFiles);
	for(int i=1;i<numFilesCount+1;i++){
		jsonfiles[i] = request.getParameter("jsonfile"+i);
	}

		
%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Comparison of Ping Results
                        </div>
                        <div class="panel-body">
                             <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                    <thead>
                                        <tr>
                                            <th>Host</th>
				<%
					for(int i=1;i<numFilesCount+1;i++){	
						out.println("<th>Success Ping " + i+"</th>");
					}
				%>
                                            

					</tr>
                                    </thead>

                                    <tbody>
					

				<script>
					var hostsArray = [];
					var success1Array = [];
					var success2Array = [];
					var success3Array = [];
					var success4Array = [];
					var success5Array = [];
					var ttl1Array = [];
					var ttl2Array = [];
					var ttl3Array = [];
					var ttl4Array = [];
					var ttl5Array = [];
					var timetaken1;
					var timetaken2;
					var timetaken3;
					var timetaken4;
					var timetaken5;
					var i;
				</script>

				<%	// Create multiple such scripts
					for(int ind=1;ind<numFilesCount+1;ind++) {	
						
				%>
				<script>
					function myFunction(arr) {
					    		
						for(i=0;i<arr[0].ping.length ;i++){
							ttl<%=ind%>Array.push(arr[0].ping[i].ttl);
							if(arr[0].ping[i].success=="true"){
							
								<% if (ind == 1) { %> 
									hostsArray.push(arr[0].ping[i].host);
								<% } 	%>

								success<%=ind%>Array.push('<span class=text-success>true</span>');
							} else {
								<% if (ind == 1) { %> 
									hostsArray.push(arr[0].ping[i].host);
								<% } 	%>

								success<%=ind%>Array.push('<span class=text-danger>false</span>');
							} 							

							timetaken<%=ind%> = arr[0].meta.time_taken;
							
						}				
						var dataTable = $('#dataTables-example2').DataTable();
						<%	
						if(ind==numFilesCount){
						%>	

						var j;   

						for(j=0;j<hostsArray.length;j++){
							
							dataTable.row.add([hostsArray[j],<% for(int ind1=1;ind1<numFilesCount+1;ind1++) {if(ind1==numFilesCount){out.print("success"+ind1+"Array[j]");} else {out.print("success"+ind1+"Array[j],");}%><% } %>]).draw();
						}
						<% } %>
					}

				</script>

				<script src="<%=jsonfiles[ind]%>"></script>
				<%	}
				%>
                                      
                                    </tbody>
                                </table>
                            </div>
			</div>
			</div>
			</div>
			</div>



<!-- Add Plotting Graphs here -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Comparison of Ping Results - Time Required to complete the Ping Tests
                        </div>
                        <div class="panel-body">
				<div id="graph"></div>
				<pre id="code" class="prettyprint linenums" hidden>
				// Use Morris.Bar
				Morris.Bar({
				  element: 'graph',
				  data: [
				<% for(int index=1;index<numFilesCount+1;index++) {		
					if(index==numFilesCount){
						out.println("{x: 'ping"+index+"', y: timetaken"+index+"}");
					} else {
						out.println("{x: 'ping"+index+"', y: timetaken"+index+"},");
					}
				
				} %>
				  ],
				  xkey: 'x',
				  ykeys: ['y'],
				  labels: ['Time Taken'],
				  barColors: function (row, series, type) {
				    if (type === 'bar') {
				      var red = Math.ceil(255 * row.y / this.ymax);
				      return 'rgb(' + red + ',200,100)';
				    }
				    else {
				      return '#000';
				    }
				  }
				});
				</pre>		
		</div>		
		</div>		
		</div>		
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
            </div>
            <!-- /.row -->
        </div>


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
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
</body>

</html>



	
