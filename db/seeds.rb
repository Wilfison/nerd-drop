# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ name: 'Filme' }, { name: 'Série' }, { name: 'Anime' }, { name: 'Games' }])

categories.each do |category|
  Post.create(
    category: category,
    title: "#{category.name} - Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    link: 'https://google.com',
    cover_link: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/LUN_8401.jpg/1920px-LUN_8401.jpg',
    origin: 'google',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  )
end
