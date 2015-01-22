class TwitterAppsController < ApplicationController
  def index

  	if @city_to_lookup == nil && @topics == nil then

	  	# need to init twitter search here
	  	@city_to_lookup == "New York, NY"
	  	@topics == "coffee OR lunch"
	  	# binding.pry
  	end

  end


  def history
  end
end
