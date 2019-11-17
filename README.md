# README

Week 9

Website : Rocketelevatorworldwide.com <br>
API REST : https://restapireworldwide.azurewebsites.net/ <br>
Zendesk : https://rocketelevatorsquebec.zendesk.com <br>

To create and seed database you can use bundle exec rake db:reset (about 10 interventions were created manually, <br>
so if you drop the database they won't be there anymore).

For the data warehouse you can run bundle exec dwh:db:drop, dwh:db:create, dwh:db:migrate and dwh:pg_sync <br>

You can log in with your email from codeboxx and the password is test123

When you're logged in, you'll see the intervention form on the left dashboard menu, or you can click on home and you'll see it in the <br>
header menu. You can create an intervention from there and a ticket will be created on zendesk and an intervention will be added <br>
to the database. When you don't select an employee, an error pops up, which can be easily corrected by either setting it to null:true <br>
in the migration or creating a selectable prompt (since it's optional in the interventon model already).

GET https://restapireworldwide.azurewebsites.net/api/intervention/status will give you a list of all interventions that still need support.

https://restapireworldwide.azurewebsites.net/api/intervention/begin/{id} will start the intervention and set the status and result accordingly

https://restapireworldwide.azurewebsites.net/api/intervention/end/{id} will end the intervention and set the status and result accordingly

If you need any password or account for your correction, feel free to ask which one and I'll send it you. I'll be reachable all weekend.
