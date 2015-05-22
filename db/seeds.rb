# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'csv'

# if Product.count == 0
#   csv_text = File.read("#{Rails.root}/db/fixtures/products_bars_20150519.csv")
#   csv = CSV.parse(csv_text, :headers => true)
#   csv.each do |row|
#     Product.create!(row.to_hash)
#   end
# end

# Importing franchises
# csv_text = File.read("#{Rails.root}/db/fixtures/products_franchises_20150521.csv")
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   r = row.to_s.split(',')
#   brand_id = r[0]
#   size_id = r[1]
#   price = r[2]
#   product = Product.where(bar_id: nil, brand_id: brand_id, size_id: size_id, price: price).first
#   product.update(row.to_hash)
# end
