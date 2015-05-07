class AddParamsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :integer
    add_column :users, :username, :string, null: false, default: ""
    add_column :users, :publicname, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :avatar, :string
    add_column :users, :gender, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :birth, :date
    add_column :users, :active, :string
    add_column :users, :admin, :boolean, default: false

    add_index :users, :uid, unique: true
    add_index :users, :username, unique: true
  end
end
