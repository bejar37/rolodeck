# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# erase db
Contact.delete_all

# populate contacts
10.times do |c|
  contact = Contact.new
  contact.email = Random.email
  contact.first_name = Random.firstname
  contact.last_name = Random.lastname
  contact.phone = Random.phone

  contact.save!
end
