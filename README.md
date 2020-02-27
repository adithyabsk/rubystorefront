# README

Login Info:

Admin: carl@gmail.com
Password: 123456

Testing:

The model and controller we tested on was Category using Rspec
run using rspec spec/categories_controller_spec.rb or spec/categories_model_spec.rb
note: rake db:seed RAILS_ENV=test must be run first

Edge Case Scenarios:

If an item is disabled from the store, it will be removed from all carts and wishlists. When it is enabled, it will not reappear.
This will not remove the item from any past purchase history