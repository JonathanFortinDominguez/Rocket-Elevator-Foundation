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
    )
end



50.times do
    Quote.create!(
        Full_Name: Faker::Name.name,
        Address: Faker::Address.zip_code,
        Business_Name: Faker::Company.suffix,
        Project_Name: Faker::Name.name,
        Email_Address: Faker::Internet.email,
        Phone_Number: Faker::PhoneNumber.phone_number_with_country_code,
        buildingType: Faker::Name.name,
        quality: Faker::Name.name,
        numberElevators: Faker::Number.between(from: 1, to: 100),
        installationPrice: Faker::Number.between(from: 1000, to: 100000),
        totalPrice: Faker::Number.between(from: 1000, to: 100000),
        numberApp: Faker::Number.between(from: 1, to: 100),
        numberBuisiness: Faker::Number.between(from: 1, to: 25),
        numberFloor: Faker::Number.between(from: 1, to: 20),
        numberBasement: Faker::Number.between(from: 1, to: 8),
        numberParking: Faker::Number.between(from: 20, to: 1000),
        numberShaft: Faker::Number.between(from: 1000, to: 100000),
        numberTenant: Faker::Number.between(from: 1, to: 1000),
        maximumPerFloor: Faker::Number.between(from: 100, to: 1100),
        created_at: Faker::Date.in_date_period
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
        follow_up_date: Faker::Date.in_date_period,
        created_at: Faker::Date.in_date_period
    )

end

50.times do 
    Address.create!(
        address_type: Faker::Lorem.sentence,
        status: Faker::Lorem.sentence,
        entity: Faker::Lorem.sentence,
        street_number: Faker::Address.street_address,
        apt_number: Faker::Number.between(from: 1000, to: 100000),
        city: Faker::Address.state,
        zip_code: Faker::Address.zip_code,
        country: Faker::Address.country_name_to_code,
        notes: Faker::Lorem.sentence,
        created_at: Faker::Date.in_date_period

    )

end 

user_array = [*1..50]
address_array = [*1..50]

50.times do
    Customer.create!(
        address_id: Faker::Number.between(from: 1, to: 50),
        user_id: Faker::Number.between(from: 1, to: 50),
        creation_date: Faker::Date.in_date_period,
        business_name: Faker::Company.suffix,
        full_name: Faker::Name.first_name,
        phone_number: Faker::PhoneNumber.phone_number_with_country_code,
        email: Faker::Internet.email,
        business_desc: Faker::Lorem.sentence,
        fullname_service_person: Faker::Name.name,
        phone_service_person: Faker::PhoneNumber.phone_number_with_country_code,
        email_service_person: Faker::Internet.email,
        created_at: Faker::Date.in_date_period,
        updated_at: Faker::Date.in_date_period
    )
end

50.times do 
    Building.create!(
        fullName_building_administrator: Faker::Name.name,
        email_building_administrator: Faker::Internet.email,
        phone_administrator: Faker::PhoneNumber.phone_number_with_country_code,
        fullName_service_contact: Faker::Name.name,
        email_service_contact: Faker::Internet.email,
        phone_service_contact: Faker::PhoneNumber.phone_number_with_country_code,
        created_at: Faker::Date.in_date_period,
        address_id: Faker::Number.between(from: 1, to: 50),
        customer_id: Faker::Number.between(from: 1, to: 50),

    )

end 

type_of_building_array = ["Residential", "Commercial", "Corporative", "Hybrid"]

50.times do 
    Battery.create!(
        type_of_building: type_of_building_array.sample,
        status: Faker::Lorem.words,
        operational_date: Faker::Date.in_date_period,
        last_checkup: Faker::Date.in_date_period,
        certificat: Faker::Lorem.sentence,
        info: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence,
        building_id: Faker::Number.between(from: 1, to: 50),
        employee_id: Faker::Number.between(from: 1, to: 9),
        created_at: Faker::Date.in_date_period

    )
end 

50.times do 
    BuildingDetail.create!(
        information: Faker::Lorem.sentence,
        value: Faker::Lorem.sentence,
        created_at: Faker::Date.in_date_period,
        building_id: Faker::Number.between(from: 1, to: 50),

    )
end 

50.times do 
    Column.create!(
        type_of_building: type_of_building_array.sample,
        number_of_floor: Faker::Number.between(from: 2, to: 50),
        status: Faker::Lorem.sentence,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence,
        created_at: Faker::Date.in_date_period,
        battery_id: Faker::Number.between(from: 1, to: 50)
    )
end


elev_array = [*1..50]

50.times do 
    Elevator.create!(
        serial_number: Faker::Number.hexadecimal,
        model: Faker::Lorem.words,
        type_of_building: type_of_building_array.sample,
        status: Faker::Lorem.words,
        activate_date: Faker::Date.in_date_period,
        last_checkup: Faker::Date.in_date_period,
        inspection_certificat: Faker::Lorem.sentence,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence,
        created_at: Faker::Date.in_date_period,
        column_id: elev_array.delete(elev_array.sample)
    )

end

50.times do 
    Elevator.create!(
        serial_number: Faker::Number.hexadecimal,
        model: Faker::Lorem.words,
        type_of_building: type_of_building_array.sample,
        status: Faker::Lorem.words,
        activate_date: Faker::Date.in_date_period,
        last_checkup: Faker::Date.in_date_period,
        inspection_certificat: Faker::Lorem.sentence,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence,
        created_at: Faker::Date.in_date_period,
        column_id: Faker::Number.between(from: 1, to: 50)
    )

end
