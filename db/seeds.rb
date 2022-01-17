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
  'carterwiegand0@gmail.com',
  'paul-b-tamu@tamu.edu',
  'centurymens.vp@gmail.com',
  'centurymens.service@gmail.com'
  
]

whitelist_data.each do |email|
  Whitelist.create(email: email) if Whitelist.find_by(email: email).nil?
end

Member.create(name: 'President', isAdmin: true, email: 'centurymens.president@gmail.com', 
  uid: 115144328160283227634) if Member.find_by(uid: 115144328160283227634).nil?

Member.create(name: 'Social Officer', isAdmin: true, email: 'centurymens.social@gmail.com', 
  uid: 111544716742928397153) if Member.find_by(uid: 111544716742928397153).nil?

Member.create(name: 'Vice President', isAdmin: true, email: 'centurymens.vp@gmail.com', 
  uid: 104840622757784868286) if Member.find_by(uid: 104840622757784868286).nil?

Member.create(name: 'Service Officer', isAdmin: true, email: 'centurymens.service@gmail.com', 
  uid: 115921819643726050456) if Member.find_by(uid: 115921819643726050456).nil?



