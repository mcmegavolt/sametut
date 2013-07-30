  namespace :db do

  desc "Erase database tables"
  task :erase => :environment do

    system "rake db:drop && rake db:create && rake db:migrate && rake db:populate"

  end
end