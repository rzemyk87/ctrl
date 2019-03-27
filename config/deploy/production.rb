role :app, %w{s34.mydevil.net}
role :web, %w{s34.mydevil.net}
role :db,  %w{s34.mydevil.net}
server 's34.mydevil.net', user: 'rzemyk87', roles: %w{web app db}
set :rails_env, :production
set :deploy_to, '/home/rzemyk87/domains/controlcrm.pl/public_ruby'