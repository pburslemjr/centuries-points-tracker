# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

whitelist_data = [
  'paul-b-tamu@tamu.edu',
  'centurymens.social@gmail.com',
  'ammar918@gmail.com',
  'siddiqi918@tamu.edu',
  'siddiqi91899@gmail.com',
  'deananderson@tamu.edu',
  'andersondeant@gmail.com',
  'mivoli98@tamu.edu',
  'mibeophi2@gmail.com'
]

whitelist_data.each do |email|
  Whitelist.create(email: email) if Whitelist.find_by(email: email).nil?
end

Member.create(name: 'Dean Anderson', isAdmin: true, email: 'andersondeant@gmail.com', 
  uid: 114113468747151673770) if Member.find_by(uid: 114113468747151673770).nil?