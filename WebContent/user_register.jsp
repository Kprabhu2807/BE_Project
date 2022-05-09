<!doctype html>
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
								<li class="active"><a href="index.jsp">Home</a></li>
								
								<li><a href="user.jsp">User</a></li>
								<li><a href="admin.jsp">Admin</a></li>
								
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
							
							<div class="col-sm-5">
								<div class="single-contact-box">
									<div class="contact-form">
										<h3>User Register Here</h3>
										<form action="UserRegisterController" method="post" enctype="multipart/form-data">
										 <fieldset>                	
					<div class="form-group">
                        <label>First Name</label>
                        <input type="text" class="form-control" placeholder="First Name" name="fname" value="" pattern="[A-Za-z]+" title="Name must be alphabets only" required="required">
                    </div>            
                    <div class="clearfix"></div>					
					<div class="form-group">
                        <label>Last Name</label>
                        <input type="text" class="form-control" placeholder="Last Name" name="lname" value="" pattern="[A-Za-z]+" title="Name must be alphabets only" required="required">
                    </div>                    
                    <div class="clearfix"></div>
					<div class="form-group">
                        <label>Email-ID</label>
                        <input type="email" class="form-control" placeholder="Email-ID" name="email" value="" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="Email-Id must be valid format." required="required">
                    </div>
                    <div class="clearfix"></div>
					
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" placeholder="********" name="password1" value="" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Password must contain at least one number and one special character and one uppercase and lowercase letter, and at least 8 or more characters" required="required"> 
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group">
                        <label>Retype Password</label>
                        <input type="password" class="form-control" placeholder="********" name="password2" value="" onchange="return isPasswordMatch(password1,password2)" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Password must contain at least one number and one special character and one uppercase and lowercase letter, and at least 8 or more characters" required="required">
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group">
                        <label>Date of Birth</label>
                        <input type="date" class="form-control" placeholder="Date of Birth" name="dob" id="dob" value="" pattern="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d" title="Date should be month, date and year format (ex. 03/22/1990)" required="required">
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="form-group">
                        <label>Select Gender</label>&nbsp;&nbsp;
                        <input type="radio" name="gender" value="Male" checked="checked"> Male &nbsp;&nbsp;&nbsp;
                        <input type="radio" name="gender" value="Female"> Female
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group">
                        <label>Address</label>
                        <textarea class="form-control" placeholder="Address" name="address" rows="2"></textarea>
                    </div>
                    <div class="clearfix"></div>
					<div class="form-group">
                        <label>Mobile No.</label>
                        <input type="text" class="form-control" placeholder="Mobile No." name="contact" value="" pattern="[7-9]{1}[0-9]{9}" title="Mobile number must be starts with 7, 8 or 9 digit and total number of digits are 10" required="required">
                    </div>
                    <div class="clearfix"></div>
					
                    <div class="form-group">
						<label>Profile Image Upload</label>
						<input type="file" name="profilePic">
						<p class="help-block">(Examples of images .jpg, .jpeg, .png, etc format)</p>
					</div>
					                    				
                    <p class="left col-md-5">
                        <button type="submit" class="btn btn-primary">Sign-up</button>
                   </p>
                   
                    </div>
                </fieldset>
										</form><!--/form-->
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