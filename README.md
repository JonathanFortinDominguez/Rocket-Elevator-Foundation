# README

Week 5

(English version below)

Voici la continuité du projet web de Rocket Elevators de l'équipe Alfred, formée du chef d'équipe Christopher Hardoin , et de Jonathan Fortin-Dominguez, Marc-olivier Loupret et Cédrick Gagnon.

Site web : http://www.rocketelevatorquebec.site/   
Email usager admin : nicolas.genest@codeboxx.biz  MDP : test123

Cette semaine, nous vous présentons la section administrative du site, appelée Back End, donnant suite à l'acceptation du dévoilement du site web, développée via l'application Ruby On Rails. Tout comme les pages web, la mise en page aérée de cette section vous présente les bases de données aux couleurs de Rocket Elevators via une interface informative pour les administrateurs, qui leur permettra de gérer les données entrantes, la création de nouvelles données, la mise à jour de données existantes, tout en gardant un oeil sur l'inventaire et les performances. La base de données relationnelle présente l'information de Rocket Elevators organisée dans des tableaux à deux dimensions, vous présentant: 1. Combien de demandes de contacts sont effectuées par mois ? 2. Combien de demandes de soumissions sont effectuées par mois ? 3. Combien avons-nous d'ascenseurs par clients ?

La navigation de la section administrative vous présente les listes, tableaux ou rapports imprimés des sections des adresses, bâtiments détaillés, clients, employés, requêtes et usagers, en plus de détenir via une base de données externes, les informations des batteries, colonnes et ascenseurs actives et à venir.

Ayez en quelques cliques accès à votre clientèles, leur courriel ou numéro de téléphone et permettez à vos employés de récupérer les données selon leurs accès de gérance.

Profitez de la facilité d'accès à l'information de vos clients selon les dossiers reliées d'adresse, de bâtiments et autres propriétés à même leur dossier personnel, diminuant le temps de recherche et augmentant la qualité du service.

Voici un résumé des fonctions techniques

Mysql database = bundle exec rake db:reset (Dans le but de monter la base de données en SQL)

PostgreSQL database = bundle exec rake dwh:db:drop dwh:db:create dwh:db:migrate (Dans le but de monter la base de données en PostgreSQL)

