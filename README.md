## Sinatra-Fuse

Sinatra-fuse is a start application for new sinatra projects. 

Sinatra-fuse focuses on sinatra applications hosted on [Dreamhost][1].

### Deploying on Dreamhost with Capistrano

1.  Open "Add New Domain / Sub-Domain" in your [dreamhost panel][2] and enter your desired domain: `app.domain.tld`
*  Check Ruby on Rails Passenger (mod_rails)
*  Specify your web directory: `/home/username/app.domain.tld/current/public/`
*  ssh to `domain.tld` and `rm -rf current` (Capistrano recreates current as a symbolic link pointing to the currently deployed version of the application)
*  [enable local gems][2] in your home directory in `$HOME/.gems`
*  put `export RACK_ENV="production"` in your `.bash_profile` on Dreamhost
*  Deployment: `cap deploy:setup`, `cap deploy:cold` and `cap:deploy`



[1]: http://www.dreamhost.com
[2]: https://panel.dreamhost.com/
[2]: http://wiki.dreamhost.com/RubyGems