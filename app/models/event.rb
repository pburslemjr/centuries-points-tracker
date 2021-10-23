class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :description, presence: true, length: { minimum: 3, maximum: 4095 }
  has_one :attendence_list
  

  def formatDate
    if datetime.nil?
      '--'
    else
      datetime.strftime('%m/%d/%Y')
    end
  end

  def formatTime
    if datetime.nil?
      '--'
    else
      datetime.strftime('%I:%M %p')
    end
  end

  def createDateTime
    if !time.nil? and !date.nil?
      event_date = date
      event_time = time.change(year: event_date.year, month: event_date.month,
                               day: event_date.day)
      self.datetime = event_time
    end
  end

  def formatLocation
    location == '' ? '--' : location.truncate(15)
  end

  def formatName
    name.truncate(30)
  end

end
