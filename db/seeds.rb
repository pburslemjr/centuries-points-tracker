# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

whitelist_data = [
  [ "paul-b-tamu@tamu.edu", false ],
  [ "centurymens.social@gmail.com", true ],
  [ "ammar918@gmail.com", true ],
  [ "siddiqi918@tamu.edu", false ],
  [ "deananderson@tamu.edu", false ],
  [ "andersondeant@gmail.com", true ],
  [ "mivoli98@tamu.edu", false ],
  [ "mibeophi2@gmail.com", true ]
  
]

whitelist_data.each do |email, isAdmin|
  Whitelist.create( email: email, isAdmin: isAdmin )
end

