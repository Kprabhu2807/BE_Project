<!doctype html>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.twitter.bean.RealTweetStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<html class="no-js" lang="en">

    <head>
        <!-- META DATA -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		

        <!--font-family-->
		<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">
		
		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		
		<link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
		
        <!-- TITLE OF SITE -->
        <title>Covid Sentiment Detection</title>

        <!-- for title img -->
		<link rel="shortcut icon" type="image/icon" href="assets/images/logo/favicon.png"/>
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!--linear icon css-->
		<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
		
		<!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">
		
		<!--hover.css-->
        <link rel="stylesheet" href="assets/css/hover-min.css">
		
		<!--vedio player css-->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">

		<!--owl.carousel.css-->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
		<link href="assets/css/owl.theme.default.min.css" rel="stylesheet"/>

        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- bootsnav -->
		<link href="assets/css/bootsnav.css" rel="stylesheet"/>	
        
        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">
        
        <link href="css/charisma-app.css" rel="stylesheet">
    <link href='bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='css/jquery.noty.css' rel='stylesheet'>
    <link href='css/noty_theme_default.css' rel='stylesheet'>
    <link href='css/elfinder.min.css' rel='stylesheet'>
    <link href='css/elfinder.theme.css' rel='stylesheet'>
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='css/uploadify.css' rel='stylesheet'>
    <link href='css/animate.min.css' rel='stylesheet'>
	<link href='css/own.css' rel='stylesheet'>
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		
        <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
    </head>
	
	<body>

		
		<!--menu start-->
		<section id="menu">
			<div class="container">
				<div class="menubar">
					<nav class="navbar navbar-default">
					
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							
						</div><!--/.navbar-header -->

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav navbar-right">
								  <li><a href="admin_home.jsp">Home</a>
                        </li>
                        <li><a href="AdminUserController"> List Users</a>
                        </li>
                        <li><a  href="AdminTweetViewController">View Tweets</a></li>
                       
                        <li><a href="AdminRealTweetController">Real-time Tweets</a></li>
                        <li><a href="RealTweepy">Real-time Tweets2</a></li>
                        <li><a href="FakeNewsController">Fake News Detection</a></li> 
                           
								   <li><a href="UserLogoutController">Logout</a></li> 
							</ul><!-- / ul -->
						</div><!-- /.navbar-collapse -->
					</nav><!--/nav -->
				</div><!--/.menubar -->
			</div><!-- /.container -->

		</section><!--/#menu-->
		<!--menu end-->
		

		<!--contact start-->
		<section  class="contact">
			<div class="container">
				<div class="contact-details">
					
					<div class="contact-content">
						<div class="row">
							
							<div class="col-sm-12">
								<div class="single-contact-box">
									<div class="contact-form">
										<h3>Real Time Tweets</h3>
		 <table class="table table-striped table-bordered  responsive">
   			<thead>
    		<tr>
    			<th>Cluster ID</th>
        		<th>Tweet ID</th>
        		<th>Tweet Content</th> 
        		<th>POS Tagging</th>
        		<th>Keywords</th>     	
        			
    		</tr>
    		</thead>
    		<tbody>
    		<%
							HashMap<Integer, ArrayList<RealTweetStream>> clusterTwitList = (HashMap<Integer, ArrayList<RealTweetStream>>)session.getAttribute("ClusterTweetList");
							if(clusterTwitList!=null){
								for(Entry<Integer, ArrayList<RealTweetStream>> entry: clusterTwitList.entrySet()){
									int key = entry.getKey();
									ArrayList<RealTweetStream> comList = clusterTwitList.get(key);
									
									for(int i=0;i<comList.size();i++){
						%>
						
									<tr>
									<td><%=key %></td>
									<td><%=comList.get(i).getTwitId() %></td>
									<td><%=comList.get(i).getTweetContent() %></td>				
									<td><%=comList.get(i).getPosTag() %></td>								
									<td><%=comList.get(i).getTopicKeywords().toString() %></td>
									
									</tr>
						<%										
									}
								}
									
							}								
							
						%>

    		</tbody>
    		</table>
    		<div class="clearfix"></div>
					
                                        				
                    <p class="left col-md-5">
                        <a class="btn btn-primary" href="AdminShamingDetectionController"> Classification</a>
                   </p>
                   
        </div>
        				
									</div><!--/.contact-form-->
								</div><!--/.single-contact-box-->
							</div><!--/.col-->
						</div><!--/.row-->
					</div><!--/.contact-content-->
				</div><!--/.contact-details-->
			</div><!--/.container-->

		</section><!--/.contact-->

		
		<!-- footer-copyright start -->
		<footer class="footer-copyright">
			<div class="container">
				<div class="row">
					<div class="col-sm-7">
						<div class="foot-copyright pull-left">
							<p>
								&copy; All Rights Reserve
							 	
							</p>
						</div><!--/.foot-copyright-->
					</div><!--/.col-->
					
				</div><!--/.row-->
				
			</div><!-- /.container-->

		</footer><!-- /.footer-copyright-->
		<!-- footer-copyright end -->



		<!-- jaquery link -->

		<script src="assets/js/jquery.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        
        <!--modernizr.min.js-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
		
		
		<!--bootstrap.min.js-->
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		
		<!-- bootsnav js -->
		<script src="assets/js/bootsnav.js"></script>
		
		<!-- for manu -->
		<script src="assets/js/jquery.hc-sticky.min.js" type="text/javascript"></script>

		
		<!-- vedio player js -->
		<script src="assets/js/jquery.magnific-popup.min.js"></script>


		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>


		<!--owl.carousel.js-->
        <script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
		
		<!-- counter js -->
		<script src="assets/js/jquery.counterup.min.js"></script>
		<script src="assets/js/waypoints.min.js"></script>
        
        <!--Custom JS-->
        <script type="text/javascript" src="assets/js/jak-menusearch.js"></script>
        <script type="text/javascript" src="assets/js/custom.js"></script>
		

    </body>
	
</html>