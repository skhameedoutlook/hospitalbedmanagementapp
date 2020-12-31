class AdminsController < ApplicationController
	def index
		@requests = Request.where(requestcompleted: false)
	end

	def show 

	end

	def approvecheckin
		@request = Request.where(id: params[:id])[0]
		@request.checkedin = true
		@request.checkintime = DateTime.now
		@request.requestcompleted = true
		@bed = Bed.where(bedtype: @request.bedtype)[0]
		@one = Integer(params[:qt])
		@two = Integer(@bed.quantity)
		@ok = false
		if @bed.quantity >= Integer(params[:qt])
			@bed.quantity -= Integer(params[:qt])
			@ok = true
			@bed.save
			@request.save
			redirect_to :controller => 'admins', :action => 'index'
		else 
			render :error
		end
		#@bed.save
		#@request.save
		#redirect_to :controller => 'admins', :action => 'index'
	end

	def approvecheckout
		@request = Request.where(id: params[:id])[0]
		@request.checkedout = true
		@request.checkouttime = DateTime.now
		@request.requestcompleted = true
		@bed = Bed.where(bedtype: @request.bedtype)[0]
		@bed.quantity += Integer(params[:qt])
		@bed.save
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

	def error
		@error = "Some error occured."
	end

end
