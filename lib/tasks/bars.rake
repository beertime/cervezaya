namespace :bars do
  desc "Asign a zone to each bar"
  task assign_zones: :environment do
    puts "Starting..."
    Bar.all.where(zone_id: nil).each do |b|
      zone = Zone.where("ST_Contains(ST_GeomFromGeoJSON(geometry), ST_GeomFromText('POINT(#{b.longitude} #{b.latitude})'))").take
      if zone
        b.update_attribute('zone_id', zone[:id])
        puts "Bar #{b.id} has been updated"
      end
    end
  end
end
