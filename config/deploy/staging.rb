set :stage, :staging
set :branch, 'master'
set :domain, 'controlcrm.pl' # required for automatic app restarts

# used in case we're deploying multiple versions of the same
# app side by side. Also provides quick sanity checks when looking
# at filepaths
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"

set :deploy_to, '/home/rzemyk87/domains/controlcrm.pl/public_ruby'

# server-based syntax
server 's34.mydevil.net', user: 'rzemyk87', roles: %w{web app db}, primary: true

# dont try and infer something as important as environment from
# stage name.
set :rails_env, :production

# set RVM gemset
set :rvm_type, :user
set :rvm_ruby_version, '2.3.8@default' # 2.1.6 is just example version of Ruby

Rake::Task["passenger:restart"].clear_actions

# MyDevil.net custom operations
namespace :deploy do
  # link app to location required by mydevil.net
  after :published, :symlink_to_public_ruby do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "rm -r #{fetch(:deploy_to)}/public_ruby"
      execute "ln -s #{fetch(:release_path)} #{fetch(:deploy_to)}/public_ruby"
    end
  end
  # automatically restart app after deploy
  after :published, :restart_app do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      execute "cd #{release_path} devil www restart #{fetch(:domain)}"
    end
  end
end