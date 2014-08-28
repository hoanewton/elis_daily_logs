class AddAttachmentPhotoToBabies < ActiveRecord::Migration
  def self.up
    change_table :babies do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :babies, :photo
  end
end
