# *Day 16 • Wednesday August 18, 2021*

> Now that you’ve mastered the basics of the Swift language, it’s time to start applying your skills to some real code in our first project.
> 
> This project is a check-sharing app that calculates how to split a check based on the number of people and how much tip you want to leave. The project in itself isn’t complicated, but we’ll be taking it slow so you can see exactly how these fundamentals fit together.
> 
> In some respects going back to the basics like this will feel odd – you’ve learned about closures, optionals, and throwing functions, and now there’s a bit of a reset as we look at the basics of SwiftUI. But take hope: there’s a lot of value in being able to approach new topics with a fresh mind. As Meister Eckhart said, “be willing to be a beginner every single morning” – do that, and you’ll learn much faster.
> 
> Today is the project overview day, which is where we’ll be looking at the isolated pieces of code that you need to understand in order to build our project. Tomorrow we’ll move on to the implementation day, where you’ll put those new techniques into practice with our app.
> 
> Today you have seven topics to work through, and you’ll meet `Form`, `NavigationView`, `@State`, and more.

- [*Day 16 • Wednesday August 18, 2021*](#day-16--wednesday-august-18-2021)
  - [:one: WeSplit: Introduction](#one-wesplit-introduction)
  - [:two:  [Understanding the basic structure of a SwiftUI app](#two--understanding-the-basic-structure-of-a-swiftui-app)
  - [:three:  Creating a form](#three--creating-a-form)
  - [:four: Adding a navigation bar](#four-adding-a-navigation-bar)
  - [:five: Modifying program state](#five-modifying-program-state)

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

These are familiar parts and more or less what's been said.

> * Preview Content is a yellow group, with Preview `Assets.xcassets` inside – this is another asset catalog, this time specifically for example images you want to use when you’re designing your user interfaces, to give you an idea of how they might look when the program is running.

This is new.

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
> First, `import SwiftUI` tells Swift that we want to use all the functionality given to us by the SwiftUI framework. 

:white_check_mark: yup

> Second, `struct ContentView: View` creates a new `struct` called `ContentView`, saying that it conforms to the `View` protocol. 
>
> * `View` comes from `SwiftUI`, and is the basic protocol _that must be adopted by anything you want to draw on the screen_ – all text, buttons, images, and more are all views, including your own layouts that combine other views.

Everything on the screen (for this app) is a view type

> Third, `var body: some View` defines **a new computed property** called body, which has an interesting type: `some View`. This means it will return something that conforms to the `View` protocol, but that extra `some` keyword adds _an important restriction: it must always be the same kind of view being returned_ – you can’t sometimes return one type of thing and other times return a different type of thing.
> 
> We’ll look at this feature more shortly, but for now just remember that it means “one specific sort of view must be sent back from this property.”

But not necessarily the exact same? Anything of this type?

> The `View` protocol has only one requirement, which is that you have a computed property called `body` that returns `some View`. You can (and will) add more properties and methods to your view structs, but body is the only thing that’s required.
> 
> Fourth, `Text("Hello World")` creates a text view using the string “Hello World”... 


> Below the `ContentView` struct you’ll see a `ContentView_Previews` struct, which conforms to the `PreviewProvider` protocol. This piece of code won’t actually form part of your final app that goes to the App Store, but is instead specifically for Xcode to use so it can show a preview of your UI design alongside your code.
> 
> These previews use an Xcode feature called **the canvas**, w_hich is usually visible directly to the right of your code_. You can customize the preview code if you want, and they will only affect the way the canvas shows your layouts – it won’t change the actual app that gets run.

Ok nice feature

> Tip: Very often you’ll find that an error in your code stops Xcode’s canvas from updating – you’ll see something like “Automatic preview updating paused”, and can press Resume to fix it. As you’ll be doing this a lot, let me recommend an important shortcut: Option+Cmd+P does the same as clicking Resume.

:star: *Option+Cmd+P* 

## :three:  [Creating a form](https://www.hackingwithswift.com/books/ios-swiftui/creating-a-form) 

> Many apps require users to enter some sort of input – it might be asking them to set some preferences, it might be asking them to confirm where they want a car to pick them up, it might be to order food from a menu, or anything similar.
> 
> SwiftUI gives us a dedicated view type for this purpose, called `Form`. Forms are scrolling lists of static controls like text and images, but can also include user interactive controls like text fields, toggle switches, buttons, and more.
> 
> You can create a basic form just by wrapping the default text view inside `Form`, like this:

```swift
var body: some View {
    Form {
        Text("Hello World")
    }
}
```

> If you’re using Xcode’s canvas, you’ll see it change quite dramatically: before Hello World was centered on a white screen, but now the screen is a light gray, and Hello World appears in the top left in white.
> 
> What you’re seeing here is the beginnings of a list of data, just like you’d see in the Settings app. We have one row in our data, which is the Hello World text, but we can add more freely and have them appear in our form immediately:

```swift
Form {
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
}
```

> In fact, you can have as many things inside a form as you want, although if you intend to add more than 10 SwiftUI requires that you place things in groups to avoid problems.
> 
> For example, this code shows ten rows of text just fine:

```swift
Form {
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
}
```

> But this attempts to show 11, which is not allowed:

```swift
Form {
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
}
```

> Tip: **In case you were curious why 10 rows are allowed but 11 is not, this is a limitation in SwiftUI: it was coded to understand how to add one thing to a form**, how to add two things to a form, how to add three things, four things, five things, and more, all the way up to 10, but not beyond – they needed to draw a line somewhere. 
> 
> This limit of 10 children inside a parent actually applies everywhere in SwiftUI.
> 
> If you wanted to have 11 things inside the form you should put some rows inside a `Group`:

```swift
Form {
    Group {
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
    }

    Group {
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
    }
}
```

> Groups don’t actually change the way your user interface looks, they just let us work around SwiftUI’s limitation of ten child views inside a parent – that’s text views inside a form, in this instance.
> 
> If you want your form to look different when split its items into chunks, you should use the Section view instead. This splits your form into discrete visual groups, just like the Settings app does:

```swift
Form {
    Section {
        Text("Hello World")
    }

    Section {
        Text("Hello World")
        Text("Hello World")
    }
}
```

> There’s no hard and fast rule when you should split a form into sections – it’s just there to group related items visually.

## :four: [Adding a navigation bar](https://www.hackingwithswift.com/books/ios-swiftui/adding-a-navigation-bar) 

> By default iOS allows us to place content anywhere on the screen, including under the system clock and the home indicator. This doesn’t look great, which is why by default SwiftUI ensures components are placed in an area where they can’t be covered up by system UI or device rounded corners – an area known as the safe area.
> 
> On an iPhone 11, the safe area spans the space from just below the notch down to just above the home indicator. You can see it in action with a user interface like this one:

```swift
struct ContentView: View {
    var body: some View {
        Form {
            Section {
                Text("Hello World")
            }
        }
    }
}
```
> Try running that in the iOS simulator – press the Play button in the top-left corner of Xcode’s window, or press Cmd+R.
> 
> You’ll see that the form starts below the notch, so by default the row in our form is fully visible. However, forms can also scroll, so if you swipe around in the simulator you’ll find you can move the row up so it goes under the clock, making them both hard to read.
> 
> **A common way of fixing this is by placing a navigation bar at the top of the screen**...
>
> You’ve seen that we can place a text view inside a section by adding Section around the text view, and that we can place the section inside a Form in a similar way. Well, we add a navigation bar in just the same way, except here it’s called NavigationView.

```swift
var body: some View {
    NavigationView {
        Form {
            Section {
                Text("Hello World")
            }
        }
    }
}
```

> When you see that code in Xcode’s canvas, you’ll notice t_here’s a large gray space at the top of your UI_. Well, that’s our navigation bar in action, and if you run your code in the simulator you’ll see the form slides under the bar as it moves to the top of the screen.
> 
> You’ll usually want to put some sort of title in the navigation bar, and you can do that by attaching a modifier to whatever you’ve placed inside. Modifiers are regular methods with one small difference: they always return a new instance of whatever you use them on.
> 
> Let’s try adding a modifier to set the navigation bar title for our form:

```swift
NavigationView {
    Form {
        Section {
            Text("Hello World")
        }
    }
    .navigationBarTitle(Text("SwiftUI"))
}
```

Woah weird, different defaults in SwiftUI compared to UIKit

> When we attach the `.navigationBarTitle()` modifier to our form, Swift actually creates a new form that has a navigation bar title plus all the existing contents you provided.
> 
> When you add a title to a navigation bar, you’ll notice it uses a large font for that title. You can get a small font with a slightly different call to `navigationBarTitle()`:

```swift
.navigationBarTitle("SwiftUI", displayMode: .inline)
```

This is just an alternative

> You can see how Apple uses these large and small titles in the Settings app: the first screen says “Settings” in large text, and subsequent screens show their titles in small text.
> 
> Because it’s so common to use large titles, there’s a shortcut version you can use that lets you use a plain string rather than a text view:

```swift
.navigationBarTitle("SwiftUI")
```

## :five: [Modifying program state](https://www.hackingwithswift.com/books/ios-swiftui/modifying-program-state) 

> There’s a saying among SwiftUI developers that our **“views are a function of their state,”** but while that’s only a handful of words it might be quite meaningless to you at first.
> 
> If you were playing a fighting game, you might have lost a few lives, scored some points, collected some treasure, and perhaps picked up some powerful weapons. In programming, we call these things state – _the active collection of settings that describe how the game is right now_...

> When we say SwiftUI’s views are a function of their state, we mean that the way your user interface looks – the things people can see and what they can interact with – are determined by the state of your program. For example, they can’t tap Continue until they have entered their name in a text field.
> 
> That in itself might sound obvious, but this is actually very different from the alternative that was used previously: **your user interface was determined by a sequence of events**. So, what the user sees right now is because they’ve been using your app for a while, have tapped various things, might have logged in or refreshed their data, and so on.
> 
> The “sequence of events” approach means _it’s very hard to store the state of an app_, because the only way to get back the perfect state would be to **play back the exact sequence of events that the user performed**. This is why so_ many apps just don’t even try to save your state_, even slightly – your news app won’t go back to the last article you were reading, Twitter won’t remember if you were part-way through typing a reply to someone, and Photoshop forgets any undo state you had stacked up.
> 
> Let’s put this into practice with a button, which in SwiftUI can be created with a title string and an action closure that gets run when the button is tapped:

```swift
struct ContentView: View {
    var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}
```

> That code looks reasonable enough: create a button that says “Tap Count” plus the number of times the button has been tapped, then add 1 to `tapCount` whenever the button is tapped.
> 
> However, it won’t build; that’s not valid Swift code. You see, `ContentView` is a struct, which might be created as a constant. If you think back to when you learned about structs, that means it’s immutable – we can’t change its values freely.

Know this pretty well, that structs are constant and calculated values can't be set like this.

> When creating struct methods that want to change properties, we need to add the `mutating` keyword: `mutating func doSomeWork()`, for example. However, Swift doesn’t let us make mutating computed properties, which means we can’t write `mutating var body: some View` – it just isn’t allowed.

:red_circle: *"Swift doesn’t let us make **mutating computed properties**"* 

> This might seem like we’re stuck at an impasse: we want to be able to change values while our program runs, but Swift won’t let us because our views are structs.
> 
> Fortunately, Swift gives us a special solution called a property wrapper: a special attribute we can place before our properties that effectively gives them super-powers. In the case of storing simple program state like the number of times a button was tapped, we can use a property wrapper from SwiftUI called` @State`, like this:

```swift
struct ContentView: View {
    @State var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}
```

> That small change is enough to make our program work, so you can now build it and try it out.
> 
> `@State` allows us to work around the limitation of structs: we know we can’t change their properties because structs are fixed, but `@State` allows that value to be stored separately by SwiftUI in a place that can be modified.
> 
> Yes, it feels a bit like a cheat, and you might wonder why we don’t use classes instead – they can be modified freely. But trust me, it’s worthwhile: as you progress you’ll learn that SwiftUI destroys and recreates your structs frequently, so keeping them small and simple structs is important for performance.

:question: *So basically the garbage collection and life cycle is easier or better via structs, so that's why theres no class?* 

> Tip: There are several ways of storing program state in `SwiftUI`, and you’ll learn all of them. `@State `is specifically designed for simple properties that are stored in one view. As a result, Apple recommends we add private access control to those properties, like this: `@State private var tapCount = 0`.

:question: *We're starting simple, but is this "the most simple"?*