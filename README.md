# README

Week 7

Team Leader : Christopher Hardoin
Team members : Jonathan Fortin-Dominguez, Marc-Olivier Loupret et Cédrick Gagnon.

Website : http://www.rocketelevatorsltd.com   
Admin User for testing : nicolas.genest@codeboxx.biz  
Password: test123

-Seed, migrate, create or drop with => bundle exec rake db:drop db:create db:migrate db:seed

-Migrate mysql info to postgresql database with => bundle exec rake dwh:pg_sync

-Seed, migrate, create or drop with => bundle exec rake dwh:db:drop dwh:db:create dwh:db:migrate dwh:db:seed

-To test zenddesk api use this link => https://rocketapi.zendesk.com

-To test dropbox api => use given credentials


This week, we worked with 9 APIs.

1. Slack

Employees on slack will now be notified when an elevator changes status through the operations_elevator channel. 

2. Google Maps and 3. OpenWeather

A map accessible from the front end and from the back end will show the Admin users a list of their customer's building. Info such as the owner, the number of elevators, columns and batteries will be shown. The temperature will also be accessible through the openweather API.

4. Twilio 

If an elevator's status changes to Intervention, the technical contact for the building will be notified via SMS. 

5. Dropbox 

When a lead has an attachment and that lead becomes a Customer, the attached file will be deleted from the lead and sent to dropbox in which a folder will also be created with the business name of the customer. The attachment will also keep it's original file name, and will be completely deleted from active storage.

6. Sendgrid

When a lead is sent to the database, the email linked to the lead will receive an email thanking them for their interest in the company.

Sendgrid is also used when the user forgot his password and wants to reset it.

7. IBM Watson and 8. Swapi

IBM Watson will greet admin users, telling them how many elevators are deployed, in how many building and belonging to how many customers. 

It will also tell them how many elevators are not running, how many quotes are awaiting, how many leads the database has and how many batteries are deployed accross how many cities.

The Swapi API will be paired with Watson to tell the users Star Wars facts about planets, characters and spaceships. That one was added as a bonus, because whoever dislikes Star Wars isn't worthy of the website anyway.

9. Zendesk 

Tickets are sent to zendesk then quotes and leads are made. Those same tickets can be answered via the zendesk app.


