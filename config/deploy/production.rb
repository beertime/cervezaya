role :app, %w{ubuntu@cervezaya}
role :web, %w{ubuntu@cervezaya}
role :db,  %w{ubuntu@cervezaya}

server 'cervezaya', user: 'ubuntu', roles: %w{web app}

set :ssh_options, {
  keys: %w(~/.ssh/teysa.pem),
  forward_agent: false,
  auth_methods: %w(publickey)
}
