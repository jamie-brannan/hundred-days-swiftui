# *Day 17 • Friday May 06, 2022*

> As Immanuel Kant said, “experience without theory is blind, but theory without experience is mere intellectual play.” Yesterday we covered almost all the techniques required to build this app, so now it’s time to turn all that head knowledge into a real, practical app.

> One of the things I love about SwiftUI is how easily this transition from theory to practice is – there are no surprises lurking around the corner and no epic extra new things to learn along the way.

> Sure, I’ll sneak in a couple of tiny things just to keep you on your toes, but for the most part you already know everything you need to build this project, so now it’s just a matter of seeing how things fit together.

> Today you have four topics to work through, in which you’ll apply your knowledge of `Form`, `@State`, `Picker`, and more.

- [*Day 17 • Friday May 06, 2022*](#day-17--friday-may-06-2022)
  - [:one: Reading text from the user with `TextField`](#one-reading-text-from-the-user-with-textfield)
  - [:two: Creating pickers in a form](#two-creating-pickers-in-a-form)
  - [:three: Adding a segmented control for tip percentages](#three-adding-a-segmented-control-for-tip-percentages)
  - [:four: Calculating the total per person](#four-calculating-the-total-per-person)
  - [:five: Hiding the keyboard](#five-hiding-the-keyboard)

## :one: [Reading text from the user with `TextField`](https://www.hackingwithswift.com/books/ios-swiftui/reading-text-from-the-user-with-textfield) 

> We’re building a check-splitting app, which means users need to be able to enter the cost of their check, how many people are sharing the cost, and how much tip they want to leave.
> 
> Hopefully already you can see that means we need to add three `@State` properties, because there are three pieces of data we’re expecting users to enter into our app.
> 
> So, start by adding these three properties to our ContentView struct:

```swift
@State private var checkAmount = 0.0
@State private var numberOfPeople = 2
@State private var tipPercentage = 20
```

> As you can see, that gives us a default of 0.0 for the check amount, a default value of 2 for the number of people, and a default value of 2 for the tip percentage. Each of these properties have a sensible default: we don’t know how much the check will come to, but assuming two people and a 20% tip both seem like good starting points for the app.
> 
> Of course, some people prefer to leave a different percentage of tip, so we’re going to let them select values from a predetermined array of tip sizes. We need to store the list of possible tip sizes somewhere, so please add this fourth property beneath the previous three:

```swift
let tipPercentages = [10, 15, 20, 25, 0]
```

> We’re going to build up the form step by step, starting with a text field where users can enter the value of their check. We’ll start with what you know already, but as you’ll see that won’t quite work right.
> 
> Modify the `body` property to this:

```swift
Form {
    Section {
        TextField("Amount", text: $checkAmount)
    }
}
```

> That isn’t going to work, and that’s okay. The problem is that SwiftUI likes TextField to be used for entering text – strings, that is. We could allow that here, but it would mean users could enter any kind of text, and we’d need to carefully convert that string to a number we can work with.
> 
> Fortunately, we can do better: we can pass our Double to TextField and ask it to treat the input as a currency, like this:

```swift
TextField("Amount", value: $checkAmount, format: .currency(code: "USD"))
```

> That’s an improvement, but we can do even better. You see, that tells SwiftUI we want the currency formatted as US dollars, or USD for short, but given that over 95% of the world’s population don’t use US dollars as their currency we should probably not force “USD” on them.
> 
> A better solution is to ask iOS if it can give us the currency code for the current user, if there is one. This might be USD, but it might also be CAD (Canadian dollars), AUD (Australian dollars), JPY (Japanese Yen) and more – or it might not currently have a value, if the user hasn’t set one.
> 
> So, a better format to use is this:

```swift
.currency(code: Locale.current.currencyCode ?? "USD"))
```

> `Locale` is a massive struct built into iOS that is responsible for storing all the user’s region settings – what calendar they use, how they separate thousands digits in numbers, whether they use the metric system, and more. In our case, we’re asking whether the user has a preferred currency code, and if they don’t we’ll fall back to “USD” so at least we have something.
> 
> So far our code creates a scrolling entry form of one section, which in turn contains one row: our text field. When you create text fields in forms, the first parameter is a string that gets used as the placeholder – gray text shown in side the text field, giving users an idea of what should be in there. The second parameter is the two-way binding to our `checkAmount` property, which means as the user types that property will be updated. The third parameter here is the one that controls the way the text is formatted, making it a currency.
> 
> One of the great things about the `@State` property wrapper is that it automatically watches for changes, and when something happens it will automatically re-invoke the `body` property. That’s a fancy way of saying it will reload your UI to reflect the changed state, and it’s a fundamental feature of the way SwiftUI works.
> 
> To demonstrate this, we could add a second section with a text view showing the value of `checkAmount`, like this:

```swift
Form {
    Section {
        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
    }

    Section {
        Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
    }
}
```

> That does almost exactly the same thing as our `TextField`: it asks SwiftUI to format the number as a currency, using either the system default or USD if nothing else is available. Later on in this project we’ll be using a different format style to show percentages – these text formatters are really helpful!
> 
> We’ll be making that show something else later on, but for now please run the app in the simulator so you can try it yourself.
> 
> Tap on the check amount text field, then enter an example amount such as 50. What you’ll see is that as you type the text view in the second section automatically and immediately reflects your actions.
> 
> This synchronization happens because:
> 
> * Our text field has a two-way binding to the `checkAmount` property.
> * The `checkAmount` property is marked with `@State`, which automatically watches for changes in the value.
> * When an `@State` property changes SwiftUI will re-invoke the `body` property (i.e., reload our UI)
> * Therefore the text view will get the updated value of `checkAmount`.
> 
> The final project won’t show `checkAmount` in that text view, but it’s good enough for now. Before we move on, though, I want to address one important problem: when you tap to enter text into our text field, users see a regular alphabetical keyboard. Sure, they can tap a button on the keyboard to get to the numbers screen, but it’s annoying and and not really necessary.
> 
> Fortunately, text fields have a modifier that lets us force a different kind of keyboard: `keyboardType()`. We can give this a parameter specifying the kind of keyboard we want, and in this instance either `.numberPad` or `.decimalPad `are good choices. Both of those keyboards will show the digits 0 through 9 for users to tap on, but `.decimalPad` also shows a decimal point so users can enter check amount like $32.50 rather than just whole numbers.
> 
> So, modify your text field to this:

```swift
TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
    .keyboardType(.decimalPad)
```

> You’ll notice I added a line break before `.keyboardType` and also indented it one level deeper than TextField – that isn’t required, but it can help you keep track of which modifiers apply to which views.
> 
> Go ahead and run the app now and you should find you can now only type numbers into the text field.
> 
> Tip: The `.numberPad` and `.decimalPad` keyboard types tell SwiftUI to show the digits 0 through 9 and optionally also the decimal point, but that doesn’t stop users from entering other values. For example, if they have a hardware keyboard they can type what they like, and if they copy some text from elsewhere they’ll be able to paste that into the text field no matter what is inside that text. That’s OK, though – the text field will automatically filter out bad values when they hit Return.

## :two: [Creating pickers in a form](https://www.hackingwithswift.com/books/ios-swiftui/reading-text-from-the-user-with-textfield) 

## :three: [Adding a segmented control for tip percentages](https://www.hackingwithswift.com/books/ios-swiftui/reading-text-from-the-user-with-textfield) 

## :four: [Calculating the total per person](https://www.hackingwithswift.com/books/ios-swiftui/reading-text-from-the-user-with-textfield) 

## :five: [Hiding the keyboard](https://www.hackingwithswift.com/books/ios-swiftui/reading-text-from-the-user-with-textfield) 

