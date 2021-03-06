# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |topic|
	Topic.create!(
		title: "Topic #{topic+1}"
	)
end

puts "3 topics created"


10.times do |n|
	Blog.create!(
		title: "My blog post #{n+1}",
		body: "Blog body #{n+1} Lorem ipsum dolor sit amet, consectetur adipiscing 
		elit, sed do eiusmod tempor incididunt ut labore et 
			dolore magna aliqua. Ut enim ad minim veniam, 
			quis nostrud exercitation ullamco laboris nisi 
			ut aliquip ex ea commodo consequat. Duis aute 
			irure dolor.",
		topic_id: Topic.last.id 
	)
end

puts "10 Blog created"


5.times do |x|
	Skill.create!(
		title: "Rails #{x+1}",
		percent_utilized: 5*(x+1)
	)
end

puts "5 Skills created"

8.times do |x|
	Portfolio.create!(
		title: "Portfolio title #{x+1}",
		subtitle: "Ruby On Rails",
		body: "Portfolio body #{x+1} Duis aute 
			irure dolor in reprehenderit in voluptate velit 
			esse cillum dolore eu fugiat nulla pariatur. 
			Excepteur sint occaecat cupidatat",
		main_image: "http://via.placeholder.com/600x400",
		thumb_image: "http://via.placeholder.com/350x200"
	)
end

1.times do |x|
	Portfolio.create!(
		title: "Portfolio title #{x+1}",
		subtitle: "Angular",
		body: "Portfolio body #{x+1} Duis aute 
			irure dolor in reprehenderit in voluptate velit 
			esse cillum dolore eu fugiat nulla pariatur. 
			Excepteur sint occaecat cupidatat",
		main_image: "http://via.placeholder.com/600x400",
		thumb_image: "http://via.placeholder.com/350x200"
	)
end

puts "9 Portfolio items created"

3.times do |technology|
	Portfolio.last.technologies.create!(
		name: "Technology #{technology}"
	)
end

puts "3 technologies created"


u = User.create!(email: "test@sample.com", name: "Pankaj Kumar Singh", password: "password", password_confirmation: "password", role: "site_admin") rescue nil

if u
	puts "1 admin created"
else
	puts "Admin not created"
end


3.times do |x|
	User.create!(
		email: "test#{x+1}@sample.com",
		name: "sample-user-#{x+1}",
		password: "password",
		password_confirmation: "password",
		role: "user"
	)
end

puts "3 users created with role \"user\""