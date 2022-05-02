AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')

7.times do
  post = Post.create!(
    name: Faker::Lorem.word,
    text: Faker::Lorem.paragraph
  )
  begin
    file = URI.parse('https://picsum.photos/900').open
    post.image.attach(io: file, filename: post.name, content_type: 'pictures.jpg')
  rescue OpenURI::HTTPError => e
    pp e
  end
end

5.times do
  Subject.create!(name: Faker::Esport.game)
end

10.times do
  group = Group.create!(name: Faker::Team.name)
  5.times do
    Student.create!(name: Faker::Name.name, group: group)
  end
end
