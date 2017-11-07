1.times do |user|
  User.create!  email: "jsnow@example.com",
                first_name: "Jon",
                last_name: "Snow",
                password: "secret123",
                password_confirmation: "secret123"
end
100.times do |post|
  Post.create!  date: Date.today,
                rationale: "#{post} rationale content.",
                user_id: 1
end

puts "*".center(50, "*")
puts "1 user created.".center(50)
puts "*".center(50, "*")

puts "*".center(50, "*")
puts "100 posts created.".center(50)
puts "*".center(50, "*")
