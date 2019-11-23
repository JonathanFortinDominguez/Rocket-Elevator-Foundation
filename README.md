Week 10 TDD

The code for the module is in the /lib/elevator_media/streamer.rb file.

The ElevatorMedia module was developped with the Red-Green-Refactoring method and the TDD with Rspec. Inside the module, there is a standard method called "getContent" that returns HTML content. The preferred content here was cute and funny dog pictures. 

You can also get weather info and authenticate on Spotify and find users with getContent. Simplecov was integrated to the TDD.

The files where the TDD was accomplished are located here : /lib/elevator_media/streamer.rb and /spec/lib/elevator_media/streamer_spec.rb 

-"validates returning html" test checks if getContent returned valid html information.

-the 'verifies if we got a spotify response' confirmes we get a response from the spotify API through rspotify gem.

-the 'was able to get a forecasted weather response from API' test confirmed we got a response from the OpenWeather API through the gem

There is a bit of redundancy, but all the 14 tests work and Simplecov shows 100% in it's coverage.

Week 9

Website : Rocketelevatorworldwide.com <br>
API REST : https://restapireworldwide.azurewebsites.net/ <br>
Zendesk : https://rocketelevatorsquebec.zendesk.com <br>

To create and seed database you can use bundle exec rake db:reset (about 10 interventions were created manually, 
so if you drop the database they won't be there anymore). <br>

For the data warehouse you can run bundle exec dwh:db:drop, dwh:db:create, dwh:db:migrate and dwh:pg_sync <br>

You can log in with your email from codeboxx and the password is test123 <br>

When you're logged in, you'll see the intervention form on the left dashboard menu, or you can click on home and you'll see it in the 
header menu. You can create an intervention from there and a ticket will be created on zendesk and an intervention will be added 
to the database. When you don't select an employee, an error pops up, which can be easily corrected by either setting it to null:true 
in the migration or creating a selectable prompt (since it's optional in the interventon model already). <br>

GET https://restapireworldwide.azurewebsites.net/api/intervention/status will give you a list of all interventions that still need support. <br>

https://restapireworldwide.azurewebsites.net/api/intervention/begin/{id} will start the intervention and set the status and result accordingly <br>

https://restapireworldwide.azurewebsites.net/api/intervention/end/{id} will end the intervention and set the status and result accordingly <br>

If you need any password or account for your correction, feel free to ask which one and I'll send it you. I'll be reachable all weekend. 
