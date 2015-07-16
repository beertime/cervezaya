require 'gcm'

namespace :notifications do

  desc "Send push notification to all users"
  task all: :environment do
    # app_name = com.cervezaya.cervezaya
    gcm = GCM.new("AIzaSyBYl5YOb5zcx2nJFsp8anqck4i80LDhxfk")
    registration_ids = User.all.pluck(:push_uid)
    options = {data: {score: "123"}, collapse_key: "updated_score"}
    gcm.send(registration_ids, options)
  end

end