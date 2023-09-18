class RemoveImageFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :image, :text
  end
end
