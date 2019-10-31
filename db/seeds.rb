# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


Employee.create(lastname: 'Genest', name: 'Nicolas', function: 'Comm Rep', email: 'nicolas.genest@codeboxx.biz', encrypted_password: '123456')
Employee.create(lastname: 'Boutin', name: 'David', function: 'Engineer', email: 'david.boutin@codeboxx.biz', encrypted_password: '123456')
Employee.create(lastname: 'Gagnon', name: 'Remi', function: 'Engineer', email: 'remi.gagnon@codeboxx.biz', encrypted_password: '123456')
Employee.create(lastname: 'LeFrançois', name: 'Mathieu', function: 'Engineer', email: 'mathieu.lefrancois@codeboxx.biz', encrypted_password: '123456')
Employee.create(lastname: 'Lortie', name: 'Mathieu', function: 'Engineer', email: 'mathieu.lortie@codeboxx.biz', encrypted_password: '123456')
Employee.create(lastname: 'Houde', name: 'Mathieu', function: 'Engineer', email: 'mathieu.houde@codeboxx.biz', encrypted_password: '123456')
Employee.create(lastname: 'Savoie', name: 'Serge', function: 'Engineer', email: 'serge.savoie@codeboxx.biz', encrypted_password: '123456')
Employee.create(lastname: 'Fortier', name: 'Nadya', function: 'Director', email: 'nadya.fortier@codeboxx.biz', encrypted_password: '123456')
Employee.create(lastname: 'Chantal', name: 'Martin', function: 'Engineer', email: 'martin.chantal@codeboxx.biz', encrypted_password: '123456')

43.times do 
    Employee.create!(

        name: Faker::Name.first_name.delete("\'"),
        lastname: Faker::Name.last_name.delete("\'"),
        function: Faker::Construction.role,     
        email: Faker::Internet.email,
        password: '123456'
        # created_at: Faker::Time.between(4.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all)
    )
end


User.create(email: 'nicolas.genest@codeboxx.biz', password: "test123", employee_id: 1, admin: true)
User.create(email: 'david.boutin@codeboxx.biz', password: "test123", employee_id: 2, admin: true)
User.create(email: 'remi.gagnon@codeboxx.biz', password: "test123", employee_id: 3, admin: true)
User.create(email: 'mathieu.lefrancois@codeboxx.biz', password: "test123", employee_id: 4, admin: true)
User.create(email: 'mathieu.lortie@codeboxx.biz', password: "test123", employee_id: 5, admin: true)
User.create(email: 'mathieu.houde@codeboxx.biz', password: "test123", employee_id: 6, admin: true)
User.create(email: 'serge.savoie@codeboxx.biz', password: "test123", employee_id: 7, admin: true)
User.create(email: 'nadya.fortier@codeboxx.biz', password: "test123", employee_id: 8, admin: true)
User.create(email: 'martin.chantal@codeboxx.biz', password: "test123", employee_id: 9, admin: true)
User.create(email: 'test@test.com', password: "test123", admin: true)

40.times do 
    User.create!(
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 8)
        # created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all)
    )
end

status_array = ["Active", "Active", "Active", "Active", "Active", "Active", "Active", "Active", "Inactive"]
type_of_building_array = ["Residential", "Commercial", "Corporative", "Hybrid"]
type_of_service_array = ["Standard", "Premium", "Excelium"]


#NO ELEVATOR PRICE
75.times do
    Quote.create!(
        Full_Name: Faker::Name.name,
        Address: Faker::Address.zip_code,
        Business_Name: Faker::Company.suffix,
        Project_Name: Faker::Name.name,
        Email_Address: Faker::Internet.email,
        Phone_Number: Faker::PhoneNumber.phone_number_with_country_code,
        buildingType: type_of_building_array.sample,
        quality: type_of_service_array.sample,
        numberElevators: Faker::Number.between(from: 1, to: 100),
        installationPrice: Faker::Commerce.price(),
        totalPrice: Faker::Commerce.price(),
        numberApp: Faker::Number.between(from: 1, to: 100),
        numberBuisiness: Faker::Number.between(from: 1, to: 25),
        numberFloor: Faker::Number.between(from: 1, to: 20),
        numberBasement: Faker::Number.between(from: 1, to: 8),
        numberParking: Faker::Number.between(from: 20, to: 1000),
        numberShaft: Faker::Number.between(from: 1000, to: 100000),
        numberTenant: Faker::Number.between(from: 1, to: 1000),
        maximumPerFloor: Faker::Number.between(from: 100, to: 1100)
        # created_at: Faker::Time.between(6.months.ago, 2.weeks.ago, :all),
        # updated_at: Faker::Time.between(2.weeks.ago, Time.now, :all)
    )
