#http://railscasts.com/episodes/273-geocoder
class City 
	# extend Geocoder::Model::ActiveRecord
	# 	# http://www.rubygeocoder.com/
	# geocoded_by :address
	# reverse_geocoded_by :latitude, :longitude
	# after_validation :geocode, :reverse_geocode
	
	##model without DB
	#http://stackoverflow.com/questions/14389105/rails-model-without-a-table
	# include ActiveModel::Validations
	# include ActiveModel::Conversion
	# extend ActiveModel::Naming

	##addedd attr_accessor
	attr_accessor :address, :latitude, :longitude, :name
	

	
end
