# README

Login Info:

Admin: csc517store@gmail.com
Password: admin

Extra Credit:

1) No user/visitor should access any private content associated with other user/admin's account.

Did this through restricting the paths that could be called in the User controller class to only be able to be called by admins who are logged in. No guests or other users are able to call these to create users, edit users, destroy users, view users besides being able to edit and view themselves. 
Addionally, no guest is able to access anyone's cart cart items, ledger(purchases), or wishlist via code to protect the controllers.
Lastly, users cannot access or edit eachther's cart, cart items, ledger(purchases), or wishlist.

Testing:

The model and controller we tested on was Category using Rspec
run using rspec spec/categories_controller_spec.rb or spec/categories_model_spec.rb
note: rake db:seed RAILS_ENV=test must be run first

Edge Case Scenarios:

If an item is disabled from the store, it will be removed from all carts and wishlists. When it is enabled, it will not reappear.
This will not remove the item from any past purchase history