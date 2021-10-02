class ServiceLogHour < ApplicationRecord
    validates :activity, presence: true
    validates :description_service, presence: true
end
