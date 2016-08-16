# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: 'sergio@example.com', password: '12345', firstname: 'Sergio', lastname: 'Oliveira', admin: true)

user2 = User.create(email: 'example@example.com', password: '12345', firstname: 'Leroy', lastname: 'Jenkins')

5.times do
  movie = Movie.new(
    title: Faker::Book.title,
    director: Faker::Book.author,
    runtime_in_minutes: Faker::Number.number(3),
    description: Faker::Hipster.paragraph,
    release_date: Faker::Date.backward(1000000),
    catagories: Faker::Book.genre,
    image: Faker::Avatar.image
  )

  review = Review.create(
  user_id: user2.id,
  movie_id: movie.id,
  text: Faker::Hipster.paragraph,
  rating_out_of_ten: Faker::Number.between(0,10),
  )
end
