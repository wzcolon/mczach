#McZach

##Goals

- Support for logging data for multiple applications
- An API to log data for the app specified in the request payload
- Web Interface for viewing graphs of data for individual applications (using
  JQuery plugins)
- This README
- Tests to verify features
- Host repository on Github and Heroku

##Construction

To support logging for multiple web applications, two tables were created -
'applications' and 'request logs'. A 'has many' relationship exists in that a
application has many request logs. As requests are processed the submitted
application name is checked against the database or added to it in the Logger
class.

The API itself provides an endpoint to submit data to (instructions below). As
each request is processed, a record is created in the request logs table.

Viewing the reports for a given application utilizes the JQuery plugin
'jqplot'. The controller is responsible for setting up instance variables and
a helper method provides the means to average the attributes displayed.

Tests were created to test the models and Logger class.

##Demoing the App

To demo the app visit [the app here](http://polar-depths-8384.herokuapp.com/).

Several applications should be viewable from previously submitted requests.

To submit a request make a POST request to http://polar-depths-8384.herokuapp.com/api/logs/log via curl or by visiting an online service such as [Hurl It](http://hurl.it/).

The JSON payload should be similar to the following; however you may wish to change the values being sumbitted including the application name. Please note that the 'api key' is mandatory.

``
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d "{\"request_data\":{\"time_in_ruby\":20,\"time_in_db\":3,\"time_rendering\":200,\"application_name\":\"SomeApp\"},\"api_key\":\"644721eedb95f223d45b4461a03ea1995e1ffe159d1a1dd3bcfbc89ed0222926\"}" http://polar-depths-8384.herokuapp.com/api/logs/log
``
