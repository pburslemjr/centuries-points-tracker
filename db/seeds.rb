# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

whitelist_data = [
  'centurymens.social@gmail.com',
  'cew3275@tamu.edu',
  'centurymens.president@gmail.com',
  'carterwiegand0@gmail.com'
]

whitelist_data.each do |email|
  Whitelist.create(email: email) if Whitelist.find_by(email: email).nil?
end

Member.create(name: 'Dean Anderson', isAdmin: true, email: 'andersondeant@gmail.com', 
  uid: 114113468747151673770) if Member.find_by(uid: 114113468747151673770).nil?

Member.create(name: 'Social Officer', isAdmin: true, email: 'centurymens.social@gmail.com', 
  uid: 111544716742928397153) if Member.find_by(uid: 111544716742928397153).nil?

Member.create(name: 'Nguyen Nguyen', isAdmin: true, email: 'mibeophi2@gmail.com', 
  uid: 112406362166503766840) if Member.find_by(uid: 112406362166503766840).nil?


