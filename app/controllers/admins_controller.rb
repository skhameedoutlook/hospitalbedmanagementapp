class AdminsController < ApplicationController
	def index
		@requests = Request.where(requestcompleted: false)
	end

	def show 

	end

	def approvecheckin
		@request = Request.where(id: params[:id])[0]
		@request.checkedin = true
		@request.checkintime = DateTime.new
		@request.requestcompleted = true
		@request.save
		redirect_to :controller => 'admins', :action => 'index'
	end

	def approvecheckout
		@request = Request.where(id: params[:id])[0]
		@request.checkedout = true
		@request.checkouttime = DateTime.new
		@request.requestcompleted = true
		@request.save
		redirect_to :controller => 'admins', :action => 'index'
	end

	def disapprovecheckin
		@request = Request.find(params[:id]).destroy
		redirect_to :controller => 'admins', :action => 'index'
	end

	def disapprovecheckout
		@request = Request.where(id: params[:id])[0]
		@request.requestcompleted = true
		@request.save
		redirect_to :controller => 'admins', :action => 'index'
	end 

end
