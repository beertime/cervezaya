class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :value
      t.belongs_to :user, index: true
      t.belongs_to :bar, index: true

      t.timestamps null: false
    end
  end
end
