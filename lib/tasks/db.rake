require 'faker'
require 'bcrypt'


namespace :db do
  desc "TODO"
  task repopulate: [:drop, :create, :migrate, :seed, :fakeit] do
    puts "Done"
  end

  desc "make 1000 dummy"
  task fakeit: :environment do
    1000.times do
      User.create!(
        email: Faker::Internet.email,
        encrypted_password: BCrypt::Password.create(Faker::Internet.password)
      )

  end
end
end


