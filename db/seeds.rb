# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#City.destroy_all
#User.destroy_all
#Listing.destroy_all
Reservation.destroy_all

while City.count() < 10 do
    city = City.create(
        name: Faker::Nation.capital_city,
        zip_code: Faker::Address.zip_code
    )
end

while User.count() < 20 do
    user = User.create(
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
        description:Faker::Hipster.sentence, 
    )
end 

while Listing.count() < 15 do
    listing = Listing.create(
        available_beds: rand(1..6),
        price: rand(40..200),
        description:Faker::Hipster.sentence,
        has_wifi: Faker::Boolean.boolean(true_ratio: 0.8),
        welcome_message: "Welcome to your new destination.",
        city: City.all.sample,
        lodger: User.all.sample
    )
end

Listing.all.each do |l|
    5.times do
        date = Faker::Date.backward(days: 365)
        upto = rand(1..15)
        reservation = Reservation.create(
            listing: l,
            guest: User.all.sample,
            start_date: date,
            end_date: date + upto
        )
    end

    5.times do
        date = Faker::Date.forward(days: 365)
        upto = rand(1..15)
        reservation = Reservation.create(
            listing: l,
            guest: User.all.sample,
            start_date: date,
            end_date: date + upto
        )
    end

end
