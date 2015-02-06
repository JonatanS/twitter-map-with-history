class SearchHistoriesController < ApplicationController
	before_action :authenticate_user!

	def index
		# tabular view of search history and ability to start new search from here
		@search_histories = SearchHistory.where(user_id: current_user.id)
	end
end
