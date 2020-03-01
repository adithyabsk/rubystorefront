# README
## Deployed Application
* https://desolate-lowlands-58665.herokuapp.com/
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

## Admin Functionality
- [x] Is the admin able to log in and create/view/update/delete items/users?
  * Log-in: Use above credentials
  * Navigate to modify users for create/view/update/delete
- [x] Are the email and password fields disabled/hidden when she/he tries to edit the admin account?
  * Click on update for admin to see that email and password as hidden
- [x] Is the admin able to view the purchase history (by items and by users)?
  * Go back to items view
  * Click on "Manage Purchases/Requests"
  * You can click on
    * User Name to sort by that
    * Name to sort by product
- [x] Does the admin receive special item requests/return requests and is she/he able to approve/reject them?
  * Sign out and log in as the user you created above
  * Make sure to add four items to your cart (this will help you test all things at the same time)
    * Car
    * Watch
    * Apple
    * Bannana
  * Run through your purchase flow
  * Request for approval is automatically created for the luxury items
  * Make requests for returns of the Car and Watch
  * Log in as admin (using above credentials)
  * Click "Manage Purchases/Requests"
  * Approve / Deny the purchase of the Car / Watch
  * Approve / Deny the requests of the Apple / Bannana
  * Log out of admin and log back in as normal user to verify the above
- [x] Is the admin able to buy items?
  * Log back in as admin user
  * Run through purchase flow
  * Look at admin purchased items in "My Purchases" tab

## User
- [x] Is the user able to log in with his/her email id and password?
  * Use your user/login from above
- [x] Is the user able to edit his own profile?
  * Click Profile > Edit, to verify this as true
- [x] Is the user able to add items to the cart?
  * Add items to cart by clicking on any item
- [x] Is the user able to add items to the wishlist?
  * Test this on the item page as well
- [x] Is the mailer implemented for “subscribe” to unavailable items?
  * Test this on the coffee page
    * Other people might have modified this item so you need to log in to admin
    * Set inventory to zero
    * Log back in as user
  * Subscribe to the item's availability
  * Log in as admin and set the inventory to a number greater than zero
  * Check that your user email receives an email
- [x] Does the application impose age-specific-functionality? (Disallow under 18s to buy age-restricted items, apply discounts for 65+)
  * To test this use the above age specific accounts (for ease)
  * Test young user first, login with young user credentials, click on items, see age restricted items are greyed out and add to cart and buy now features are disabled.
  * Login as old user, add any item to cart and go to cart page, see 10% off displayed and total cost reduced.
- [x]   Is the user able to see a “buy now” button for an item and does it redirect to the payment page?
  * Login as a user or admin and go to the items page by clicking Items in the navigaiton header. Click buy now which brings you directly to the checkout page with the item to pruchase.
- [x] Is the user able to clear the cart?
  * Add any item to cart, Click on cart, click on empty cart, see item get removed from cart.
- [x] Does “check out cart” take you to the payment page for all the items in the cart?
  * Add two items to cart, click on cart, click on proceed to checkout, see payment page with all the items from your cart
- [x] Are emails being sent on completion of a purchase?
  * Logout, Click signup, register with an email address you have access to, Add item to cart, click on proceed to checkout, check your email and enter otp, click on purchase, check email for an email with the subject "Your Recent Purchase"
- [x] Is the user able to request a return for a purchased item?
  * Purchase an item as one of the registered users, Click on My Purchases, under action selector select request_return, under apply action click apply, see status change from Ordered to Return Requested.
- [x] Is the user able to view his purchase history?
  * purchase an item as one of the users, click on My Purchases in the navigation header, see history of purchases. 
- [x] Is the user receiving emails on the approval of a return request?
  * Login with a email that you have access to, purchase an item, go to My Purchases, select return_request and click apply. Then, login with admin and click on Manage Purchases/Requests, Find your user and select the action to approve return. hit apply. Then check your email address for an email with the subject "Return Request approved"
- [x] Does the item status change in purchase history on approval of a return item by admin?
  * Login with a email that you have access to, purchase an item, go to My Purchases, for that item - select return_request and click apply. Verify status says "Return Requested" Then, login with admin and click on Manage Purchases/Requests, Find your user and item and select the action to approve return. hit apply. Log back in with your user, click on My Purchases, find the item you bought and verify status says "Return Approved"
  
## Visitor
- [x] Can a visitor view all existing items?
  * Yep, the items view is home page
- [x] Can the visitor see a “register now” button or “register to buy” button?
  * These "sign up" button is at the top of the page
- [x] Are the features that should be visible only to registered users, hidden for visitors? (For example, visitors should not be able to add to cart/subscribe to an unavailable item)
  * Yes, the visitors don't have access to purchase views on both the index and show item views
- [x] Are the visitors able to give feedback?
  * Click on the Feedback link at the top of the page and fill out the feedback form
  * Log in as admin above and view that the "Anonymous" feedback was submitted

## Item
- [x] Is it possible to sort items based on some sort of popularity metric?
  * The chosen popularity metric is the number of purchases, you can indeed sort by this metric
  * Simply click the link and the items should sort in whatever order is required
- [x] Is it possible to sort items based on popularity/cost?
  * For popularity see above
  * For cost, simply click on the Cost column
- [x] Is it possible to sort items based on brand/category/availability?
  * Please note that the Google Doc requirements stated to allow for filter capabilities and not sort
  * This functionality is implemented using a drop down interface

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
