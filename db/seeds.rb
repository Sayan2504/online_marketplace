# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


User.new({ :name => 'Admin_user', :email => 'admin@gmail.com', :password => 'adminpassword', :password_confirmation => 'adminpassword', :admin => 'true'}).save


