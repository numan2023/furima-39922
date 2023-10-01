class AddNicknameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :sei,      :string, null: false
    add_column :users, :mei,      :string, null: false
    add_column :users, :sei_kana, :string, null: false
    add_column :users, :mei_kana, :string, null: false
    add_column :users, :birthday, :date,   null: false
  end
end
