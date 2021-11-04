class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :description, presence: true, length: { minimum: 3, maximum: 4095 }
  has_and_belongs_to_many :members

  def format_date
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

  def formatted
    if !datetime.nil?
      self.time.strftime('%H:%M')
    end
  end

  def createDateTime
    if !time.nil? and !date.nil?
      time.change(:usec => 0)
      event_date = date
      event_time = time.change(year: event_date.year, month: event_date.month,
                               day: event_date.day)
      self.datetime = event_time
    end
  end

  def formatName
    name.truncate(30)
  end

  def to_s
    "Name:'#{self.name}' Description:'#{self.description}' Location: '#{self.location}' Datetime '#{self.datetime}' (Date '#{self.date}' Time '#{self.time}')"
  end

end
