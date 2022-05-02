AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')

5.times do
  Subject.create!(name: Faker::Esport.game)
end

10.times do
  group = Group.create!(name: Faker::Team.name)
  5.times do
    Student.create!(name: Faker::Name.name, group: group)
  end
end
