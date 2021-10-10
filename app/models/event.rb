class Event < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3, maximum: 255}
    validates :description, presence: true, length: {minimum: 3, maximum: 4095}

    def formatDate
        if self.datetime.nil?
            return '--'
        else
            return self.datetime.strftime('%m/%d/%Y')
        end
    end

    def formatTime
        if self.datetime.nil?
            return '--'
        else
            return self.datetime.strftime("%I:%M %p")
        end
    end

    def createDateTime
        if !self.time.nil? and !self.date.nil?
            event_date = self.date
            event_time = self.time.change(:year => event_date.year, :month => event_date.month, :day => event_date.day)
            self.datetime = event_time
        end
    end

end
