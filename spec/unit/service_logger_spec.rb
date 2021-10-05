require 'rails_helper'

RSpec.describe ServiceHour, :type => :model do

  subject {
    described_class.new(description: "Anything",
                        hours: 44,
                        date: DateTime.now
                        )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a description" do 
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without hours" do 
    subject.hours = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a date" do 
    subject.date = nil
    expect(subject).to_not be_valid
  end


end