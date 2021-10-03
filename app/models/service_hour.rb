class ServiceHour < ApplicationRecord

    validates :description, presence: true
    validates :date, presence: true
    validates :hours, presence: true
    validates :servicehoursID, presence: true
    validates :servicehourlistID, presence: true

end
