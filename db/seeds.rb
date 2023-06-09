# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
10.times do |_i|
  User.create(name: Faker::Name.name, email: Faker::Internet.unique.email)
end

10.times do |_i|
  Course.create(
    name:   Faker::Name.name,
    author: User.create(name: Faker::Name.name, email: Faker::Internet.unique.email)
  )
end

2.times do |_i|
  LearningPath.create(name: Faker::ProgrammingLanguage.name)
end
