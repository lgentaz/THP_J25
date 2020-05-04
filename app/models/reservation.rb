class Reservation < ApplicationRecord
    belongs_to :listing
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :start_must_be_before_end_time
#    validate :overlapping_reservation, class_name: "Listing"
    belongs_to :guest, class_name: "User"
  

    def start_must_be_before_end_time
        return unless start_date and end_date
        errors.add(:start_date, "must be before end date") unless start_date < end_date
    end

    def duration
        return (end_date - start_date).to_i/(60*60*24)
    end

    def full_price
        return duration * Listing.last.price
    end

end
