role :app, %w{ubuntu@cervezaya.com}
role :web, %w{ubuntu@cervezaya.com}
role :db,  %w{ubuntu@cervezaya.com}

server 'cervezaya.com', user: 'ubuntu', roles: %w{web app}

set :ssh_options, {
  keys: %w(~/.ssh/teysa.pem),
  forward_agent: false,
  auth_methods: %w(publickey)
}
