<%@ page pageEncoding="utf-8"%>
	
	<form action="/account/signin" method="post" class="col-sm-6 col-sm-offset-3">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">LOGIN</h3>
			</div>
			<div class="panel-body">
				<div class="form-group">
					<label>Username</label>
					<input name="id" class="form-control">
				</div>
				<div class="form-group">
					<label>Password</label>
					<input name="password" class="form-control">
				</div>
				<div class="form-group">
					<input name="rem" type="checkbox" id="rem">
					<label for="rem">Remember me?</label>
				</div>
			</div>
			<div class="panel-footer">
				<button class="btn btn-default">Login</button>
			</div>
		</div>
	</form>