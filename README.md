![Countable Label Logo](https://user-images.githubusercontent.com/22037563/51654954-6e5a9200-1f68-11e9-9192-286826475a18.png)


![Swift4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat")
[![Platform](https://img.shields.io/cocoapods/v/CountableLabel.svg?style=flat)](https://cocoapods.org/pods/CountableLabel)
[![Version](https://img.shields.io/cocoapods/v/CountableLabel.svg?style=flat)](https://cocoapods.org/pods/CountableLabel)
[![License](https://img.shields.io/cocoapods/v/CountableLabel.svg?style=flat)](https://cocoapods.org/pods/CountableLabel)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

`CountableLabel` is a `UILabel` that was heavily inspired by [GCountableUILabel](https://github.com/gwangpa/GCountableUILabel). This subclass will provided a variety of nice text setting animations especially when the label is used for dynamic number changes. The reason we built our own version of `GCountableUILabel` is because the original repo was written in `Objective-C`, on top of that decrementing/setting of different size text cause a lot of breaking in the pod. With the new version you are free to change the text to what ever you choose! Happy Counting!

## Contents 
1. [Features](#features)
2. [Usage](#usage)
3. [Installation](#installation)
6. [License](#license)
7. [Contact](#contact)

<a name="features"> Features </a>
--------------

- [x] Works with all devices running iOS 9+.
- [x] Override `text` internally to keep the usage extremely simple.
- [x] 3 types of animations (PushUp, PushDown, Fade) and a feature have no animation as well.
- [x] Works with autolayout, honors intrinsic sizing, and self sizes on the fly.
- [x] Works with labels created in code and in Interface Builder.
- [x] Example app with lots of real-time configurations that lets you dynamically increment/decrement a value of your choosing, specify which animation you want to use, and specify text alignment of the label!

<a name="usage"> Usage </a>
--------------

## Set up

Swap any `UILabel` with `CountableLabel`:

#### In code
-----

##### Before:
```swift
class ViewController {
let label = UILabel()
}
```

##### After:
```swift
import CountableLabel

class ViewController {
let label = CountableLabel()
}
```

#### In Interface Builder
-----

##### Before:
![Interface Builder Screenshot - Before](https://user-images.githubusercontent.com/22037563/51654376-9f859300-1f65-11e9-87d0-01035fb8f1f3.png)

##### After:
![Interface Builder Screenshot - After](https://user-images.githubusercontent.com/22037563/51654375-9f859300-1f65-11e9-9dde-d39eb8e530f8.png)

## Animation Type
Set `label.animationType = .pushUp` to see text go bottom up across the label.

![PushUp Animation Demo](https://user-images.githubusercontent.com/22037563/51654374-9f859300-1f65-11e9-938c-529cb4ef4a8f.gif)

Set `label.animationType = .pushDown` to see text go top down across the label.

![PushDown Animation Demo](https://user-images.githubusercontent.com/22037563/51654576-8af5ca80-1f66-11e9-8010-1d66eb59ac51.gif)

Set `label.animationType = .fade` to see text fade in and out on the label.

![Fade Animation Demo](https://user-images.githubusercontent.com/22037563/51654583-8f21e800-1f66-11e9-976f-499dd8ae6933.gif)

<a name="installation"> Installation </a>
--------------

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate `CountableLabel` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'CountableLabel'
```

Then, run the following command:

```bash
$ pod install
```

In case Xcode complains (<i>"Cannot load underlying module for CountableLabel"</i>) go to Product and choose Clean (or simply press <kbd>⇧</kbd><kbd>⌘</kbd><kbd>K</kbd>).

### Manually

If you prefer not to use CocoaPods, you can integrate `CountableLabel` into your project manually.

<a name="license"> License </a>
--------------

`CountableLabel` is developed by [Andrew Foghel](https://www.linkedin.com/in/andrew-foghel-6b90a9137/) at [StockX](https://stockx.com) and is released under the MIT license. See the `LICENSE` file for details.

<a name="contact"> Contact </a>
--------------

Feel free to email me (at andrewfoghel@gmail.com). If you find any problems with the project or have ideas to enhance it, feel free to open a GitHub issue and/or create a pull request.
