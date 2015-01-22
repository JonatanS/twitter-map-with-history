class Location_Tweet
	##model without DB
	#http://stackoverflow.com/questions/14389105/rails-model-without-a-table
	# include ActiveModel::Validations
	# include ActiveModel::Conversion
	# extend ActiveModel::Naming

	attr_accessor :message, :latitute, :longitude, :address, :num_retweets, :date_time, :image_url

	def initialize(msg, lat, lon, address, num_retweets, date_time, img_url)
		self.message = msg
		self.latitute = lat
		self.longitude = lon
		self.address = address
		self.num_retweets = num_retweets
		self.date_time = date_time
		self.image_url = img_url
	end

	# def persisted?
	# 	false
	# end

end