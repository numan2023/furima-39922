class AddNameToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :name, :string, null: false
    add_column :items, :content, :text, null: false
    add_column :items, :category_id, :integer, null: false
    add_column :items, :condition_id, :integer, null: false
    add_column :items, :delivery_fee_id, :integer, null: false
    add_column :items, :delivery_region_id, :integer, null: false
    add_column :items, :delivery_date_id, :integer, null: false
    add_column :items, :price, :integer, null: false
    add_reference :items, :user, null: false, foreign_key: true
  end
end
