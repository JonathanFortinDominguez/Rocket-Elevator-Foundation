Elevator.all.each do |elevator|
    int_status_array = ['Pending', 'In Progress', 'Resumed', 'In Progress']
    if elevator.status == "Intervention"
        pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, elevatorid, intervention_datetime_start, result, report, status)
        VALUES (#{elevator.column.battery.employee_id}, '#{elevator.battery.column.building_id}', '#{elevator.id}', '#{Faker::Time.between(from: 3.days.ago, to: Time.now)}', 'Incomplete', '#{Faker::Types.rb_string}', '#{int_status_array.sample}');")
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
                
    for x in 1..12
        start = Faker::Time.between(from: 2.years.ago, to: 4.days.ago)
        ending = Faker::Time.between(from: start, to: start + 1.month)
        elevator = elevator_array.sample
        pg_connection.exec ("INSERT INTO fact_interventions (employeeid, buildingid, elevatorid, intervention_datetime_start, intervention_datetime_end, result, report, status)
        VALUES (#{elevator.column.battery.employee_id}, '#{elevator.column.battery.building_id}', '#{elevator.id}', '#{start}', '#{ending}', 'Success', '#{Faker::Types.rb_string}', 'Completed');")         
    end