bundle exec rails c (Dans le but d'accéder à la ligne de commande Rails)

load 'pg_sync' (Dans le but de loader le fichier PgSync)

n = PgSync.new (Dans le but de débuter la méthode PgSync)

n.sync_quotes (Dans le but d'appeler la commande pour synchroniser les requêtes)

n.sync_elevator (Dans le but d'appeler la commande pour synchroniser les ascenceurs)

n.sync_contact (Dans le but d'appeler la commande pour synchroniser les contacts)

n.sync_dim_customers (Dans le but d'appeler la commande pour synchroniser les clients)

Autres détails techniques et liste des gem à la fin du document.



Here is the continuation of the Rocket Elevators web project of TheRockets team, with the team leader Christopher Hardoin, and Jonathan Fortin-Dominguez, Marc-Olivier Loupre and Cédrick Gagnon. 

Website : http://rocketelevatorsltd.com/ 
Email user admin : nicolas.genest@codeboxx.biz PW: test123 

This week, we present the administrative section of the site, (Back End), developed via the Ruby On Rails application. Just like web pages, this section presents databases through an informational interface for administrators, which will allow them to manage incoming data, create new data, set up existing data, inventory, and team performance.

The relational database presents information from Rocket Elevators organized in two-dimensional tables, presenting you, at your request: 1. How many contact requests are made per month? 2. How many bid solicitations are made per month? 3. How many elevators per customer do we have?

The navigation of the administrative section presents the lists, tables or printed reports of the address sections, detailed buildings, customers, employees, requests and users, in addition to holding via an external database, the information of the active and future batteries, columns and elevators.

In just a few clicks, have access to your clientele, their email or phone number, and allow your employees to recover data according to their management access.

Take advantage of the easy access of your clients' information, and related records (address, building and other related entity) from their personal file, reducing search time and increasing the quality of service.

Here is a resume of the basic functions

Mysql database = bundle exec rake db:reset (executing the database in SQL)

PostgreSQL database = bundle exec rake dwh:db:drop dwh:db:create dwh:db:migrate (executing the database in PostgreSQL)

bundle exec rails c (executing Rails)

load 'pg_sync' (loading PgSync)

n = PgSync.new (starting PgSync method)

n.sync_quotes (synchronizing quotes)

n.sync_elevator (synchronizing elevators)

n.sync_contact (synchronizing contacts)

n.sync_dim_customers (synchronizing customers)

Gem Files source 'https://rubygems.org' git_source(:github) { |repo| "https://github.com/#{repo}.git" } ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails' gem 'rails', '~> 5.2.3'

# Use mysql as the database for Active Record gem 'mysql2', '>= 0.4.4', '< 0.6.0'

# Use Puma as the app server gem 'puma', '~> 3.11'

# Use SCSS for stylesheets gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes # gem 'mini_racer', platforms: :ruby #A gem to automate using jQuery with Rails gem 'jquery-rails'

#Best way to use latest jQuery in Ruby app gem 'jquery-cdn', '~> 3.3', '>= 3.3.1'

#A Ruby Gem that embeds the code necessary to easily use Twitter's Bootstrap Tooltip library within your application gem 'bootstrap-tooltip-rails'

#bootstrap-sass is a Sass-powered version of Bootstrap 3, ready to drop right into your Sass powered applications. gem 'bootstrap-sass'

# Bootstrap-social for Rails asset pipeline gem 'bootstrap-social-rails'

# A Sass-powered version of FontAwesome for your Ruby projects and plays nicely with Ruby on Rails, Compass, Sprockets, etc. gem "font-awesome-rails"

# Font-Awesome Sass gem for use in Ruby/Rails projects  gem 'font-awesome-sass'

#gem 'jquery-ui-rails' # You can keep keys out of the code base with environment variables or with Rails secrets. gem "recaptcha"

# Use CoffeeScript for .coffee assets and views gem 'coffee-rails', '~> 4.2'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production # gem 'redis', '~> 4.0' # Use ActiveModel has_secure_password # A sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords. gem 'bcrypt'

# Use ActiveStorage variant # gem 'mini_magick', '~> 4.8' # Use Capistrano for deployment # gem 'capistrano-rails', group: :development # Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc. gem 'faker'

# Reduces boot times through caching; required in config/boot.rb gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do   # Call 'byebug' anywhere in the code to stop execution and get a debugger console   gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] End

group :development do   # Access an interactive console on exception pages or by calling 'console' anywhere in the code.   gem 'web-console', '>= 3.3.0'   gem 'listen', '>= 3.0.5', '< 3.2'   # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring   gem 'spring'   gem 'spring-watcher-listen', '> 2.0.0'   gem 'capistrano', '> 3.10', require: false   gem 'capistrano-rails', '~> 1.4', require: false   gem 'capistrano-bundler', '>= 1.1.0'   gem 'rvm1-capistrano3', require: false   gem 'capistrano3-puma' End

group :test do   # Adds support for Capybara system testing and selenium driver   gem 'capybara', '>= 2.15'   gem 'selenium-webdriver'   # Easy installation and use of chromedriver to run system tests with Chrome   gem 'chromedriver-helper' End

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# rails admin gem 'rails_admin', '~> 2.0'

#rollin code gem 'rails_admin_rollincode', '~> 1.0'

# devise gem 'devise'

# cancan gem 'cancan'

# postgresql gem 'pg', '~> 0.18.4'

# active storage gem 'activestorage-database-service', github: 'TitovDigital/activestorage-database-service'

# whenever gem 'whenever', '~> 0.9.4',:require => false

# rails admin charts gem 'rails_admin_charts'

Week 4 (English version below)

Voici le projet web de l'équipe TheRockets, formée du chef d'équipe Jonathan Fortin-Dominguez, et de Steve Drolet-Toutant, Misa Rakotoniaina et Jean-François Maheux.

Site web : http://www.rocketelevatorquebec.site/

Site Admin : http://www.rocketelevatorquebec.site/admin Email : nicolas.genest@codeboxx.biz Mdp : 123456

Le site présenté a été développé via l'application Ruby On Rails. Une mise en page aérée et au couleur de Rocket Elevators présente une interface informative aux visiteurs, leur offrant la possibilité de de créer un compte et permettre aux dirigeants de Rocket Elevator de distribuer de l'information à la clientèle et ainsi augmenter la publicité directe.

Une section administrative (Back Office), gérée et accessible par les employés, permet de voir en un clin d'œil les commandes entrantes, la gestion de dossier et les droits d'usagers. Ce site optimisé et sécuritaire est l'outil parfait pour faire face à la concurrence et augmenter le rendement de l'entreprise.

Visitez la section Quotes et ayez accès aux commandes en un coup d'œil, aux formulaires remplis sur le site et aux contrats à venir.

La section Users vous permet de voir votre clientèle, de gérer leurs accès et leur courriel.

La section des Employees vous donne accès aux User Id, Nom, prénom, Titre, email et mot de passe, en plus de permettre la gestion de dossier et des clients.

Le Backoffice du site est sécurisé derrière une page d’authentification qui se valide à l’aide de la table Employees.

Détails techniques à la fin du document.

Here is the website project from TheRockets team, formed by team leader Jonathan Fortin-Dominguez, and teamate Steve Drolet-Toutant, Misa Rakotoniaina and Jean-François Maheux.

Website : http://www.rocketelevatorquebec.site/

Admin User : http://www.rocketelevatorquebec.site/admin Email : nicolas.genest@codeboxx.biz PW : 123456

The site presented has been developed via the Ruby On Rails application. Rocket Elevators presents an informative interface for visitors, which allows to create an account easily mangeable by Rocket Elevators leaders.

An administrative section (Back Office), managed and accessible by the employees, takes it possible to see the incoming orders, the edition of files and the rights of users. This site is optimized and secure.

Visit the Quotes section and have access to orders at a glance, web forms and future contracts.

The Users section allows you to see your customers, manage their access and email.

The Employee section gives you access to User IDs, Last Name, First Name, Title, Email and Password, as well as file and client management.

Backoffice of the Site is secure behind an authentication page that is valid using the Employees table.

Technical details:

ruby '2.6.3'

Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'

Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'

Use Puma as the app server
gem 'puma', '~> 3.11'

Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby
gem 'jquery-rails'

gem 'jquery-cdn', '~> 3.3', '>= 3.3.1'

gem 'bootstrap-tooltip-rails' gem 'bootstrap-sass' gem 'bootstrap-social-rails'

gem "font-awesome-rails" gem 'font-awesome-sass' #gem 'jquery-ui-rails'

Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
Use ActiveModel has_secure_password
gem 'bcrypt'

Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'
Use Capistrano for deployment
gem 'capistrano-rails', group: :development
gem 'faker'

Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do

Call 'byebug' anywhere in the code to stop execution and get a debugger console
gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] end

group :development do

Access an interactive console on exception pages or by calling 'console' anywhere in the code.
gem 'web-console', '>= 3.3.0' gem 'listen', '>= 3.0.5', '< 3.2'

Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring' gem 'spring-watcher-listen', '~> 2.0.0' end

group :test do

Adds support for Capybara system testing and selenium driver
gem 'capybara', '>= 2.15' gem 'selenium-webdriver'

Easy installation and use of chromedriver to run system tests with Chrome
gem 'chromedriver-helper' end

Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

rails admin
gem 'rails_admin', '~> 2.0'

#rollin code gem 'rails_admin_rollincode', '~> 1.0'

devise
gem 'devise'

gem 'cancan'


* To Log In with test user : email => nicolas.genest@codeboxx.biz (or all of the employee at codeboxx email) password => test123
* Every employee password => test123, use test user to access backoffice and see all the tables
* To migrate mysql info to postgresql database use => bundle exec rake dwh:pg_sync
* To seed, migrate, create or drop use => bundle exec rake dwh:db:seed,.. 

* To test zenddesk api use this link : https://rocketapi.zendesk.com
* To test dropbox api use given credentials
