class AddTripIdToAttractions < ActiveRecord::Migration
  def change
  	remove_column :attractions, :trip_id, :integer
    add_reference :attractions, :trip, index: true
  end
end
