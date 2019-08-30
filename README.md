# Mobile-App
![guidrapp logo](https://github.com/usemytechstuff/Use-My-Tech-Stuff-iOS/blob/master/assets/rentechLogo4.png)

### What is Guidr?
Instagram, but made specifically for logging and tracking your outdoor and mountainous excursions!

* Pitch:
	* Guidr helps back country guides of all types log their private and professional trips.
	* Build your Outdoor Resume! 
  * Create, read, and update your trips with a trip type, location, duration and whether it's private or professional.
  * Upload photos of your trips! (Future feature)

### Table of contents
* [Features](#features)
* [Sample Video](#Sample-Video)
* [Install Instructions](#install-instructions)
* [Other Components of This Project](#other-components-of-this-project)
* [Team Members](#team-members)
* [Acknowledgements](#acknowledgements)

### Features
* Marketing
	* Users can log in and create a profile. 
	* Add private trips for their personal records with photos, dates and descriptions. 
	* Add professional trips to be added to the user's resume for disbursement.
	* Users can edit or delete a trip.
	* Works on various versions of iPhone
* Technical Features
	* Be able to Create, Read, Update and Delete rental data.
		* Uses this [backend](https://github.com/usemytechstuff/Use-My-Tech-Stuff-BE)
		* Creates items, create user account, and login with POST
		* Reads items with GET
			* options are *all items* and *single item*
		* Updates items with PUT
		* Deletes items with DELETE
	* Backend didn't have search support, so that is handled locally
	* Top Rated and Recommended additionally aren't algorithmic magic, but instead just randomization
	* Favorites are also stored locally. While they *are* saved per user id (if you have multiple users on a device, each will have their own favorites), they will *not* sync to other devices you log in on.
		* Your listings and rentals *do* sync through the cloud though!
	* (Mostly) conformed to swiftlint style guides
	* Used the following libraries:
		* [tbaranes/SwiftyUtils](https://github.com/tbaranes/SwiftyUtils)
			* I have previously contributed to this project as well!
		* [hackiftekhar/IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager)
		* [auth0/JWTDecode.swift](https://github.com/auth0/JWTDecode.swift)
		* [morizotter/TouchVisualizer](https://github.com/morizotter/TouchVisualizer)
			* only used for demoing the video embedded here


#### Sample Video
[![video link](https://img.youtube.com/vi/jTYAqBvjlv0/hqdefault.jpg)](https://youtu.be/jTYAqBvjlv0)

#### Install Instructions
1. Clone this repository
1. `carthage boostrap --platform ios --cache-builds`
1. Open in Xcode and run

### Other Components of This Project
* [Landing Page A](https://github.com/usemytechstuff/Landing-Page-Bryant)
* [Landing Page B](https://github.com/usemytechstuff/Landing-Page-Philip)
* [Landing Page C](https://github.com/usemytechstuff/Landing-Page-Oluwatimileyin)
* [Web Front End A](https://github.com/usemytechstuff/Use-My-Tech-Stuff-FE-Bazen)
* [Web Front End B](https://github.com/usemytechstuff/Use-My-Tech-Stuff-FE-Sarah)
* [Web Back End](https://github.com/usemytechstuff/Use-My-Tech-Stuff-BE)
* [UX Design](https://projects.invisionapp.com/share/54S302QUYQJ)

#### Team Members
* UX: Chariton Shumway - [@ShumwayChariton](https://twitter.com/ShumwayChariton)
* iOS Dev: [Michael Redig (me)](https://github.com/mredig) - [@mredig](https://twitter.com/mredig)
* Backend: Benson Lei
* Web UI: [Oluwatimileyin Ojo](https://github.com/openwell) - [@timileyinojo](https://twitter.com/timileyinojo)
* Web UI: Bryant Patton
* Web UI: [Philip Johnson](https://github.com/phil7j) - [@philjj](https://twitter.com/philjj)
* Front End: Sarah Lee - [@sarahguamie](https://twitter.com/sarahguamie)
* Front End: Bazen Berhane
* Team Leader: [Scott Vojik](https://github.com/sk-vojik) [@scottvojik](https://twitter.com/scottvojik)

#### Acknowledgements
* Thanks to [Lambda](https://lambdaschool.com/) for being awesome, organizing this build week, and providing a fantastic education!
* The *iOS Help* channel in Lamba's Slack for those moments when I couldn't quite figure something out without a bit of help
* Thanks to all my team members for being great, sticking in there, and most of all, dealing with my insistence on perfection!
* StackOverflow for obvious reasons
* Trello for chillin in the background while I mostly forgot it existed (ooops!)
