require "faker"

5.times do
User.create(
  name: Faker::Superhero.name,
  email: Faker::Internet.email
)
end
# User.all.destroy_all
