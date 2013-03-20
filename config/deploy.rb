require "rvm/capistrano"
require "bundler/capistrano"
# require "whenever/capistrano"
# require "delayed/recipes"
# require 'thinking_sphinx/deploy/capistrano'

set :rvm_type, :system
set :application, "sametut"
set :scm, :git
set :repository,  ".git"
set :branch, "develop"
server "91.239.233.144", :web, :app, :db, :primary => true
set :ssh_options, { :forward_agent => true, :paranoid => false }
set :user, "sametut"
set :password, "s!AmeTu7_0RgU@"
set :use_sudo, false
set :deploy_via, :copy
set :deploy_to, "/home/sametut/#{application}"
set :normalize_asset_timestamps, false

set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

set :keep_releases, 5
after "deploy:update", "deploy:cleanup"

# set :whenever_command, "bundle exec whenever"
# set :rails_env, "production" #added for delayed job


namespace :deploy do
  
  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

  # task :sitemap_refresh do
  #   run "cd '#{current_path}' && #{rake} sitemap:refresh RAILS_ENV=#{rails_env}"
  # end

  # task :migrate_database do
  #   run "cd '#{current_path}' && #{rake} db:migrate RAILS_ENV=#{rails_env}"
  # end

end

# after  "deploy:finalize_update", "deploy:migrate_database"
# after 'deploy:finalize_update', "deploy:sitemap_refresh"

# ==============================
# Uploads
# ==============================

namespace :uploads do

  desc <<-EOD
    Creates the upload folders unless they exist
    and sets the proper upload permissions.
  EOD
  task :setup, :except => { :no_release => true } do
    run "#{try_sudo} mkdir -p #{shared_path}/uploads"
    run "#{try_sudo} chmod 0777 -R #{shared_path}/uploads"
  end

  desc <<-EOD
    [internal] Creates the symlink to uploads shared folder
    for the most recently deployed version.
  EOD
  task :symlink, :except => { :no_release => true } do
    run "rm -rf #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end

  desc <<-EOD
    [internal] Computes uploads directory paths
    and registers them in Capistrano environment.
  EOD
  task :register_dirs do
    set :uploads_dirs,    %w(uploads)
    set :shared_children, fetch(:shared_children) + fetch(:uploads_dirs)
  end

  after       "deploy:finalize_update", "uploads:symlink", "deploy:migrate_database"
  on :start,  "uploads:register_dirs"

end


########### SPHINX

# namespace :sphinx do
#   desc "Symlink Sphinx indexes"
#   task :symlink_indexes, :roles => [:app] do
#     run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/sphinx"
#   end
# end

# before 'deploy:update_code', 'thinking_sphinx:stop'
# after 'deploy:update_code', 'thinking_sphinx:start'

# after 'deploy:finalize_update', 'sphinx:symlink_indexes'

########### DELAYED JOB

# after "deploy:stop",    "delayed_job:stop"
# after "deploy:start",   "delayed_job:start"
# after "deploy:restart", "delayed_job:restart"
