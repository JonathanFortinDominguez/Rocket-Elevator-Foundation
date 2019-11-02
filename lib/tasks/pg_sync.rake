require "pg"



namespace :dwh do

    desc "export to postgresql"
    task db_sync: :environment do

        pg_connection = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: 5432, dbname: "dbwindor", user: "codeboxx", password: "Codeboxx1!")

    
        pg_connection.exec ("TRUNCATE factquotes RESTART IDENTITY")
        Quote.all.each do |quote|
            pg_connection.exec("INSERT INTO factquotes (quoteid, business_name, email, nbelevator, creation_date) VALUES (#{quote.id}, '#{quote.Business_Name}', '#{quote.Email_Address}', '#{quote.numberElevators}', '#{quote.created_at}')")
        end
    

    
        pg_connection.exec ("TRUNCATE factcontacts RESTART IDENTITY")
        Lead.all.each do |lead|
            pg_connection.exec("INSERT INTO factcontacts (contactid, business_name, email, project_name, creation_date) VALUES (#{lead.id}, '#{lead.businessName}', '#{lead.email}', '#{lead.projectName}', '#{lead.created_at}')")
        end
    

    
        pg_connection.exec ("TRUNCATE factelevators RESTART IDENTITY")
        Elevator.all.each do |elevator|
            pg_connection.exec("INSERT INTO factelevators (elevatorid, serial_number, buildingid, customer, building_city, deploy_date) VALUES (#{elevator.id}, '#{elevator.serial_number}', '#{elevator.column.battery.building.id}', '#{elevator.column.battery.building.customer_id}', '#{elevator.column.battery.building.address.city}', '#{elevator.created_at}')")
        end

    


        pg_connection.exec ("TRUNCATE dimcustomers RESTART IDENTITY")
        Customer.all.each do |customer|
            nbElevator = 0

            customer.buildings.all.each do |building|
               
                building.batteries.all.each do |battery|
                    
                    battery.columns.all.each do |column|
                      
                        nbElevator += column.elevators.count
                           
                    end
                end
            end
            pg_connection.exec("INSERT INTO dimcustomers (business_name, contact_full_name, contact_email, nbelevator, client_city, creation_date) VALUES ('#{customer.business_name}', '#{customer.full_name}', '#{customer.email}', '#{nbElevator}', '#{customer.address.city}', '#{customer.creation_date}')")
        end

    

    end
end
