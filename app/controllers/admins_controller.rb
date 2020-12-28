class AdminsController < ApplicationController
	def index
		@requests = Request.where(requestcompleted: false)
	end

	
end
