class LocationTweetsController < ApplicationController
	def get_tweets
		#@twitter_streaming_client = Twitter::Streaming::Client.new(TWITTER_CONFIG)
		@twitter_rest_client = Twitter::REST::Client.new(TWITTER_CONFIG)
		
		# SET DEFAULT VALUES FOR FIRST RUN

		@from_date = params[:from]
		@to_date = params[:to]

		@radius = params[:radius]

		if(@radius == nil) then 
			@radius = '200'
		end

		#gon.radius = @radius

		@topics = params[:keyword]
		#@city_name = params[:loc]
		if @topics == nil
			@topics = "coffee OR lunch"
		end

		if @from_date!="" && @from_date!=nil then
			@topics = @topics + " since:" + @from_date 
		end

		if @to_date!="" && @to_date!=nil then 
			@topics = @topics + " until:" + @to_date
		end

		@city_to_lookup = params[:lookup]
		if @city_to_lookup == nil 
			@city_to_lookup = "New York, NY" 
		end

		@city_found = true

		#use geocoder to add city
		#@my_city = City.new({ :address => @city_to_lookup })
		s = Geocoder.search("#{@city_to_lookup}")
		#binding.pry
		if s.count > 0 then
			#create a new city
			c = City.new
			c.latitude = s[0].latitude
			c.longitude = s[0].longitude
			c.address = s[0].formatted_address
			c.name = @city_to_lookup
			@my_city = c
		else
			@city_found = false
		end
		@arr_tweets = []
		#@twitter_display = []
		if @city_found then
			##initLocation is used to center the map (and specify zoom level based on radius)
			initLocation = Location_Tweet.new("",@my_city.latitude,@my_city.longitude,"",@radius,"","")
			@arr_tweets<<initLocation

			@twitter_rest_client.search(@topics, result_type: "recent", geocode: "#{@my_city.latitude },#{@my_city.longitude },#{@radius}mi").take(100).each do |tweet|

	  			if (tweet.geo?) then
	  				# everse engineer the address from the lat lon. This will quickly exceed geocoder limit. Better to do so if user requests it
	  				#s = Geocoder.search("#{tweet.geo.lat}, #{tweet.geo.long}")
	  				#puts s[0].address
					@arr_tweets<< Location_Tweet.new(tweet.text, tweet.geo.lat.to_f, tweet.geo.long.to_f, \
						"address tbd", tweet.retweeted? ? tweet.retweet_count : 0, tweet.created_at.to_datetime, tweet.media? ? tweet.media[0].media_url.to_s : "")
				end
			end
			#@twitter_display = @arr_tweets
		end
		puts "done initializing\n\n\n\n\n\n\n\n"

		render :json => @arr_tweets

	end
end
