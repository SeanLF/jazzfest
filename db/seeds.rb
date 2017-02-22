# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.find_or_create_by(
  name: 'Ottawa Jazz Festival',
  start_date: Date.parse('2017/06/20'),
  end_date: Date.parse('2017/07/02'),
  registration_start_date: Date.parse('2017/03/01'),
  registration_end_date: Date.parse('2017/06/20'),
  active: true
)
