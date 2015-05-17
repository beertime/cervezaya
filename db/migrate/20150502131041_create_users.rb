class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :push_uid
      t.string :facebook_uid
      t.string :google_uid
      t.string :email
      t.string :username
      t.string :publicname
      t.string :avatar
      t.string :gender
      t.string :country
      t.string :city
      t.date :birth
      t.boolean :active

      t.timestamps null: false
    end

    add_index :users, :push_uid, unique: true
    add_index :users, :facebook_uid, unique: true
    add_index :users, :google_uid, unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
