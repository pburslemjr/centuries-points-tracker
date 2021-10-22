class Service < ApplicationRecord
    validates :hours, presence: true
    validates :date, presence: true
    validates :description, presence: true, length: {minimum: 3, maximum: 4095}

    def formatDate
        if self.date.nil?
            return '--'
        else
            return self.date.strftime('%m/%d/%Y')
        end
    end

end
