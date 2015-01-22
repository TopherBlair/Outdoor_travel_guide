class AddUniqueIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :unique_id, :string
  end
end
