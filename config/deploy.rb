# config valid only for current version of Capistrano
lock '3.11.0'

set :deploy_user, 'rzemyk87'
set :application, 'control'
set :repo_url, 'git@github.com:rzemyk87/control.git'

before :deploy, 'git:push'

# Defaults for capistrano/rails
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'private')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
