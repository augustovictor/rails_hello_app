User.create!(
        name: "Example user",
        email: "example@victoraugusto.com",
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