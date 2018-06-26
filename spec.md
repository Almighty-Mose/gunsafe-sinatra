# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app (Built with Corneal)
- [x] Use ActiveRecord for storing information in a database (Each class inherits from ActiveRecord::Base)
- [x] Include more than one model class (Users & Firearms)
- [x] Include at least one has_many relationship on your User model (User has_many Firearms)
- [x] Include at least one belongs_to relationship on another model (Firearm belongs_to a User)
- [x] Include user accounts (Login, Signup, Logout)
- [x] Ensure that users can't modify content created by other users (A user is only ever able to view their own firearms)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (Firearms have all 7 RESTful routes)
- [x] Include user input validations (User must sign up with username, email, and password)
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirms
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message