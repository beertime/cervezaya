role :app, %w{ubuntu@beta.cervezaya.com}
role :web, %w{ubuntu@beta.cervezaya.com}
role :db,  %w{ubuntu@beta.cervezaya.com}

set :branch, :develop

server 'beta.cervezaya.com', user: 'ubuntu', roles: %w{web app}

set :ssh_options, {
  keys: %w(~/.ssh/teysa.pem),
  forward_agent: false,
  auth_methods: %w(publickey)
}
