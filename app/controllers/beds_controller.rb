class BedsController < ApplicationController
	def index
		@requests = Request.where(requestcompleted: false)
		@beds = Bed.all
	end

	def edit
		@bed = Bed.find(params[:id])
		@requests = Request.where(requestcompleted: false)
	end

	def update
		@bed = Bed.find(params[:id])
		if @bed.update(bed_params)
	      redirect_to beds_url
	    else
	      render :edit
	    end
	end

	def bed_params
		params.require(:bed).permit(:bedtype, :quantity)
	end
end
