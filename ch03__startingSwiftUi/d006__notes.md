# *Day 6 • Wednesday August 18, 2021*

> Now that you’ve mastered the basics of the Swift language, it’s time to start applying your skills to some real code in our first project.
> 
> This project is a check-sharing app that calculates how to split a check based on the number of people and how much tip you want to leave. The project in itself isn’t complicated, but we’ll be taking it slow so you can see exactly how these fundamentals fit together.
> 
> In some respects going back to the basics like this will feel odd – you’ve learned about closures, optionals, and throwing functions, and now there’s a bit of a reset as we look at the basics of SwiftUI. But take hope: there’s a lot of value in being able to approach new topics with a fresh mind. As Meister Eckhart said, “be willing to be a beginner every single morning” – do that, and you’ll learn much faster.
> 
> Today is the project overview day, which is where we’ll be looking at the isolated pieces of code that you need to understand in order to build our project. Tomorrow we’ll move on to the implementation day, where you’ll put those new techniques into practice with our app.
> 
> Today you have seven topics to work through, and you’ll meet `Form`, `NavigationView`, `@State`, and more.

> Once you’ve made it through those topics, make sure and post your progress somewhere online – it’s such an easy way to keep yourself motivated and accountable!

## :one: [WeSplit: Introduction](https://www.hackingwithswift.com/books/ios-swiftui/wesplit-introduction) 

> In this project we’re going to be building a check-splitting app that you might use after eating at a restaurant – you enter the cost of your food, select how much of a tip you want to leave, and how many people you’re with, and it will tell you how much each person needs to pay.

**Objective** : check-splitting app

>We’re going to look at the techniques required to build our check-sharing app, then use those in a real project.
> 
> So, launch Xcode now, and choose **Create A New Xcode Project**. You’ll be shown a list of options, and I’d like you to choose iOS and **Single View App**, then press Next. On the subsequent screen you need to do the following:

Its now just "App"

> * For Product Name please enter “WeSplit”.

`WeSplit` = Project 1

> * For Organization Identifier you can enter whatever you want, but if you have a website you should enter it with the components reversed: “hackingwithswift.com” would be “com.hackingwithswift”. If you don’t have a domain, make one up – “me.yourlastname.yourfirstname” is perfectly fine.
> * For Language please make sure you have Swift selected.
> * For User Interface please select SwiftUI.
> * Make sure all the checkboxes at the bottom are not checked.

> When you’re ready, click Next, then choose somewhere to save your project and click Create. Xcode will think for a second or two, then create your project and open some code ready for you to edit.
> 
> Later on we’re going to be using this project to build our check-splitting app, but for now we’re going to use it as a sandbox where we can try out some code.
> 
> Let’s get to it!

## :two:  [Understanding the basic structure of a SwiftUI app
](https://www.hackingwithswift.com/books/ios-swiftui/understanding-the-basic-structure-of-a-swiftui-app) 

> When you create a new SwiftUI app, you’ll get a selection of files and maybe 100 lines of code in total. Most of the code doesn’t do anything, and is just there as placeholders to give you something to fill in – you can safely ignore it for now, but as you progress through this course that will change.
> 
> Inside Xcode you should see the following files in the space on the left, which is called the project navigator:
>
>
> * `AppDelegate.swift` contains code for managing your app. It used to be common to add code here, but these days it’s quite rare.

Very rare ~ not reccomended

> * `SceneDelegate.swift` contains code for launching one window in your app. This doesn’t do much on iPhone, but on iPad – where users can have multiple instances of your app open at the same time – this is important.
>
> * `ContentView.swift` contains the initial _user interface (UI)_ for your program, and is where we’ll be doing all the work in this project.

But I'd not put anything that has to do with networking here?

> * `Assets.xcassets` is an asset catalog – a collection of pictures that you want to use in your app. You can also add colors here, along with app icons, iMessage stickers, and more.
>
> * `LaunchScreen.storyboard` is a visual editor for creating a small piece of UI to show when your app is launching.
>
> * `Info.plist` is a collection of special values that describe to the system how your app works – which version it is, which device orientations you support, and more. Things that aren’t code, but are still important.
>
> * Preview Content is a yellow group, with Preview `Assets.xcassets `inside – this is another asset catalog, this time specifically for example images you want to use when you’re designing your user interfaces, to give you an idea of how they might look when the program is running.

>All our work for this project will take place in ContentView.swift, which Xcode will already have opened for you. It has some comments at the top – those things marked with two slashes at the start – and they are ignored by Swift, so you can use them to add explanations about how your code works.

>Below the comments are ten or so lines of code:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

> Before we start writing our own code, it’s worth going over what all that does, because a couple of things will be new.
> 
> First, import SwiftUI tells Swift that we want to use all the functionality given to us by the SwiftUI framework. Apple provides us with many frameworks for things like machine learning, audio playback, image processing, and more, so rather than assume our program wants to use everything ever we instead say which parts we want to use so they can be loaded.
> 
> Second, struct ContentView: View creates a new struct called ContentView, saying that it conforms to the View protocol. View comes from SwiftUI, and is the basic protocol that must be adopted by anything you want to draw on the screen – all text, buttons, images, and more are all views, including your own layouts that combine other views.
> 
> Third, var body: some View defines a new computed property called body, which has an interesting type: some View. This means it will return something that conforms to the View protocol, but that extra some keyword adds an important restriction: it must always be the same kind of view being returned – you can’t sometimes return one type of thing and other times return a different type of thing.
> 
> We’ll look at this feature more shortly, but for now just remember that it means “one specific sort of view must be sent back from this property.”
> 
> The View protocol has only one requirement, which is that you have a computed property called body that returns some View. You can (and will) add more properties and methods to your view structs, but body is the only thing that’s required.
> 
> Fourth, Text("Hello World") creates a text view using the string “Hello World”. Text views are simple pieces of static text that get drawn onto the screen, and will automatically wrap across multiple lines as needed.
> 
> Below the ContentView struct you’ll see a ContentView_Previews struct, which conforms to the PreviewProvider protocol. This piece of code won’t actually form part of your final app that goes to the App Store, but is instead specifically for Xcode to use so it can show a preview of your UI design alongside your code.
> 
> These previews use an Xcode feature called the canvas, which is usually visible directly to the right of your code. You can customize the preview code if you want, and they will only affect the way the canvas shows your layouts – it won’t change the actual app that gets run.
> 
> Xcode can only show the canvas on macOS Catalina or later. If you don’t see the canvas and are already running Catalina, go to the Editor menu and select Canvas.
> 
> If you don’t have Catalina, you’ll need to run your code in the Simulator in order to see how it looks.
> 
> Tip: Very often you’ll find that an error in your code stops Xcode’s canvas from updating – you’ll see something like “Automatic preview updating paused”, and can press Resume to fix it. As you’ll be doing this a lot, let me recommend an important shortcut: Option+Cmd+P does the same as clicking Resume.