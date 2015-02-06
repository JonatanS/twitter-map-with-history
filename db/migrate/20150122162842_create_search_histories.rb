class CreateSearchHistories < ActiveRecord::Migration
  def change
    create_table :search_histories do |t|
      t.string :searchstring
      t.string :address
      t.integer :radius
      t.integer :num_results
      t.integer :num_images
      t.timestamps
    end
  end
end
