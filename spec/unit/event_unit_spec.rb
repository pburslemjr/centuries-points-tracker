require 'rails_helper'

RSpec.describe Event, type: :model do
  subject do
    described_class.new(name: 'Anything',
                        description: 'Lorem ipsum',
                        location: 'ZACH 207',
                        date: DateTime.now,
                        time: Time.now)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).not_to be_valid
  end

  it 'is valid without a location' do
    subject.location = nil
    expect(subject).to be_valid
  end

  it 'is valid without a date' do
    subject.date = nil
    expect(subject).to be_valid
  end

  it 'is valid without a time' do
    subject.date = nil
    expect(subject).to be_valid
  end

  it 'has a member' do
    subject.date = nil
    member_a = Member.create!(name: 'Jeff')
    member_b = Member.create!(name: 'Janice')
    subject.members << member_a
    subject.members << member_b

    expect(subject.members.first).to eq member_a
    expect(subject.members.second).to eq member_b
  end
end
