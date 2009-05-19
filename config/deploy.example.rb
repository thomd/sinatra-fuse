
set :user, "{SSH USERNAME}"
set :domain, '{DOMAIN OF APPLICATION}'

set :repository,  "#{user}@{DREAMHOST DOMAIN}:{PATH TO REPOSITORY}"
set :deploy_to, "/home/#{user}/#{domain}" 
set :deploy_via, :remote_cache
set :scm, 'git'
set :scm_username, "{GIT USERNAME}"
set :scm_password, "{GIT PASSWORD}"
set :branch, "master"
set :git_shallow_clone, 1
set :use_sudo, false
set :keep_releases, 3 

server domain, :app, :web


namespace :deploy do
  
  desc "restart the application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end


after 'deploy:setup', 'gems:install'
after 'deploy:update_code', 'gems:symlink'

namespace :gems do

  desc "install rack and sinatra gems"
  task :install do
    run 'gem install rack -v 0.9.1'
    run 'gem install sinatra -v 0.9.1.1'
    run "cd #{shared_path}/system && gem unpack rack -v 0.9.1 && mv rack-* rack"
    run "cd #{shared_path}/system && gem unpack sinatra -v 0.9.1.1 && mv sinatra-* sinatra"
  end

  desc "set up vendor folder and set symlinks to rack and sinatra"
  task :symlink do
    run "mkdir -p #{release_path}/vendor/"
    run "ln -nfs #{shared_path}/system/rack #{release_path}/vendor/rack"
    run "ln -nfs #{shared_path}/system/sinatra #{release_path}/vendor/sinatra"
  end
end