10.times do |user|
  User.create!  email: "#{user}-user@example.com",
                first_name: "#{user}-first",
                last_name: "#{user}-last",
                password: "secret123",
                password_confirmation: "secret123"
end
100.times do |post|
  Post.create!  date: Date.today,
                rationale: "#{post} rationale content.",
                user_id: 1
end

puts "*".center(50, "*")
puts "10 users created.".center(50)
puts "*".center(50, "*")

puts "*".center(50, "*")
puts "100 posts created.".center(50)
puts "*".center(50, "*")
