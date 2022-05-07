# *Day 18 • Saturday May 07, 2022*

> You just finished building your first SwiftUI app, and all being well you were surprised by how easy it was. You might even be wondering why I spent so long talking about structs, closures, optionals, and more, when really we ended up doing some fairly simple code.
> 
> Well, first keep in mind that this is only the first project, and I kept it deliberately simple so you can get moving quickly with your own code. Trust me, things will get more complex – in fact tomorrow you’ll be set free with your own project, so don’t get too comfortable!
> 
> Second, though, you have been using advanced features. In fact, without realizing it you’ve actually been using all the most advanced features Swift has to offer. We’ve actually been using closures all the time – just look at code like this:

```swift
Picker("Tip percentage", selection: $tipPercentage) {
    ForEach(tipPercentages, id: \.self) {
        Text($0, format: .percent)
    }
}
```

> Did you notice that $0 in there? That’s shorthand syntax for closure parameters, because we’re inside a closure.
> 
> Anyway, now that the app is complete it’s time for a quick recap what you learned, a short test to make sure you’ve understood what was taught, then your first challenges – exercises designed to get you writing your own code as quickly as possible.
> 
> I do not provide the answers to these challenges. This is intentional: I want you to figure it out by yourself rather than just looking at someone else’s work. As Marvin Phillips said, “the difference between try and triumph is a little umph.”
> 
> Today you should work through the wrap up chapter for project 1, complete its review, then work through all three of its challenges.

## Review

* SwiftUI allows no more than 10 child views inside each parent.
  * If you want to add more you should place your views inside groups.

* Formatters let us control the way numbers are shown inside Text views.
  * We used currency and percentages in this project, but there are many others to choose from.

* Segmented controls are created using picker views in SwiftUI.
  * Pickers adopt segmented styling when we apply the `.pickerStyle(.segmented)` modifier on them.

* Forms can scroll.
  * Forms can indeed scroll, so it's a good idea to check your content doesn't overlap the system clock by accident.

* The keyboardType() modifier lets us change the keyboard that is shown when a text field is active.
  * There are lots of options to choose from, including number pad, decimal pad, and more.

* When creating a text field we need to provide some placeholder text.
  * This helps users see what should be entered, and is also useful to screen readers.

* As you've seen, pickers might be wheels, segmented controls, or even new views that slide on and off the screen.

* All SwiftUI views must have a body property.
  * This body must always return precisely one view. That view might contain more views inside it, but you still need to return precisely one from the computed property.

* We can send a string to the navigationTitle() modifier to place a title at the top of our navigation view.
  * You should always attach this modifier to the view inside the navigation view rather than the navigation view itself.

* The nil coalescing operator is used to ensure something does have a value, either by unwrapping its optional value or by providing a default.

* If we want to modify a property, we need to use a SwiftUI property wrapper such as `@State`.
* `@State` tells SwiftUI to store the value somewhere that can be changed freely, outside of our struct.

* ForEach views let us loop over ranges and arrays.
  * They are used to create many instances of something very quickly.

* Whenever an @State property changes, Swift re-invokes our body property.
  * This behavior forces all values inside the body to be re-evaluated, making sure they are updated for the changes.

* SwiftUI's previews aren't included in our app if we send it to the App Store.
  * Swift automatically strips out the previews; they are just there to help us design our UI.

## Challenge

> One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on:

  - [ ]  Add a header to the third section, saying “Amount per person”
  - [ ]  Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
  - [ ]  Change the tip percentage picker to show a new screen rather than using a segmented control, and give it a wider range of options – everything from 0% to 100%. Tip: use the range 0..<101 for your range rather than a fixed array.

> And if you found those easy, here’s a tough one for you: rather than having to type `.currency(code: Locale.current.currencyCode ?? "USD")` in two places, can you make a new property to store the currency formatter? You’ll need to give your property a specific return type in order to keep the rest of your code happy: `FloatingPointFormatStyle<Double>.Currency`.
> 
> You can find that for yourself using Xcode’s Quick Help window – open up the right-hand navigator, then select the Quick Help inspector, and finally click select the `.currency` code. You’ll see Xcode displays `<Value>` rather than `<Double>`, because this thing is able to display other kinds of floating-point numbers too, but here we need Double.