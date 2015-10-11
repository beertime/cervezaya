class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :iso_country_code
      t.string :subdivision_code
      t.string :gns_fd
      t.string :gns_ufi
      t.string :iso_language_code
      t.string :language_script
      t.string :name
      t.float :latitude
      t.float :longitude
    end
  end
end
