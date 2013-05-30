angular-rails-hacking
=====================

Hacking on Angular Rails

This is an example Rails Application that integrates Angular into part of it.  The entire app is not Angular :-)

As the Angular part is for the Photo Albums you will see the ng-app and ng-view in users/albums/index.html.haml, 
and you will see routes matching some angular routes to that index.

The Photo Album is an example of a Master/Detail page where a list of Photo Albums is on the left and the Photos for
the selected Album appear on the right.  Thanks to those who helped me work this out!

## Setup
````
  bundle
  rake db:migrate
  rake db:seed
  rails s
  visit localhost:3000 and Sign In!
````

## HAML and Angular
Yes This uses HAML and so there is a haml_assets initializer so that we can reference the templates in Angular.
Also note that app.js.coffee is actually app.js.coffee.erb so we can use the asset_path helper