10.times do |i|
  user = User.find_or_initialize_by(email: "user_#{i}@example.com")
  user.username = "user_#{i}"
  user.password = 'password'
  user.save!
end
