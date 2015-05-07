<!DOCTYPE html>
<html lang="en">

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

    <!-- Timeline CSS -->
    <link href="../dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">

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
                    <h1 class="page-header"><span class="text-primary">Welcome <%= session.getAttribute("userFullName")%>,</span></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">


                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-peach">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-plus-square fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">A</div>
                                    <div>Add</div>
                                </div>
                            </div>
                        </div>
                        <a href="addcentinel.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">Add Centinel</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>


                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-upload fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">U</div>
                                    <div>Upload</div>
                                </div>
                            </div>
                        </div>
                        <a href="upload.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">Upload Experiments</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>


                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-calendar fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">S</div>
                                    <div>Schedule</div>
                                </div>
                            </div>
                        </div>
                        <a href="schedule.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">Schedule Experiment</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
		<div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-flask fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">E</div>
                                    <div>Experiments</div>
                                </div>
                            </div>
                        </div>
                        <a href="experimentlist.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">Experiment List</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
	    </div>
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">R</div>
                                    <div>Results</div>
                                </div>
                            </div>
                        </div>
                        <a href="results.jsp">
                            <div class="panel-footer"  data-toggle="tooltip" data-placement="bottom" title="View Results of the Experiments performed earlier"   >
				<a href="logout.html">
                                <span class="pull-left">View Results</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
				</a>
                            </div>
                        </a>
                    </div>
                            

	  </div>


                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-bar-chart fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">CR</div>
                                    <div>Compare</div>
                                </div>
                            </div>
                        </div>
                        <a href="compareResults.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">Compare Results</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>




<!-- Start Section for Utility Box -->
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-brown">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-server fa-5x"></i><!-- share server-->
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">S</div>
                                    <div>Server</div>
                                </div>
                            </div>
                        </div>
                        <a href="server.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">Server Information</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
<!-- End Section for Utility Box -->

<!-- Start Section for Utility Box -->
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-purple">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-street-view fa-4x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">L</div>
                                    <div>Location</div>
                                </div>
                            </div>
                        </div>
                        <a href="locate.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">Locate Yourself</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
<!-- End Section for Utility Box -->


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

    <!-- Morris Charts JavaScript -->
    <script src="../bower_components/raphael/raphael-min.js"></script>
    <script src="../bower_components/morrisjs/morris.min.js"></script>
    <script src="../js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
