class UsersController < ApplicationController
	def index
		@requests = Request.where(requestcompleted: false, username: "hameed")
	end

	def listbeds
		@requests = Request.where(requestcompleted: false, username: "hameed")
		@beds = Bed.all
	end

	def previous
		@requests = Request.where(requestcompleted: true, username: "hameed")
	end

	def checkout
		@request = Request.where(id: params[:id])[0]
		@request.requestcompleted = false
		@request.save
		redirect_to :controller => 'users', :action => 'previous'
	end

	def bill
		@request = Request.where(id: params[:id])[0]
		@cost = Bed.where(bedtype: @request.bedtype)[0].cost
		@totaltime = (Time.parse(@request.checkouttime.to_s)-Time.parse(@request.checkintime.to_s))/(60*60)
	end

	def register
		@user = User.new
	end

	def login
		
	end

	def create
		@user = User.new(user_params)
		@user.usertype = "normal"
		if @user.save
	      redirect_to 'http://localhost:3000/users/login'
	      return
	    else
	      redirect_to 'http://localhost:3000/users/register'
	      return
	    end
	end

	def validatelogin
		@user = User.where(username: params[:username], password: params[:password])
		@ok = false
		if @user.count == 0
			redirect_to 'http://localhost:3000/users/login'
			return
		end
		@user = @user[0]
		session[:username] = params[:username]
		if @user.usertype == "admin"
			session[:usertype] = "admins"
			redirect_to 'http://localhost:3000/admins'
			return
		else 
			session[:usertype] = "users"
			redirect_to 'http://localhost:3000/users'
			return
		end
	end

	def logout
		session.delete(:username)
		session.delete(:usertype)
		redirect_to 'http://localhost:3000'
	end

	def user_params
		params.require(:user).permit(:username, :password, :usertype)
	end
end


