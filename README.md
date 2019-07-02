# Message Hub
  A message board application by Matthew Farley

  Hosted on [Heroku](https://mtf-message-hub.herokuapp.com)

### Dependencies
Ruby v2.3.3  
Rails v4.2.8

### Setup
1. `git clone https://github.com/MatthewTFarley/message_hub.git`
2. `cd message_hub/`
3. `bundle install`
4. `rake db:setup`
5. `rails s`
6. Visit `localhost:3000` in your browser
7. Sign in with auto-created account...

   email: `admin@mh.com`  
   password: `password`

  ...or sign up for your own account.


### Customizations
* Haml for view templating
* RSpec for testing
* Puma app server

### Testing
Execute specs with `rspec`
