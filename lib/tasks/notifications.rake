require 'gcm'

namespace :notifications do

  desc "Send push notification to all users"
  task all: :environment do
    # app_name = com.cervezaya.cervezaya
    gcm = GCM.new(ENV['GCM_KEY'])
    message = "⚡🍺 ¿Quien dijo que los Martes no era un buen día para cervecear? ¡Hazlo de forma inteligente! 🍺✨"
    registration_ids = User.all.pluck(:push_uid)
    options = { data: { title: "CervezaYa", content: message, type: "all" } }
    gcm.send(registration_ids, options)
  end

  desc "Send push notification to Nacho"
  task nacho: :environment do
    # app_name = com.cervezaya.cervezaya
    gcm = GCM.new(ENV['GCM_KEY'])
    message = "⚡🍺 ¿Quien dijo que los Martes no era un buen día para cervecear? ¡Hazlo de forma inteligente! 🍺✨"
    registration_ids = User.where(id: 74).pluck(:push_uid)
    options = { data: { title: "CervezaYa", content: message, type: "all" } }
    gcm.send(registration_ids, options)
  end

end
