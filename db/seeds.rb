User.create!(name: "SonVH",
  email: "son.vuhuu18@gmail.com",
  password: "sonpro",
  password_confirmation: "sonpro",
  admin: true,
  gender: "Male",
  activated: true,
  activated_at: Time.zone.now)
User.create!(name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  gender: "Female",
  activated: true,
  activated_at: Time.zone.now)

98.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password,
    gender: "Female",
    activated: true,
    activated_at: Time.zone.now)
end

users = User.order(:created_at).take 6
20.times do
  content = Faker::Lorem.sentence 5
  users.each {|user| user.microposts.create! content: content}
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow followed}
followers.each {|follower| follower.follow user}
