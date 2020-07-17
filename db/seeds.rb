User.new( { name: "admin", email: "admin@gmail.com", password: "adminpassword", password_confirmation: "adminpassword", admin: true } ).save
User.new( { name: "admin two", email: "admin2@gmail.com", password: "adminpassword", password_confirmation: "adminpassword", admin: true } ).save
User.new( { name: "user one", email: "user1@gmail.com", password: "12345678", password_confirmation: "12345678" } ).save
User.new( { name: "user two", email: "user2@gmail.com", password: "12345678", password_confirmation: "12345678" } ).save

Category.new( { name: "Books" } ).save
Category.new( { name: "Bikes" } ).save
Category.new( { name: "Furniture" } ).save
Category.new( { name: "Sports" } ).save
Category.new( { name: "Cars" } ).save
Category.new( { name: "Mobiles" } ).save
Category.new( { name: "Electronics" } ).save
Category.new( { name: "Real Estate" } ).save
Category.new( { name: "Services" } ).save