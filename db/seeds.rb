100.times do |post|
  Post.create! date: Date.today, rationale: "#{post} rationale content."
end
puts "*".center(50, "*")
puts "100 posts created.".center(50)
puts "*".center(50, "*")
