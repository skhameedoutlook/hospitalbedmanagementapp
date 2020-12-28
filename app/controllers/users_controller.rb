class UsersController < ApplicationController
	def index
		@requests = Request.where(requestcompleted: false, username: "hameed")
	end

	def listbeds
		@requests = Request.where(requestcompleted: false, username: "hameed")
		@beds = Bed.all
	end
end
