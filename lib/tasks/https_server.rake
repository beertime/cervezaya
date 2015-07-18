namespace :https_server do
  desc "This command start a thin ssl server"
  task :start do
    puts "Starting SSL Server using Thin..."
    exec "thin start -p 3001 --ssl --ssl-key-file #{ENV["SSL_CERT_KEY"]} --ssl-cert-file #{ENV["SSL_CERT_CRT"]}"
  end
end
