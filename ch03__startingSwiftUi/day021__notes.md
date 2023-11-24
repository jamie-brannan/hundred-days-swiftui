# *Day 21 • Friday November 24, 2023*

> `One of the things people often complain about while learning to program is that they really want to get busy making The Big App Idea they had, but instead they need to follow tutorials making different apps entirely.
> `
> `I know this can be annoying, but trust me: nothing you’re learning will be wasted. Sure, you might not ever make a flag guessing game, but the concepts you learn here – building layouts, tracking state, randomizing arrays, and more – will last you for years.
> `
> `Oprah Winfrey once said, “do what you have to do until you can do what you want to do.” By the end of this 100 days course I hope you’ll be able to do exactly what you want, but in the meantime stick with it – you’re learning key skills here!
> `
> `Today you have three topics to work through, in which you’ll apply your knowledge of VStack, LinearGradient, alerts, and more.
> `

- [*Day 21 • Friday November 24, 2023*](#day-21--friday-november-24-2023)
  - [:one: Stacking up buttons](#one-stacking-up-buttons)
  - [:two: Showing the player’s score with an alert](#two-showing-the-players-score-with-an-alert)
  - [:three: Styling our flags](#three-styling-our-flags)
  - [:four: Upgrading our design](#four-upgrading-our-design)


> `Admit it: building a SwiftUI app is fast, isn’t it? Once you know the tools you’re working with, you can turn around a complete game in under 15 minutes, and then just like we did try playing around with the design until you find something you like.

## :one: Stacking up buttons

> We’re going to start our app by building the basic UI structure, which will be two labels telling the user what to do, then three image buttons showing three world flags.
> 
> First, find the assets for this project and drag them into your asset catalog. That means opening Assets.xcassets in Xcode, then dragging in the flag images from the project2-files folder. You’ll notice that the images are named after their country, along with either @2x or @3x – these are images at double resolution and triple resolution to handle different types of iPhone screen.
> 
> Next, we need two properties to store our game data: an array of all the country images we want to show in the game, plus an integer storing which country image is correct.

```swift
var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
var correctAnswer = Int.random(in: 0...2)
```

The Int.random(in:) method automatically picks a random number, which is perfect here – we’ll be using that to decide which country flag should be tapped.

Inside our body, we need to lay out our game prompt in a vertical stack, so let’s start with that:

```swift
var body: some View {
    VStack {
        Text("Tap the flag of")
        Text(countries[correctAnswer])
    }
}
```
> Below there we want to have our tappable flag buttons, and while we could just add them to the same VStack we can actually create a second VStack so that we have more control over the spacing.
> 
> The VStack we just created above holds two text views and has no spacing, but the flags are going to have 30 points of spacing between them so it looks better.
> 
> So, we're going to wrap our previous VStack with another one, this time with a spacing value of 30, then add a new ForEach loop:

```swift
VStack(spacing: 30) {
    VStack {
        Text("Tap the flag of")
        Text(countries[correctAnswer])
    }

    ForEach(0..<3) { number in
        Button {
           // flag was tapped
        } label: {
            Image(countries[number])
        }
    }
}
```

> Having two vertical stacks like this allows us to position things more precisely: the outer stack will space its views out by 30 points each, whereas the inner stack has no custom spacing.
> 
> That’s enough to give you a basic idea of our user interface, and already you’ll see it doesn’t look great – some flags have white in them, which blends into the background, and all the flags are centered vertically on the screen.
> 
> We’ll come back to polish the UI later, but for now let’s put in a blue background color to make the flags easier to see. Because this means putting something behind our outer VStack, we need to use a ZStack as well. Yes, we’ll have a VStack inside another VStack inside a ZStack, and that is perfectly normal.
> 
> Start by putting a ZStack around your outer VStack, like this:

```swift
var body: some View {
    ZStack {
        // previous VStack code
    }
}
```

> Now put this just inside the ZStack, so it goes behind the outer VStack:

```swift
Color.blue
    .ignoresSafeArea()
```

> That .ignoresSafeArea() modifier ensures the color goes right to the edge of the screen.
> 
> Now that we have a darker background color, we should give the text something brighter so that it stands out better:

```swift
Text("Tap the flag of")
    .foregroundStyle(.white)

Text(countries[correctAnswer])
    .foregroundStyle(.white)
```

> This design is not going to set the world alight, but it’s a solid start!

## :two: Showing the player’s score with an alert

:white_check_mark: *All knowns*

## :three: Styling our flags

:white_check_mark: *Native Font text styles that we can call and move around, got familiar with these at work with the design system font library*

:white_check_mark: *`.clipShape(.capsule)`*

:bulb: *New one would be using `.shadow`*



## :four: Upgrading our design