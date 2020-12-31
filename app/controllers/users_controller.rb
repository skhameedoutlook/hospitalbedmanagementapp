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
end
