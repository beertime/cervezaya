class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :comment
      t.boolean :published, default: false

      t.belongs_to :bar, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
