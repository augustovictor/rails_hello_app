User.create!(
        name: "Victor Augusto",
        email: "victoraweb@gmail.com",
        password: '12345mudar',
        password_confirmation: '12345mudar',
        admin: true
)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@victoraugusto.com"
  password = "12345mudar"
  User.create!(
          name: name,
          email: email,
          password: password,
          password_confirmation: password
  )
end

users = User.order(:created_at).take(6)
50.times do
	content = Faker::Lorem.sentence(5)
	users.each { |user| user.microposts.create!(content: content) }
end
