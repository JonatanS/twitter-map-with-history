class SearchHistoriesController < ApplicationController
	before_action :authenticate_user!

	def index
		# tabular view of search history and ability to start new search from here
		@search_histories = SearchHistory.where(user_id: current_user.id).sort_by { |h| h[:updated_at]}.reverse!
	end

	def destroy
		@history = SearchHistory.find_by_id(params[:id])
		if !@history.nil? then
			@history.destroy
		flash[:notice] = "Entry deleted" 
		end
		redirect_to :back
	end
end
