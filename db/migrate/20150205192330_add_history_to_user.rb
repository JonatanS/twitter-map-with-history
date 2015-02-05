class AddHistoryToUser < ActiveRecord::Migration
  def change
  	add_column :search_histories, :user_id, :integer
  end
end
