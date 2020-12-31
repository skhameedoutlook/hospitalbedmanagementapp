class MainsController < ApplicationController
	def index

	end

	def register

	end

	def login
		
	end

	def create
		@user = User.new
		@user.username = params[:username]
		@user.password = params[:password]
		@user.usertype = "normal"
		# if @user.save
	 #      redirect_to 'http://localhost:3000/login'
	 #    else
	 #      render :register
	 #    end
	end

	def validatelogin

	end

	def logout

	end

	

end
