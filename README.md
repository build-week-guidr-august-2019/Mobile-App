# Mobile-App
![guidrapp logo](https://github.com/build-week-guidr-august-2019/Mobile-App/blob/master/GuidrApp_Logo_Tiny.jpg)

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
	* User can plan trips out in the future.
* Technical Features
	* Be able to Create, View, Update and Delete data for trips taken and planned for the future.
		* Uses this [backend](https://github.com/guidr-bw/guidr-BE)
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
- [iOS App](https://github.com/build-week-guidr-august-2019/Mobile-App)
- [Marketing Page](https://github.com/build-week-guidr-august-2019/Marketing-Page)
- [Frontend](https://github.com/build-week-guidr-august-2019/Front-End)
- [UX](https://www.figma.com/file/nnl2C3EkGxGdUvvMjdv0BT/Guidr-Wireframes?node-id=17089%3A424)

### Team Members
- iOS Unit 1 Dev - [Jessie Griffin](https://www.linkedin.com/in/jessie-ann-griffin/) - [@JessieAGriffin](https://twitter.com/jessieagriffin) - [ThreeDayStory](https://github.com/ThreeDayStory)
- iOS Unit 1 Dev - Ife Banire - [IfeBan](https://github.com/IfeBan)
- iOS Unit 2 Dev - [Stephanie Bowles](https://www.linkedin.com/in/stephanie-bowles-a5376261/) - [sbowl001](https://github.com/sbowl001)
- Web UI Dev - [Aleesha Wood](https://www.linkedin.com/in/aleesha-wood/) - [@aleeshamw](https://twitter.com/aleeshamw) - [SPECTRAT](https://github.com/SPECTRAT)
- Web UI Dev - Craig Paiva - [craiglpaiva](https://github.com/craiglpaiva)
- Frontend Dev - Zach Taylor - [zbtaylor](https://github.com/zbtaylor)
- Frontend Dev - Colby Howell - [colbyhowell](https://github.com/colbyhowell)
- UX Design - Taketa Joi Stewart
- Project Lead - [Michael Redig](https://www.linkedin.com/in/michael-redig/) - [@mredig](https://twitter.com/mredig) - [mredig](https://github.com/mredig)

#### Acknowledgements
* Thanks to [Lambda](https://lambdaschool.com/) for being awesome, organizing this build week, and providing a fantastic education!
* The *iOS Help* channel in Lamba's Slack for those moments when I couldn't quite figure something out without a bit of help
* Thanks to all my team members for being great, sticking in there, and most of all, dealing with my insistence on perfection!
* StackOverflow for obvious reasons
* Trello for chillin in the background while I mostly forgot it existed (ooops!)
