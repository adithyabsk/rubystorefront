# README

Login Info:

Admin: csc517store@gmail.com
Password: admin

Extra Credit:

1) No user/visitor should access any private content associated with other user/admin's account.

We accomplished this through restricting the paths that could be called in the our controller classes. For example, in our User controller, we wanted to lock down our api so that a user or visitor couldn't call the index method to view all the users who are signed up. We added a check to make sure that the user is an admin before getting all the users. Likewise, no guests are able to call methods to edit/update users, destroy users, or view users. Logged in users are not able to create or destroy users or view and edit/update users besides besides themself. 

Addionally, no guest is able to access anyone's cart items, ledger(purchases), or wishlist. This was done via code in the respective controllers.
Lastly, logged in users cannot access or edit each other's cart, ledger(purchases), or wishlist.

Testing:

The model and controller we tested on was Category using Rspec  
run using rspec spec/categories_controller_spec.rb or spec/categories_model_spec.rb  
note: rake db:seed RAILS_ENV=test must be run first  

Edge Case Scenarios:

If an item is disabled from the store, it will be removed from all carts and wishlists. When it is enabled, it will not reappear.This will not remove the item from any past purchase history

We decided that categories could not be deleted. Instead, any categories without items will not show as options to the user

Example Screenshots:
(this is not exhaustive, please use the app to test all features :P)
![AppSS](https://i.imgur.com/X1390qW.png)
![AppSS](https://i.imgur.com/pwNG1ID.png)
![AppSS](https://i.imgur.com/1K7LX8v.png)
![AppSS](https://i.imgur.com/6eplx6m.png)
![AppSS](https://i.imgur.com/UuZoQkl.png)
![AppSS](https://i.imgur.com/ayh090y.png)
![AppSS](https://i.imgur.com/7izLnjd.png)
![AppSS](https://i.imgur.com/Vu9wQH9.png)
![AppSS](https://i.imgur.com/CNGvYWs.png)
![AppSS](https://i.imgur.com/8xs0KCB.png)
![AppSS](https://i.imgur.com/oQBRHIR.png)
![AppSS](https://i.imgur.com/LNdp434.png)
![AppSS](https://i.imgur.com/V1Tz4BN.png)
![AppSS](https://i.imgur.com/1iIwxDx.png)
