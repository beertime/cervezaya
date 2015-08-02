class AddZoneToBars < ActiveRecord::Migration
  def change
    add_reference :bars, :zone, index: true, foreign_key: true
  end
end
