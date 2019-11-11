require "pg"
require "faker"



namespace :dwh do

    desc "export to postgresql"
    task db_sync: :environment do

        pg_connection = PG::Connection.open(host: "localhost", port: 5432, dbname: "postgresqlDB", user: "postgres", password: "1234")

    
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

        pg_connection.exec ("TRUNCATE fact_interventions RESTART IDENTITY")
        Battery.all.each do |battery|
        int_status_array = ['Pending', 'In Progress', 'Resumed', 'In Progress']
        if battery.status == "Intervention"
            pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, batteryid, intervention_datetime_start, result, report, status)
            VALUES (#{battery.employee_id}, '#{battery.building_id}', '#{battery.id}', '#{Faker::Time.between(from: 3.days.ago, to: Time.now)}', 'Incomplete', '#{Faker::Types.rb_string}', '#{int_status_array.sample}');")
        end

        if battery.status == "Inactive"
            pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, batteryid, intervention_datetime_start, result, report, status)
            VALUES (#{battery.employee_id}, '#{battery.building_id}', '#{battery.id}', '#{Faker::Time.between(from: 3.days.ago, to: Time.now)}', 'Failed', '#{Faker::Types.rb_string}', 'Interrupted');")
            end
        end

        battery_array = []
        Battery.all.each do |battery|
            battery_array = battery_array.push(battery)
            end
        
        for x in 1..4
            start = Faker::Time.between(from: 2.years.ago, to: 4.days.ago)
            ending = Faker::Time.between(from: start, to: start + 1.month)
            battery = battery_array.sample
            pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, batteryid, intervention_datetime_start, intervention_datetime_end, result, report, status)
            VALUES (#{battery.employee_id}, '#{battery.building_id}', '#{battery.id}', '#{start}', '#{ending}', 'Success', '#{Faker::Types.rb_string}', 'Completed');")         
            end
        

        Column.all.each do |column|
        int_status_array = ['Pending', 'In Progress', 'Resumed', 'In Progress']
        if column.status == "Intervention"
            pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, columnid, intervention_datetime_start, result, report, status)
            VALUES (#{column.battery.employee_id}, '#{column.battery.building_id}', '#{column.id}', '#{Faker::Time.between(from: 3.days.ago, to: Time.now)}', 'Incomplete', '#{Faker::Types.rb_string}', '#{int_status_array.sample}');")
        end
            
        if column.status == "Inactive"
            pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, columnid, intervention_datetime_start, result, report, status)
            VALUES (#{column.battery.employee_id}, '#{column.battery.building_id}', '#{column.id}', '#{Faker::Time.between(from: 3.days.ago, to: Time.now)}', 'Failed', '#{Faker::Types.rb_string}', 'Interrupted');")
            end
        end
            
        column_array = []
        Column.all.each do |column|
            column_array = column_array.push(column)
            end
                    
        for x in 1..12
            start = Faker::Time.between(from: 2.years.ago, to: 4.days.ago)
            ending = Faker::Time.between(from: start, to: start + 1.month)
            column = column_array.sample
            pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, columnid, intervention_datetime_start, intervention_datetime_end, result, report, status)
            VALUES (#{column.battery.employee_id}, '#{column.battery.building_id}', '#{column.id}', '#{start}', '#{ending}', 'Success', '#{Faker::Types.rb_string}', 'Completed');")         
        end

        Elevator.all.each do |elevator|
        int_status_array = ['Pending', 'In Progress', 'Resumed', 'In Progress']
        if elevator.status == "Intervention"
            pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, elevatorid, intervention_datetime_start, result, report, status)
            VALUES (#{elevator.column.battery.employee_id}, '#{elevator.column.battery.building_id}', '#{elevator.id}', '#{Faker::Time.between(from: 3.days.ago, to: Time.now)}', 'Incomplete', '#{Faker::Types.rb_string}', '#{int_status_array.sample}');")
        end

        if elevator.status == "Inactive"
            pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, elevatorid, intervention_datetime_start, result, report, status)
            VALUES (#{elevator.column.battery.employee_id}, '#{elevator.column.battery.building_id}', '#{elevator.id}', '#{Faker::Time.between(from: 3.days.ago, to: Time.now)}', 'Failed', '#{Faker::Types.rb_string}', 'Interrupted');")
            end
        end
                
        elevator_array = []
        Elevator.all.each do |elevator|
            elevator_array = elevator_array.push(elevator)
            end
                        
        for x in 1..32
            start = Faker::Time.between(from: 2.years.ago, to: 4.days.ago)
            ending = Faker::Time.between(from: start, to: start + 1.month)
            elevator = elevator_array.sample
            pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, elevatorid, intervention_datetime_start, intervention_datetime_end, result, report, status)
            VALUES (#{elevator.column.battery.employee_id}, '#{elevator.column.battery.building_id}', '#{elevator.id}', '#{start}', '#{ending}', 'Success', '#{Faker::Types.rb_string}', 'Completed');")         
        end
    end
end