role :app, %w{ubuntu@cervezaya-staging}
role :web, %w{ubuntu@cervezaya-staging}
role :db,  %w{ubuntu@cervezaya-staging}

set :branch, :develop

server 'cervezaya-staging', user: 'ubuntu', roles: %w{web app}

set :ssh_options, {
  keys: %w(~/.ssh/teysa.pem),
  forward_agent: false,
  auth_methods: %w(publickey)
}
