# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

other_whitelist_data = [
  'centurymens.social@gmail.com',
  'cew3275@tamu.edu',
  'centurymens.president@gmail.com',
  'carterwiegand0@gmail.com',
  'paul-b-tamu@tamu.edu',
  'centurymens.vp@gmail.com',
  'centurymens.service@gmail.com'
  
]

whitelist_data = [
 'tuckh2019@tamu.edu',
'Jroo@tamu.edu',
'will_gibbens@tamu.edu',
'loganswingle@tamu.edu',
'Ethanirsik@tamu.edu',
'Lukegools@tamu.edu',
'Daniel.kirby@tamu.edu',
'hkayman@tamu.edu',
'Hunterh22@tamu.edu',
'hojunchae@tamu.edu',
'Bdyokley@tamu.edu',
'Ckwon219@tamu.edu',
'kutayebik@tamu.edu',
'hults@tamu.edu',
'jacksongarrison@tamu.edu',
'alex.wachowicz1@tamu.edu',
'jacksontodd3@tamu.edu',
'Jarrettpoehl@tamu.edu',
'binhdocao@tamu.edu',
'Sam.allen78@tamu.edu',
'Grayson.mcguire@tamu.edu',
'Ajchristian15@tamu.edu',
'Cew3275@tamu.edu',
'j.bauer2018@tamu.edu',
'dillardpace@tamu.edu',
'Maisonw1@tamu.edu',
'Knorbs10@tamu.edu',
'andremach1@tamu.edu',
'coltonh2@tamu.edu',
'crh2001@tamu.edu',
'bradymarek@tamu.edu',
'Paul-b-tamu@tamu.edu',
'jsd6427@tamu.edu',
'andrew.pickard@tamu.edu',
'lanerobey@tamu.edu',
'Kylebeck10@tamu.edu',
'brettbtaylor44@tamu.edu',
'Barrett3001@tamu.edu',
'shaffer.russell@tamu.edu',
'calvinwhitaker@tamu.edu',
'Bmguynes@tamu.edu',
'edreecemangal@tamu.edu',
'Davidbobo@tamu.edu',
'dylan5023@tamu.edu',
'Raahinmomin@tamu.edu',
'gallums@tamu.edu',
'jcollins2000@tamu.edu',
'claytonduggan.cd@tamu.edu',
'vmnguyen1@tamu.edu',
'centurymens.social@gmail.com',
'cew3275@tamu.edu',
'centurymens.president@gmail.com',
'carterwiegand0@gmail.com',
'paul-b-tamu@tamu.edu',
'centurymens.vp@gmail.com',
'pebjr99@gmail.com',
'centurymens.service@gmail.com'
]


whitelist_data.each do |email| 
  Whitelist.create(email: email) if Whitelist.where("lower(email) = ?", email.downcase).blank?
end

Member.create(name: 'President', isAdmin: true, email: 'centurymens.president@gmail.com', 
  uid: 115144328160283227634) if Member.find_by(uid: 115144328160283227634).nil?

Member.create(name: 'Social Officer', isAdmin: true, email: 'centurymens.social@gmail.com', 
  uid: 111544716742928397153) if Member.find_by(uid: 111544716742928397153).nil?

Member.create(name: 'Vice President', isAdmin: true, email: 'centurymens.vp@gmail.com', 
  uid: 104840622757784868286) if Member.find_by(uid: 104840622757784868286).nil?

Member.create(name: 'Service Officer', isAdmin: true, email: 'centurymens.service@gmail.com', 
  uid: 115921819643726050456) if Member.find_by(uid: 115921819643726050456).nil?

Member.create(name: 'Developer', isAdmin: true, email: 'pebjr99@gmail.com', 
  uid: 106635036644446547959) if Member.find_by(uid: 106635036644446547959).nil?



