User.destroy_all
u1 = User.create :name => 'Lola', :email => 'lola@gmail.com', :password => 'fish'

puts "#{User.count} users created"
