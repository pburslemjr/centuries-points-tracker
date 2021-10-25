class Service < ApplicationRecord
  validates :hours, presence: true
  validates :date, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 4095 }

  def format_date
    if date.nil?
      '--'
    else
      date.strftime('%m/%d/%Y')
    end
  end

  def approved_img_path
    if isApproved?
      'check.png'
    else
      'ex.png'
    end
  end
end
