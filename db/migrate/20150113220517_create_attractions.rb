class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :title
      t.string :category
      t.string :url

      t.timestamps
    end
  end
end
