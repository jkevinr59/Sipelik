
<!DOCTYPE html>
<?php

error_reporting(0); // Turn off all error reporting

?>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register Akun</title>
<link rel="icon" href="" type="image/x-icon">
<link href="{{URL::to ('assets/css/bootstrap.min.css')}}" rel="stylesheet">
<link href="{{URL::to ('assets/css/styles.css')}}" rel="stylesheet">
<script src="{{URL::to('assets/js/jquery-1.11.2.min.js')}}"></script>
<link href="{{URL::to ('assets/plugin/datatables/css/dataTables.bootstrap.css')}}" rel="stylesheet">
<script src="{{URL::to ('assets/plugin/datatables/js/jquery.dataTables.js')}}"></script>
<script src="{{URL::to ('assets/plugin/datatables/js/dataTables.bootstrap.js')}}"></script>
<script src="{{URL::to ('assets/js/bootstrap.min.js')}}"></script>
<script src="{{URL::to ('assets/plugin/TT/js/dataTables.tableTools.js')}}"></script>
<link href="{{URL::to ('assets/plugin/TT/css/dataTables.tableTools.css')}}" rel="stylesheet">

</head>

<body>
<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">LOGIN </div>
				@if (Session::has('message'))
    			<div class="alert alert-info">{{ Session::get('message') }}</div>
				@endif
				<div class="panel-body">
					 <form class="form col-md-12 center-block" action="{{URL::to('login')}}" method="POST" enctype="multipart/form-data">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="Username" name="username" type="text" autofocus="">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="password" type="password" value="">
							</div>
							{{csrf_field()}}
						 <button class="btn btn-primary btn btn-block">Masuk</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			
		</div>
		<!-- <div class="col-mdd-8">
			 <form role="form" action="{{URL::to('masanwarganteng')}}" method="POST" enctype="multipart/form-data">
			  <div class="form-group">
			    <label for="email">Username:</label>
			    <input type="text" class="form-control" id="username" name="username">
			  </div>
			  <div class="form-group">
			    <label for="pwd">Password:</label>
			    <input type="password" class="form-control" id="password" name="password">
			  </div>
			  <div class="checkbox">
			    <label><input type="checkbox"> Remember me</label>
			  </div>
			  {{csrf_field()}}
			  <button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div> -->
	<!-- /.row -->	
	
</body>
</html>
