require 'faker'

10.times do
  user = User.new(username: Faker::HeyArnold.character, password: 'password')
  user.email = Faker::Internet.safe_email(user.username)
  user.save
end
