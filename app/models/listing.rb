class Listing < ApplicationRecord
    belongs_to :city
    has_many :reservations
    belongs_to :lodger, class_name: "User"
end
