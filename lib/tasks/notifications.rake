require 'gcm'

namespace :notifications do

  desc "Send push notification to all users"
  task all: :environment do
    # app_name = com.cervezaya.cervezaya
    gcm = GCM.new("AIzaSyBYl5YOb5zcx2nJFsp8anqck4i80LDhxfk")
    registration_ids = User.all.pluck(:push_uid)
    options = { data: { title: "CervezaYa", content: "Únete al cerveceo inteligente", type: "all" } }
    gcm.send(registration_ids, options)
  end

end
