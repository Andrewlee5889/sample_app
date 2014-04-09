class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#derp derp signed in
			sign_in user
			redirect_to user
		else
			#derp derp WRONG INFORMATION
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end
	def destroy
		sign_out
		redirect_to root_url
	end
end
