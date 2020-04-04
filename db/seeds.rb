User.destroy_all
u1 = User.create :name => 'Josh', :email => 'josh@gmail.com', :password => 'fish'
u2 = User.create :name => 'Frank', :email => 'frank@gmail.com', :password => 'fish', :admin => true
u3 = User.create :name => 'Azi', :email => 'azi@gmail.com', :password => 'fish'
u4 = User.create :name => 'Mitch', :email => 'mitch@gmail.com', :password => 'fish'
puts "#{User.count} users created"

Company.destroy_all
c1 = Company.create :name => 'Apple', :description => 'Tech unicorn', :image => 'https://www.brandchannel.com/wp-content/uploads/2018/02/apple-rainbow-logo-original.jpg'
c2 = Company.create :name => 'Hinge', :description => 'Dating app', :image => 'https://globaldatinginsights.com/wp-content/uploads/2016/10/Screen-Shot-2016-10-11-at-15.44.59.png'
c3 = Company.create :name => 'Uber Eats', :description => 'Food Delivery', :image => 'https://storage.googleapis.com/ubereats/UE-FB-Post.png'
puts "#{Company.count} companies created"

Ad.destroy_all
a1 = Ad.create :name => 'AirPods Pro - Snap', :image => 'Apple_AirPods_Pro_Snap.png', :ad_type => 'TV'
a2 = Ad.create :name => 'AirPods - Bounce', :image => 'Apple_AirPods_Bounce.png', :ad_type => 'TV'
a3 = Ad.create :name => 'IPhone 11 Pro - Its Tough Out There', :image => 'Apple_ItsToughOutThere_IPhone11Pro.png', :ad_type => 'TV'

a4 = Ad.create :name => 'Kim and Sharon', :image => 'https://i.dailymail.co.uk/1s/2019/11/24/13/21402890-0-image-a-26_1574601178356.jpg', :ad_type => 'Instagram'
a5 = Ad.create :name => 'Barnsey and Farnsey', :image => 'https://res.cloudinary.com/themusicau/image/upload/c_fill,f_auto,h_459,w_768/standard/news_19/barnesy_farnsy_anhsy_h_1019', :ad_type => 'TV'
puts "#{Ad.count} ads created"

Gallery.destroy_all
g1 = Gallery.create :name => 'Apple 2019 Ads', :category => 'Tech Consumer'
g2 = Gallery.create :name => 'UberEats 2019 Ads', :category => 'Delivery'
puts "#{Gallery.count} galleries created"

History.destroy_all
h1 = History.create :has_been_seen => true
h2 = History.create :has_been_seen => false
puts "#{History.count} histories created"

u2.ads << a1 << a2 << a3

u1.histories << h1
a1.histories << h1

c1.users << u1 << u2 << u3
c2.users << u4

c1.ads << a2 << a3 << a4 << a5

g1.ads << a1 << a2 << a3 << a5

u2.galleries << g1