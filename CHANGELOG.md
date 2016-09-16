## CHANGED
- Added Cancancan for authorisation; now people can only see and manage their own snippets 2016-09-14 

## FIXED
- Fix: Search is case insensitive again (after migration from SQLite to PG)
- Fix: plus sign card placement and got better card styling of its own #46 

# Pushed 2016-09-11 v22
## CHANGED
- Restructure css; now homepage and snippets page use same css
- Crispier favicon
- Move 'new snippet plus link' into its own card -> now new form opens in snippets index page YAY
- Improved responsive behaviour of navbar
- Stop weird wordbreak in snippets title  

# Pushed 2016-09-10 
## ADDED
- Favicon
- 404 image (snippet card, LOL)

# Pushed 2016-09-09
##Added 
- Code climate button in Readme
- Heroku has read only files, so changed image storage to AWS S3 

# First deploy 2016-09-06
- Deployed to Heroku! YAY!
- Had to migrate from sqlite to postgresql

## ADDED
- Homepage with sign-up form
- Account links added to navbar
- Add associations between Account and Snippets 
- Devise Account model with authentication: database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
- Syntax highlighting
- Markdown for snippets content 
- JS scripts for anchors in snippet titles
- Basic layout with sass: navbar, bootstrap4 cards
- Tags with acts_as_taggable
- Add Snippets model, controller and views
