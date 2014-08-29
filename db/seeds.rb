# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
hoa = User.create(username: 'hoanewton', first_name: 'Hoa', last_name: 'Newton', email: 'caohoa86hp@gmail.com', address: 'Bronx NY', phone_number: '6465103675', role: 'Parent', password: '12345678', password_confirmation: '12345678')
eli = Baby.create(first_name: 'Eli', last_name: 'Newton', gender: 'Girl', age: 1, parent_name: 'Hoa', parent_email: 'caohoa86hp@gmail.com', nanny_name: 'Anne Marie', nanny_email: 'a.m@gmail.com', special_condition: 'none') 