end

50.times do 
    Lead.create!(
        fullname: Faker::Name.name,
        businessName: Faker::Company.suffix,
        email: Faker::Internet.email,
        phoneNumber: Faker::PhoneNumber.phone_number_with_country_code,
        projectName: Faker::Company.suffix,
        projectDescription: Faker::Address.zip_code,
        departement: Faker::Address.city,
        message: Faker::Lorem.sentence,
        follow_up_date: Faker::Date.in_date_period
        # created_at: Faker::Time.between(5.months.ago, Time.now, :all),
        # updated_at: Faker::Time.between(2.weeks.ago, Time.now, :all)
    )

end

Address.create(address_type: Faker::Name.name.delete("\'"), status: "Active", entity: "Billing Address", street_number: "684 rue des eaux fraiches", apt_number: Faker::Address.secondary_address.delete("\'"), city: "Quebec", zip_code: "G3G2C1", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: "Active", entity: "Billing Address", street_number: "725 boulevard lebourgneuf", apt_number: "G2J1S1", city: "Quebec", zip_code: "", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: "Active", entity: "Billing Address", street_number: "758 rue francois-arteau", apt_number: Faker::Address.secondary_address.delete("\'"), city: "Quebec", zip_code: "G1V3G7", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: "Active", entity: "Billing Address", street_number: "374 1re ave portneuf", apt_number: "", city: "Quebec", zip_code: "G0A2Y0", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: "Active", entity: "Billing Address", street_number: "161 Saint-Catherine St W E", apt_number: "", city: "Montreal", zip_code: "H2X1K8", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: "Active", entity: "Billing Address", street_number: "980 Boulevard de Maisonneuve O", apt_number: "", city: "Montreal", zip_code: "H3A1N4", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: "Active", entity: "Billing Address", street_number: "5677 Park Ave H2V 4H2", apt_number: Faker::Address.secondary_address.delete("\'"), city: "Montreal", zip_code: "H2V4H2", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: "Active", entity: "Billing Address", street_number: "2055 Robertson Rd", apt_number: "", city: "Ottawa", zip_code: " K2H5Y9", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: "Active", entity: "Billing Address", street_number: "500 Brisebois Cres", apt_number: Faker::Address.secondary_address.delete("\'"), city: "Ottawa", zip_code: "K1E0A6", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: "Active", entity: "Billing Address", street_number: "37 Chemin Rockhurst", apt_number: "", city: "Ottawa", zip_code: "J0X3G0", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "290 Bremner Blvd", apt_number: "", city: "Toronto", zip_code: "M5V3L9", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "1442 Lawrence Ave W", apt_number: "", city: "Toronto", zip_code: "M6L1B5", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "110 Canongate Trail", apt_number: "", city: "Toronto", zip_code: "M1V2Z5", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "159 Rue Dumas", apt_number: "", city: "Gatineau", zip_code: "J8Y2N8", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "39 Rue De Megantic", apt_number: "", city: "Gatineau", zip_code: "J8R1V9", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "4055 boul du Chanoine-Moreau", apt_number: "", city: "Trois-Rivière", zip_code: "G8Y1R6", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "572 Av Royale", apt_number: "", city: "Quebec", zip_code: "G1E1Y1", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "846 Ch Ste Foy", apt_number: "", city: "Quebec", zip_code: "G1S2J7", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "17 Stuyvesant Walk", apt_number: "", city: "New York", zip_code: "10009", country: "United-States", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "29 Bradhurst Ave", apt_number: "", city: "New York", zip_code: "10030", country: "United-States", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "39 Harrison St", apt_number: "", city: "New York", zip_code: "10013", country: "United-States", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "220 Rue De Sherbrooke", apt_number: "", city: "Coaticook", zip_code: "J1A2M9", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "571 Prescott Rd", apt_number: "", city: "Manchester", zip_code: "04351", country: "United-States", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "9 Kennison St", apt_number: "", city: "Manchester", zip_code: "04351", country: "United-States", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "85 Belgrade Rd", apt_number: "", city: "Manchester", zip_code: "04351", country: "United-States", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "6139 Tweed St NE", apt_number: "", city: "Calgary", zip_code: "T2K3W9 ", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "70 Cedardale Cres SW", apt_number: "", city: "Calgary", zip_code: "T2W3Z5", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "2867 18th Ave E", apt_number: "", city: "Vancouver", zip_code: "V5M2R1", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "62 Desjardins Dr", apt_number: "", city: "Winnipeg", zip_code: "R3X1M7", country: "Canada", notes: Faker::Types.rb_string)
Address.create(address_type: Faker::Name.name.delete("\'"), status: status_array.sample, entity: "Operational Building", street_number: "19 Kowall Bay", apt_number: "", city: "Winnipeg", zip_code: "R2P1A7", country: "Canada", notes: Faker::Types.rb_string)


