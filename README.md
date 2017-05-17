#AirAlien
### Developed by [Arief R Ramadhan](https://ariefrizky.com)

This is the Airbnb clone which learned from [Code4Startup](https://code4startup.com).


To Install this application on your local following prerequisite are needed

1) ruby 2.3.3
2) mysql database


Now after taking a fresh clone you need to do following things

1) Open terminal
2) cd project folder
3) project_folder_path$ bundle install (to install all dependency gems)
4) project_folder_path$ rake db:create (to create the database)
5) project_folder_path$ rake db:seed (to create sample entries in the database like degrees, categories) relations, admin user
6) project_folder_path$ rails s (to start rails server)
7) Go to the browser and open the url http://localhost:3000/admin
8) you will see admin login screen enter the test email and password which is admin@example.com and password is password.
9) now import all insurances, conditions, languages, procedures, degrees, categories, relations using csv sheets.

You can download the format of csv files from [Download CSV] (https://github.com/edigitalbros/airbnb/tree/staging-airbnb/public)

10) project_folder_path$ rackup private_pub.ru -s thin -E production (without to run this command send message will not reflect in the page)
11) Great! now you are ready open the url http://locahost:3000

What to do after pull the code:

