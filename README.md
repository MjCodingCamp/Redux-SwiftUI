# Purpose of project
The main purpose of this project to demonstrate how we can implement Redux architecture in our swiftui project. In this project i used MovieDB(TMDB) API Firebase, URLSession and SwiftUI etc. I am 100% sure this project will help to understand the Redux, because in this project pretty simple to understand. once debug this project in your machine.

# Demo Video
https://user-images.githubusercontent.com/66344914/134793414-a5c5223e-1dc0-429b-ba53-9331134c1fb3.mp4

# About Me
<p>Hey Guys, I am Mohammad Jeeshan Siddiqui. I am a passionate Android/IOS Developer and a huge fan of design patterns, As a contributor to several open-source projects and an active user on Github. more details please follow my website http://mjsiddiqui.me/</p>

# What is redux?
Redux is the implementation of an architectural software pattern that prioritizes unidirectional data flow. Created from the Flux architecture (developed by Facebook). One of the great promises of Redux is to create constraints that encourage a more organized software development and easier to test, so for these reasons, it ends up reducing the complexity in the development phase as well as offering facilities in maintaining the application state and advanced debugging

# Let's Understand Flow of Redux
Redux follows the unidirectional data flow. It means that your application data will follow in one-way binding data flow. See this 
![Flow of Redux](https://user-images.githubusercontent.com/66344914/134793705-cef642cb-6ab1-4f66-ac70-c20714afc1a5.gif)

# Now What is State?
State: The state represents the state of your app. States contain substates like a navigationState (e. g. which view is currently active).
# What is Store?
Store: The store holds the entire App State and receives requests to change the state and calls reducer to perform the change. 
# What is Actions?
Actions: These are simple objects that describe what the system can do. These objects can carry information or not, depending on the case. They are dispatched by the View layer as intentions to change the state of the application.
# What is Reducers?
Reducers: This is where we develop the main logic of the application. Reducers must be pure functions with no side effects and must be synchronous. The reducers take the action and perform the actual state-change.	