address_id_array = [*1..10]
user_id_array = [*11..20]


10.times do
    Customer.create!(
        address_id: address_id_array.delete(address_id_array.sample),
        user_id: user_id_array.delete(user_id_array.sample),
        creation_date: Faker::Date.in_date_period,
        business_name: Faker::Company.name.delete("\'"),
        full_name: Faker::Name.first_name,
        phone_number: Faker::PhoneNumber.phone_number_with_country_code,
        email: Faker::Internet.email,
        business_desc: Faker::Company.type,
        fullname_service_person:Faker::Company.name.delete("\'"),
        phone_service_person: Faker::PhoneNumber.phone_number_with_country_code,
        email_service_person: Faker::Internet.email
        # created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all)
    )
end

address_id_array = [*11..30]
customer_id_array = [*1..10]

10.times do 
    Building.create!(
        fullName_building_administrator: Faker::Name.first_name.delete("\'"),
        email_building_administrator: Faker::Internet.email,
        phone_administrator: Faker::PhoneNumber.phone_number_with_country_code,
        fullName_service_contact: Faker::Name.name.delete("\'"),
        email_service_contact: Faker::Internet.email,
        phone_service_contact: Faker::PhoneNumber.phone_number_with_country_code,
        # created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all),
        address_id: address_id_array.delete(address_id_array.sample),
        customer_id: customer_id_array.delete(customer_id_array.sample)

    )

end 

customer_id_array = [*1..10]

10.times do 
    Building.create!(
        fullName_building_administrator: Faker::Name.first_name.delete("\'"),
        email_building_administrator: Faker::Internet.email,
        phone_administrator: Faker::PhoneNumber.phone_number_with_country_code,
        fullName_service_contact: Faker::Name.name.delete("\'"),
        email_service_contact: Faker::Internet.email,
        phone_service_contact: Faker::PhoneNumber.phone_number_with_country_code,
        # created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all),
        address_id: address_id_array.delete(address_id_array.sample),
        customer_id: customer_id_array.sample
    )

end 

building_id_array = [*1..20]

20.times do 
    BuildingDetail.create!(
        information: Faker::Types.rb_string,
        value: Faker::Types.rb_string,
        # created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all),
        building_id: building_id_array.delete(building_id_array.sample)
    )
end 

building_id_array = [*1..20]
employee_id_array = [*10..52]

20.times do 
    Battery.create!(
        type_of_building: type_of_building_array.sample,
        status: status_array.sample,
        # operational_date: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # last_checkup: Faker::Time.between(1.year.ago, 1.week.ago, :all),
        certificat: Faker::Code.isbn,
        info: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        building_id: building_id_array.delete(building_id_array.sample),
        employee_id: employee_id_array.delete(employee_id_array.sample)
        # created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all)
    )
end 

battery_id_array =[*1..20]

20.times do 
    Column.create!(
        type_of_building: type_of_building_array.sample,
        number_of_floor: Faker::Number.between(from: 2, to: 15),
        status: status_array.sample,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        # created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all),
        battery_id: battery_id_array.delete(battery_id_array.sample)
    )
end

battery_id_array =[*1..20]

60.times do 
    Column.create!(
        type_of_building: type_of_building_array.sample,
        number_of_floor: Faker::Number.between(from: 2, to: 15),
        status: status_array.sample,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        # created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all),
        battery_id: battery_id_array.sample
    )
end

column_id_array =[*1..80]

80.times do 
    Elevator.create!(
        serial_number: Faker::Code.isbn,
        model: type_of_service_array.sample,
        type_of_building: type_of_building_array.sample,
        status: status_array.sample,
        # activate_date: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # last_checkup: Faker::Time.between(1.year.ago, 1.week.ago, :all),
        inspection_certificat: Faker::Code.isbn,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        # created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all),
        column_id: column_id_array.delete(column_id_array.sample)
    )
end

column_id_array =[*1..80]

240.times do 
    Elevator.create!(
        serial_number: Faker::Code.isbn,
        model: type_of_service_array.sample,
        type_of_building: type_of_building_array.sample,
        status: status_array.sample,
        # activate_date: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # last_checkup: Faker::Time.between(1.year.ago, 1.week.ago, :all),
        inspection_certificat: Faker::Code.isbn,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        # created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        # updated_at: Faker::Time.between(6.months.ago, Time.now, :all),
        column_id: column_id_array.sample
    )
end
