class Event < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3, maximum: 255}
    validates :description, presence: true, length: {minimum: 3, maximum: 4095}
end
