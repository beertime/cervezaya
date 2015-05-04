class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :title, null: false, default: ""
      t.text :description
      t.string :image
      t.date :start_date
      t.date :end_date
      t.time :start_hour
      t.time :end_hour
      t.boolean :recurrent
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday

      t.timestamps null: false
    end
  end
end
