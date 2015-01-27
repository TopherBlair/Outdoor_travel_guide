class ModifyAttractionTable < ActiveRecord::Migration
  def change
  	add_column :attractions, :unique_id, :string
  	add_column :attractions, :trip_id, :integer
  	remove_column :attractions, :category
  	remove_column :attractions, :url
  end
end
