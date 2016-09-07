#========================
#CONFIG
#========================
set :application, "sinatratesting"
 
set :repository, "git@github.com:wqsaali/sinatra-test2.git"

 
set :stage, :production


set :runner, "deploy"
set :deploy_to, "/var/rails/#{stage}/#{application}"
set :app_server, :passenger
set :domain, %w{root@23.253.215.138}
 
#========================
#ROLES
#========================
role :app, domain
role :web, domain
role :db, domain, :primary => true

#========================
#CUSTOM
#========================
 
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
 
  task :stop, :roles => :app do
    # Do nothing.
  end
 
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end
