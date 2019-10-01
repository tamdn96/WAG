# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Garbage.delete_all

garbages = [
  {qrcode: '123abc', name: 'sample garbage 1', status: 'ok', level: 'low'},
  {qrcode: '1234abc', name: 'sample garbage 2', status: 'nok', level: 'mid'},
  {qrcode: '12345abc', name: 'sample garbage 3', status: 'nok', level: 'high'}
]

garbages_position = [
  {lat: 12.12345, long: 12.12345, address: 'DN'},
  {lat: 12.123456, long: 12.123456, address: 'DN'},
  {lat: 12.123457, long: 12.123457, address: 'DN'}
]

garbages.each_with_index do |gb, idx|
  new_gb = Garbage.create!(gb)
  new_gb.create_position!(garbages_position[idx])
end
