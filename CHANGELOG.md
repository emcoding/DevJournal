
### FIXED
2016-11-20
- Restore tag input fields

## PUSHED 2016-11-12
###Fixed
2016-11-04 (Firmhouse Office Hours)
- Fix jQuery clickable behaviour 
- Closed investigation on searching in tags

### Changed
2016-10-29 (based on usability test Vincent) PR #63
- Restored search in tags - although still under investigation PR #61
- Changed title in pages to Snippety
- Click on card itself to open edit form (instead of title link only)
- Get rid of most text on homepage
- Change css for different styling homepage cards and account cards
- Change order on index based on 'last touched' instead of 'created at'

2016-10-01
- remove redundant token in form 

## Pushed 2016-09-21 https://web.archive.org/web/20161016185305/http://snippety.herokuapp.com/home
### Added
- Add project tags to snippet. see #15
- Added and disables search in tags, besides title and content. Under investigation. 

### Fixed
- Account was not accessible, Devise throwing an error. Fixed in :authenticate_user! 
- Show relevant button : create or save changes in form partial

### Changed
- Update rescue from Cancancan with head :forbidden (since Rails4 instead of render :nothing)

## Pushed 2016-09-17
no problems with heroku!
### Changed 
- Removed cancancan loading and auth from :index, because :index already has a user/guest-check.

### Added
- Add soft_token to Devise's permitted parameters (prep for migration guest snippets)
- **Add logic to preserve guest snippets when they create an account :-)**

## Solved 
- Heroku problem solved with restart (maybe or maybe not after clearing sessions and / or cache

## Pushed 2016-09-16 
>> Heroku not showing site with root_path, not allowing guest to save snippet
### Changed 
- Allow guest to play around with snippet features
- Toggle navbar links for guest or logged in account
- Fix layout on homepage and signup form
- Some text editing and extra cards to reflect the current state of Snippety

## Pushed 2016-09-14 v 25
### CHANGED
- First try on better styling log in form.
- Add css class dialog-card

### FIXED
- added missing method :destroy after introducing CANCANCAN's :load_and_authorize_resource!
- remove leftover route to non-existent devise controller (causing error : too many redirects)

## Pushed 2016-09-14 v23 
>> HEROKU NOT SHOWING SITE chrome says: too many redirects (NB Solved by going into Heroku rails c and add role to my account) )

### CHANGED
- Added Cancancan for authorisation; now people can only see and manage their own snippets 2016-09-14 

### FIXED
- Fix: Search is case insensitive again (after migration from SQLite to PG)
- Fix: plus sign card placement and got better card styling of its own #46 

## Pushed 2016-09-11 v22
### CHANGED
- Restructure css; now homepage and snippets page use same css
- Crispier favicon
- Move 'new snippet plus link' into its own card -> now new form opens in snippets index page YAY
- Improved responsive behaviour of navbar
- Stop weird wordbreak in snippets title  

## Pushed 2016-09-10 
### ADDED
- Favicon
- 404 image (snippet card, LOL)

## Pushed 2016-09-09
###Added 
- Code climate button in Readme
- Heroku has read only files, so changed image storage to AWS S3 

## First deploy 2016-09-06
- Deployed to Heroku! YAY!
- Had to migrate from sqlite to postgresql

### ADDED
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
