class LocationTweetsController < ApplicationController

	# def get_tweets
	# 	#@twitter_streaming_client = Twitter::Streaming::Client.new(TWITTER_CONFIG)
	# 	@twitter_rest_client = Twitter::REST::Client.new(TWITTER_CONFIG)		
	# binding.pry
	# 	@twitter_rest_client.search(@topics, result_type: "recent", geocode: "#{@my_city.latitude },#{@my_city.longitude },#{@radius}mi").take(100).each do |tweet|

 #  			if (tweet.geo?) then
 #  				# everse engineer the address from the lat lon. This will quickly exceed geocoder limit. Better to do so if user requests it
 #  				#s = Geocoder.search("#{tweet.geo.lat}, #{tweet.geo.long}")
 #  				#puts s[0].address
	# 			@arr_tweets<< Location_Tweet.new(tweet.text, tweet.geo.lat.to_f, tweet.geo.long.to_f, \
	# 				"address tbd", tweet.retweeted? ? tweet.retweet_count : 0, tweet.created_at.to_datetime, tweet.media? ? tweet.media[0].media_url.to_s : "")
	# 		end
	# 	end
	# 	#@twitter_display = @arr_tweets

	# 	puts "done initializing\n\n\n\n\n\n\n\n"

	# 	render :json => @arr_tweets

	# end
end
