if User.find_by(email: 'admin@cloudwalk.com').nil?
  user = User.create(email: 'admin@cloudwalk.com', password: 'manager')
  puts "Use this token: #{user.authentication_token}"
end
