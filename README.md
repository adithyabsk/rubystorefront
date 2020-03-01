# README

## General Information
*Login Info*
* Admin
  * Username: csc517store@gmail.com
  * Password: admin
* Users
  * Please create a user to test email functionality
  * Users for testing age functionality
    * Young User:
      * Username: young@gmail.com
      * Password: young
    * Old User:
      * Username: old@gmail.com
      * Password: old

Extra Credit:

1) No user/visitor should access any private content associated with other user/admin's account.

We accomplished this through restricting the paths that could be called in the our controller classes. For example, in our User controller, we wanted to lock down our api so that a user or visitor couldn't call the index method to view all the users who are signed up. We added a check to make sure that the user is an admin before getting all the users. Likewise, no guests are able to call methods to edit/update users, destroy users, or view users. Logged in users are not able to create or destroy users or view and edit/update users besides besides themself. 

Addionally, no guest is able to access anyone's cart items, ledger(purchases), or wishlist. This was done via code in the respective controllers.
Lastly, logged in users cannot access or edit each other's cart, ledger(purchases), or wishlist.

Testing:

The model and controller we tested on was Category using Rspec  
run using rspec spec/categories_controller_spec.rb or spec/categories_model_spec.rb  
note: rake db:seed RAILS_ENV=test must be run first  

![Sucessful Tests](https://i.imgur.com/kSbIDy2.png)

Edge Case Scenarios:

If an item is disabled from the store, it will be removed from all carts and wishlists. When it is enabled, it will not reappear.This will not remove the item from any past purchase history

We decided that categories could not be deleted. Instead, any categories without items will not show as options to the user.

Users will be garenteed that items price will not change between adding to cart and purchasing. Having an admin change a price will not effect the price when purchasing. Addionally, items that are in the cart cannot be restricted or age restricted once already in the cart.

When a user is deleted, their feedback is still kept in the system.

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
