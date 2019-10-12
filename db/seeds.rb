# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EventJoiner.delete_all
Position.delete_all
Report.delete_all
Event.delete_all
Landfill.delete_all
Garbage.delete_all
User.delete_all

User.create!(
  email: 'ngoctam3096@gmail.com',
  provider: 'facebook',
  token: 'this_is_my_t0k3n'
)

garbages = [
  {qrcode: '12125abc', name: 'sample 4', status: 'overflow', level: 'high'},
  {qrcode: '12855abc', name: 'sample 5', status: 'warning', level: 'high'},
  {qrcode: '12ab5abc', name: 'sample 6', status: 'warning', level: 'high'},
  {qrcode: '12315abc', name: 'sample 7', status: 'clean', level: 'low'},
  {qrcode: '123a9abc', name: 'sample 8', status: 'overflow', level: 'low'},
  {qrcode: '983a9abc', name: 'sample 9', status: 'warning', level: 'low'},
  {qrcode: '123a9aDc', name: 'sample 10', status: 'clean', level: 'low'},
]

garbages_position = [
  {latitude: 16.0475075, longitude: 108.2258765, address: 'Green Island Villa, Lo A2.7, Đảo Xanh 4, Hòa Cường, Đà Nẵng, 55000, Việt Nam'},
  {latitude: 16.0480162, longitude: 108.2270324, address: 'Nơm Bistro Danang, the Villas of Green Island, Lot 01-A4 Zone of, Hòa Cường, Hải Châu, Đà Nẵng 550000, Việt Nam'},
  {latitude: 16.0468802, longitude: 108.2274747, address: 'Zoneland Apartments Green Island Villa, Lot 9-A4 Zone of the, Hòa Cường, Hải Châu, Đà Nẵng 550000, Việt Nam'},
  {latitude: 16.0456282, longitude: 108.2262986, address: 'Đảo Xanh Sky Villas, Đảo Xanh 1, Hoà Cường Bắc, Hải Châu, Đà Nẵng 550000, Việt Nam'},
  {latitude: 16.075166, longitude: 108.2212859, address: '9 Quang Trung, Hải Châu 1, Hải Châu, Đà Nẵng 550000, Việt Nam'},
  {latitude: 16.0758277, longitude: 108.2230118, address: 'Indochine Box Juice bar & Cafe, 40 Bạch Đằng, Thạch Thang, Hải Châu, Đà Nẵng 550000, Việt Nam'},
  {latitude: 16.074165, longitude: 108.2219564, address: 'Công Ty Tnhh Mtv Thương Mại Và Du Lịch Trân Châu, 32-34 Đường Trần Phú, Hải Châu 1, Hải Châu, Đà Nẵng 550000, Việt Nam'},
]

garbages.each_with_index do |gb, idx|
  new_gb = Garbage.create!(gb)
  new_gb.create_position!(garbages_position[idx])
end
