## Sinatra Fuse

Sinatra fuse is a sinatra start-up application.

### Deploying on Dreamhost with Capistrano

1. Add New Domain / Sub-Domain: `app.domain.tld`
2. Check Ruby on Rails Passenger (mod_rails)
3. Specify your web directory: `/home/username/app.domain.tld/current/public/`
4. ssh to `domain.tld` and rm -rf `current` (Capistrano recreates current as a symbolic link pointing to the currently deployed version of the application)