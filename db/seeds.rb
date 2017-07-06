User.create!(name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  gender: "Female")
User.create!(name: "SonVH",
  email: "son.vuhuu18@gmail.com",
  password: "sonpro",
  password_confirmation: "sonpro",
  admin: true,
  gender: "Male")

98.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password,
    gender: "Female")
end
