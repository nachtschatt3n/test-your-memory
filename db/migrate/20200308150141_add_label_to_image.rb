class AddLabelToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :label, :string
  end
end
