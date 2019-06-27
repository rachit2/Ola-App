class DriversController < ApplicationController

	
	def index

	end
	
	def new
		# binding.pry
		# @driver=User.new
	end
	
	def show
	# binding.pry
	end
	
	def edit
	end


	 def ride_request
	
     @customer= User.all.select{|m| m.role_ids == [2]}.last
     
	 end

# def create
# end
	


end