class AddAttachmentSrcToImages < ActiveRecord::Migration[5.2]
  def self.up
    change_table :images do |t|
      t.attachment :src
    end
  end

  def self.down
    remove_attachment :images, :src
  end
end
