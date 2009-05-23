## Sinatra-Fuse

Sinatra-fuse is a start application for new sinatra projects. 

Sinatra-fuse focuses on sinatra applications hosted on [dreamhost][1].

### Deploying on Dreamhost with Capistrano

1.  Add New Domain / Sub-Domain: `app.domain.tld`
*  Check Ruby on Rails Passenger (mod_rails)
*  Specify your web directory: `/home/username/app.domain.tld/current/public/`
*  ssh to `domain.tld` and rm -rf `current` (Capistrano recreates current as a symbolic link pointing to the currently deployed version of the application)
*  [enable local gems][2] in your home directory in `$HOME/.gems`
*  `export RACK_ENV="production"`
*  Deploy: `cap deploy:setup`, `cap deploy:cold` and `cap:deploy`



[1]: http://www.dreamhost.com
[2]: http://wiki.dreamhost.com/RubyGems