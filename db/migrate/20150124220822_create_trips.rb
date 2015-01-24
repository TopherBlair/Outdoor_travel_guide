class CreateTrips < ActiveRecord::Migration
  def change
    create_table "trips", force: true do |t|
	   	t.string   "name"
	    t.integer  "user_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
  	end
  	 add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree
	end
end
