## Day 002 • Week 00 • Thursday January 02, 2025

:pushpin: [**[[hacking-with-swift]]**](https://www.hackingwithswift.com/100/swiftui/22) : *Day 22*

> In this project you’ve learned about images, stacks, gradients, buttons, and more, along with a whole host of new modifiers to help bring your UI designs to life.
> 
> All of these skills will come in useful in your own SwiftUI apps – not maybe or might, but will. As Dr Seuss said, “the more that you read, the more things you will know; the more that you learn, the more places you'll go.” And that’s what this course is about: giving you the ability to go anywhere with SwiftUI, and build whatever apps help you reach your goals.
> 
> Before we move on to the next topic, it’s time to pause and review: did you fully understand everything you learned? That means another test, but it also means three more coding challenges to make sure you’re writing your own code as often as possible.
> 
> Today you should work through the wrap up chapter for project 2, complete its review, then work through all three of its challenges.

## Guess the Flag: Wrap up

https://www.hackingwithswift.com/books/ios-swiftui/guess-the-flag-wrap-up

:question: *Where did I place the project files in my whole study folder stuff?* 
* Found it and corrected the organisation I was leading up with Notes.

> That’s another SwiftUI app completed, including lots of important new techniques. You’ll use VStack, HStack, and ZStack in almost every project you make, and you’ll find you can quickly build complex layouts by combining them together.
> 
> Many people find SwiftUI’s way of showing alerts a little odd at first: creating it, adding a condition, then simply triggering that condition at some point in the future seems like a lot more work than just asking the alert to show itself. But like I said, it’s important that our views always be a reflection of our program state, and that rules out us just showing alerts whenever we want to.

:white_check_mark: *Ok this makes sense cause I've done this many years ago*

### Reviewing quiz

These are extremely simple ones.

:question: *Isn't there a question about how many views can be placed without IDs before the counts go off and odd* 

:white_check_mark: *Awesome, confidence building from a low level*

### Challenge

> One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on:

:warning: *Looks like this isn't really even done, cause it's jsut a view over others.* 
* Could I have worked in the actually answers repository by accident?

Woah, totally not what I thought. I need to look this up. I don't have the json for example or all the flag assets

:arrow_right_hook: *Looking at wrong "Project" number that he put into the answers git repo.*

So idk what the hell happened, but there's no scoring work, so I'm just going to copy the whole project over to my new repo and do the correction there.

> Add an @State property to store the user’s score, modify it when they get an answer right or wrong, then display it in the alert and in the score label.

It says just to modify it so I'm not going to worry about the score always being zero, I'll allow it to go negative.

I'm looking to build with Swift not necessarily make a killer app for production.   

> When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
> 
> Make the game show only 8 questions, at which point they see a final alert judging their score and can restart the game.
> 
> Hacking with Swift+ subscribers can get a complete video solution for this checkpoint here: Solution to Guess the Flag. If you don’t already subscribe, you can start a free trial today.
> 
> Note: That last one takes a little more thinking than the others. A good place to start would be to add a second alert() modifier watching a different Boolean property, then connect its button to a reset() method to set the game back to its initial state.