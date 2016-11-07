# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'm3taljose@gmail.com', password: 'josemiguel', permission_level: 3 )
User.create(email: 'bjohnmer@gmail.com', password: 'qwertyuio', permission_level: 3 )
