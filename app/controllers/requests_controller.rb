class RequestsController < ApplicationController
	def new

	end

	def show
		@requests = Request.where(requestcompleted: false, username: session[:username])
		@bed = Bed.find(params[:id])
		@request = Request.new :username => "hameed", :bedtype => @bed.bedtype, :requestcompleted =>false, :checkedin => false, :checkedout =>false
	end

	def create
		@request = Request.new(request_params)
		@request.username = session[:username]
	    if @request.save
	      redirect_to 'http://localhost:3000/users'
	    else
	      render :new
	    end
	end

	def request_params
		params.require(:request).permit(:username, :bedtype, :quantity, :requestcompleted, :checkedin, :checkedout, :checkintime, :checkouttime)
	end
end
