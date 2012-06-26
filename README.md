## rolodecks

This is the base Rails application for the TDD day with Swipely. It provides a simple rolodex where users can enter in simple contact information. Simple to build, simple to deploy.

### development

```
bundle install --without production
rails generate rspec:install
```

### production
```
heroku create --stack cedar
git push heroku master
heroku run rake db:migrate
```
