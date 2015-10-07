# rails-library-app

### Deployment

Deployed the application on Heroku

https://rails-library-app.herokuapp.com/  

This is the default home page of our application


### Preconfigured admin details:

        Email    : admin@ncsu.edu
        Password : 12345678

### Features currently supported

####Admins

**1) Login with an email and password**

       On home page, Click "Log in as Admin" to login to library system as admin.

In order to perform the following tasks (2, 3, 4 , 5) , the admin needs to be **logged in**

**2) Edit his/her profile details**

       Click on "My Account" --> "Edit Profile" to edit profile details.

**3) Manage admins**

  a) Create new admins

        From the home page, Click on "Add another admin" link. Enter details and Click "Register"
      
  b) View list of admins and their profile details (Except password)

       From the home page, Click on "View all admins" link.

  c) Delete admins (except her/him-self and the preconfigured admin)

       From the home page, Click on "View all admins" link. Then Click on "Delete Admin" link

**4) Manage books**

   a) Add a book to the system

       From the home page, Click on "Add book" link. Then enter details and Click "Add Book" button.

   b) Checkout/return a book on behalf of a library member

       Search for a book. From the search results, click on "ISBN" hyperlink. Now enter the emaild of the library member in the box, and Click on "Checkout Book"

   c) View the list of all books.

       From the home page, Click on "View all books"

   d) View the details of a book. If it is checked out, view the member who has checked it out.

       Search for a book. From the search results, click on "ISBN" hyperlink in order to get the details of the book. If the book is checked out, the email id of the library member will be shown next to the Status

   e) View the checkout history of a book

       Follow step (d), and then Click on "See Checkout history" to view the checkout history of the book.

   f) Edit the details of a book

       Follow step (d), and then Click on "Edit" link to edit the details

       or 

       Search for any book, and click on "Edit" link next to it.

   g) Delete a book from the system 

       Follow step (d), and then Click on "Delete" link to edit the details

       or 

       Search for any book, and click on "Delete" link next to it.


**5) Manage Library Members**

   a) View list of library members and their profile(except password)

       From home page, Click on "View all users" link.

   b) View checkout history of a library member

       From home page, Click on "View all users" link , and then click on "View Checkout history" of the user.

   c) Delete a library member

       From home page, Click on "View all users" link , and then click on "Delete User" of the user.


####Library Members

**6) Sign up to become a library member**

    From home page, Click on "Sign up" link. Enter your details and Click "Register" button

**7) Login with email and password**

    From the home page, Click on "Log in as Member". Enter details and Click "Log In"

In order to perform the tasks 8, 11, 12, 13, 14 and 15 below , the user needs to be **logged in**

**8) Edit his/her profile**

    Click on "My Account"-->"Edit Profile". Edit the details and Click on "Update"

**9) Search books using ISBN, title, authors, description, status**

    From the home page, enter ISBN or title or author or description or status to search for any book.

**10) View details of a book**

    Search for a book. From the search results, click on "ISBN" hyperlink in order to get the details of the book. 

**11) Checkout a book if its status is 'Available'**

    Search for a book. From the search results, click on "Checkout" hyperlink of the desired book

    or

    Search for a book. From the search results, click on "ISBN" hyperlink and Click on "Checkout"

**12) Return a checked out book**

    Search for a book. From the search results, click on "ISBN" hyperlink and Click on "Return Book"

    or

    Click on "My Account"-->"See Checkout history"-->"Return Book"

**13) View own checkout history**

    Click on "My Account"-->"See Checkout history"



### Extra credit Features Implemented 

#### Book Recommendation

**14) User can recommend books to library**

    Click on "My Account"-->"Recommend a Book". Enter details and Click on "Submit Recommendation".

**15) User can view his/her recommendations and their corresponding status**

    Click on "My Account"-->"See My Recommendations"

In order to perform the tasks 16 and 17 below , the Admin needs to be **logged in**

**16) Admin can accept or decline the recommended book** 

    From home page, Click on "View all book recommendations". Click on "Accept" to accept and "Decline" to decline the recommendation.

**17) Admin can edit book details during the approval process**

    From home page, Click on "View all book recommendations"-->"Accept". Edit the details and Click "Add Book"
    (The approved book is now available for library members)

#### Email Notification

**18) User can register to receive a notification email**

     Search for a checked out book and Click on "Get Email Notification" link from the search results.

     or

     Search for a checked out book. From the search result, Click on "ISBN" hyperlink --> "Get Email Notification" to receive a notification email when the book becomes available

  **Note** : The book must be checked out by other user, in order to subscribe for email


### Testing

Tested admin model and admins controller


### Use cases for different scenarios

a) When a user is deleted, the checkout history of the user is also deleted

b) When a book is deleted, the checkout history of the book is also deleted

c) When an admin tries to delete a checked out book, it is not permitted by the system

d) When an admin tries to delete a user who is currently holding any book, it is not permitted by the system



