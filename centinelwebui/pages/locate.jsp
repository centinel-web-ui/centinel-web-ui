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

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

	
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

<script
src="http://maps.googleapis.com/maps/api/js">
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
                    <h1 class="page-header"><span class="text-primary">Your Location</span></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->


<%!
 String sessionUserName =""; 
 String sessionUserCountry ="";
%>
<%
  sessionUserName = session.getAttribute("uid").toString();
  sessionUserCountry = session.getAttribute("userCountryCode").toString();
 sessionUserCountry = sessionUserCountry.toLowerCase();

%>
<!-- Read JSON File -->
				
<script>
var latitude;
var longitude;
function myFunction(arr) {

latitude=arr[0].<%=sessionUserCountry%>.lat;
longitude=arr[0].<%=sessionUserCountry%>.long;

}

</script>
<script src="latlong.json"></script>
<script>
var myCenter=new google.maps.LatLng(latitude,longitude);

function initialize()
{

var mapProp = {
  center:new google.maps.LatLng(35.460669951495305, -11.25),
  zoom:2,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>	

<div id="googleMap" style="width:810px;height:450px;"></div>


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
