# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.create(loc_name: "SGM")
Location.create(loc_name: "ERD")
Location.create(loc_name: "JDM")
Location.create(loc_name: "TKD")

Family.create(fam_name: "Rami", location_id: Location.find_by(loc_name: "SGM").id)
Family.create(fam_name: "Kuppusamy", location_id: Location.find_by(loc_name: "SGM").id)
Family.create(fam_name: "Senthil", location_id: Location.find_by(loc_name: "SGM").id)

Family.create(fam_name: "Sugumar", location_id: Location.find_by(loc_name: "ERD").id)
Family.create(fam_name: "Kumar", location_id: Location.find_by(loc_name: "ERD").id)

Family.create(fam_name: "Kumaran", location_id: Location.find_by(loc_name: "JDM").id)
Family.create(fam_name: "Settu", location_id: Location.find_by(loc_name: "TKD").id)