Documentation for using the website
  1. Getting the project ready
    Clone the project, run "rails db:create", then "rails db:migrate" and wait for the migrations to complete.
  
  2. Starting the website
    For starting the website, first navigate to the project folder, start the rails server using "rails s" command and then type "localhost:3000" in the browser url. This is the website homepage.
  
  3. Creating admin credentials to start
    For creating admin credentials, create user/users with valid data in db/seeds.rb with admin field value "true". Now run "rails db:seed".
  
  4. Login to Admin panel
    For visiting Admin panel, click the "Log in" option in the navigation bar and login with the admin credentials provided in db/seeds.rb.

  5. Creating advertisements categories
    In the admin panel, for creating categories, click the categories option in the navigation bar and click "Add New" button. Now fill the form with valid and unique category name.

  6. Editing or Deleting categories
    In the categories index page, click the "Edit Category" button or "Delete Category" button, besides every category name to edit or delete that particular category name. A category can be deleted as long as no posts have been created under that particular category.

  7. Creating account
    For creating a users account, click the "Sign up" option in the navigation bar in the website homepage. Fill the form with valid data and get redirected to the user's homepage.

  8. Login to user's homepage
    For logging in, click the "Log in" option in the navigation bar in the website homepage and use the credentials used for creating the account. Logging in via Google or Facebook can also be done.
 
  9. Edit user's credentials
    For editing user credentials, click the dropdown "Options" in the user's homepage and click "Edit Credentials"

  10. Create posts/advertisements for selling things
    For creating advertisements, click the "Create Post" option in the navigation bar in the user's homepage. Fill the form with valid inputs, choose a category from the dropdown and upload image/images for your post. Creating post without any image can also be done.  

  11. Approve/Reject Advertisements
    Posts created by any user will not be visible to anyone unless admin approves it. For approving, click "Unchecked Posts" in the Admin panel and click "Approve". Posts can also be rejected by clicking "Reject".
    Admin can also click the name of the posts to see the detailed view and approve/reject from there. Posts once approved cannot be rejected.

  12. View Advertisements
    Advertisements can be seen with/without loging in. If not logged in, click "Advertisements" from the website homepage and view advertisements in the form of thumbnails. If logged in, click the dropdown "Advertisements" and choose the respective options to see the advertisements filtered on different basis.

  13. Give Reviews and Ratings to any advertisement
    For giving reviews and ratings, click the name of the advertisement and get the detailed view. Then click the button "Write review" and fill the form to give the review.

  14. Approve reviews
    Reviews will not be visible to everyone unless admin approves it. To approve click "Approved Posts" in the admin panel. Then click the advertisement name to get the detailed view and in the review section there, click the "Approve" button.

  15. Buy products
    Buying request have to be send to the author of the post. To do so, click the "Buy Product" button in the detailed post view and fill the form. Buying request can be given with/without loging in but the credentials must be of a registered user.

  16. Sell products
    View buying request/requests in own posts by clicking "Buyers list" button in those posts' detailed view. Click "Sell Product" button besides every buyers name and details to sell the product to that particular buyer.

  17. Internal Communication
    Send messages and chat in real time with registered users who reviewed one's posts. Click "Sned Message" beside every registered user's review to send message to that particular reviewer. To check for incoming messages click the notification bell icon in users account and click "Unread messages" and then click "Reply" beside every unread received message to reply to that particular message. If "Unread messages" is clicked from users homepage section then all messages received can be seen, but if "Unread messages" is clicked from posts' detailed view section, post specific messages will be seen.

  18. Filter Advertisement search
    In the advertisement section, filter advertisements based on name, category(provided as a dropdown), or location. Filter based on any two or all three of these can also be done.

  19. Email notifications
    On signing up, post approval or rejection, review approval, putting buying request and product sold or bought, email notifications will be obtained in the provided email account.
