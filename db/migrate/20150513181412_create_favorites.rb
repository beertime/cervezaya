class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :bar, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
