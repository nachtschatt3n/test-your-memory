class RemoveSrcFromImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :src, :string
  end
end
