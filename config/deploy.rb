require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_type, :system
set :whenever_command, "bundle exec whenever"
set :application, "pnw"
set :repository,  "git@github.com:scotthillson/pnw.git"
set :user, 'root'
set :use_sudo, false
set :scm, :git
set :ssh_options, { :forward_agent => true }
set :branch, fetch(:branch, "master")
set :deploy_via, :remote_cache
default_run_options[:pty] = true  # Must be set for the password prompt from git to work

task :dev do
  set :rails_env, 'development'
  set :deploy_to, "/home"
  role :web, "pnwsar.org"
  role :app, "pnwsar.org"
  role :db,  "pnwsar.org", :primary => true
end

task :production do
  set :rails_env, 'production'
  set :deploy_to, "/home"
  role :web, "pnwsar.org"
  role :app, "pnwsar.org"
  role :db,  "pnwsar.org", :primary => true
end

after 'deploy:update_code', 'deploy:migrate'
after "deploy:restart",     "deploy:cleanup"

# For restarting passenger
#namespace :deploy do
#  task :start do ; end
#  task :stop do ; end
#  task :restart, :roles => :app, :except => { :no_release => true } do
#    run "touch #{File.join(current_path,'tmp','restart.txt')}"
#  end
#end
