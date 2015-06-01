class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :message
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
