# RVM

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
#set :rvm_ruby_string, 'default'
set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.9.3-p0@sametut'


task :trust_rvmrc do
    run "rvm rvmrc trust #{latest_release}"
end


# Bundler

require "bundler/capistrano"

# General

set :application, "SameTut"
set :user, "root"

#set :deploy_to, "/home/#{user}/#{application}"
set :deploy_to, "/home/sametut/#{application}"
set :deploy_via, :copy

#set :use_sudo, false

# Git

set :scm, :git
set :repository,  "/media/Work/Dropbox/rails_sites/#{application}/.git"
set :branch, "master"

# VPS

role :web, "kursor.org.ua"
role :app, "kursor.org.ua"
role :db,  "kursor.org.ua", :primary => true
role :db,  "kursor.org.ua"

# Passenger

namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end
