class User < ApplicationRecord
    validates :email,
    uniqueness: true,
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

    validates :phone_number,
    format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "please enter a valid french number" }

    has_many :lodger_listings, foreign_key: 'lodger_id', class_name: "Listing"
    has_many :guest_reservations, foreign_key: 'guest_id', class_name: "Reservation"  

end
