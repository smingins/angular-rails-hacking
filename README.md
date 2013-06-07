angular-rails-hacking
=====================

Hacking on Angular Rails

This is an example Rails Application that integrates Angular into part of it.  The entire app is not Angular :-)

As the Angular part is for the Photo Albums you will see the ng-app and ng-view in users/albums/index.html.haml, 
and you will see routes matching some angular routes to that index.

The Photo Album is an example of a Master/Detail page where a list of Photo Albums is on the left and the Photos for
the selected Album appear on the right.  Thanks to those who helped me work this out!


![Alt text](app/assets/images/screenshot.png?raw=true)



## Branches

I decided to create branches at certain points.

### Initial Master Detail

This has no uploading and does not require imagemagick.  The initial feature was simply to show a master list on the left and selected detail on the right.  And it allows adding to the master list.

https://github.com/smingins/angular-rails-hacking/tree/master-detail

## Photo Uploading

Added photo uploading that uses a directive to wrap around jquery file upload.  Paperclip handles the attachment.

Paperclip requires imagemagick.

https://github.com/smingins/angular-rails-hacking/tree/photo-upload


### Current

This added photo uploading to the selected Album using jquery fileupload wrapped in an Angular directive.  Took some directive hacking though.

## Setup

Requires imagemagick for Paperclip gem see https://github.com/thoughtbot/paperclip

````
brew install imagemagick
````

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