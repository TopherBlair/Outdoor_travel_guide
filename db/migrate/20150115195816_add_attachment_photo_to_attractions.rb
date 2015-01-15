class AddAttachmentPhotoToAttractions < ActiveRecord::Migration
  def self.up
    change_table :attractions do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :attractions, :photo
  end
end
