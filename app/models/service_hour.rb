class ServiceHour < ApplicationRecord

    validates :description, presence: true
    validates :date, presence: true
    validates :hours, presence: true

end
