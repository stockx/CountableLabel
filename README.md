# CountableLabel
###### add logo image here


![Swift4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat")
[![Platform](https://img.shields.io/cocoapods/p/EvenlyWrappedLabel.svg?style=flat)](http://cocoapods.org/pods/EvenlyWrappedLabel)
[![Version](https://img.shields.io/cocoapods/v/EvenlyWrappedLabel.svg?style=flat)](http://cocoapods.org/pods/EvenlyWrappedLabel)
[![License](https://img.shields.io/cocoapods/l/EvenlyWrappedLabel.svg?style=flat)](http://cocoapods.org/pods/EvenlyWrappedLabel)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

`CountableLabel` is a `UILabel` that was heavily inspired by `GCountableUILabel`. This subclass will provided a variety of nice text setting animations especially when the label is used for dynamic number changes. The reason we built our own version of `GCountableUILabel` is because the original repo was written in `Objective-C`, on top of that decrementing/setting of different size text cause a lot of breaking in the pod. With the new version you are free to change the text to what ever you choose! Happy Counting!

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
- [x] Example app with lots of real-time configurations that lets you dynamically set, increment and decrement the values, animations, and text alignment of the label!

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
###### add image here

##### After:
###### add image here

## Animation Type
Set `label.animationType = .pushUp` to see text go bottom up across the label.

Set `label.animationType = .pushDown` to see text go top down across the label.

Set `label.animationType = .fade` to see text fade in and out on the label.

<a name="installation"> Installation </a>
--------------

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate `EvenlyWrappedLabel` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'EvenlyWrappedLabel'
```

Then, run the following command:

```bash
$ pod install
```

In case Xcode complains (<i>"Cannot load underlying module for EvenlyWrappedLabel"</i>) go to Product and choose Clean (or simply press <kbd>⇧</kbd><kbd>⌘</kbd><kbd>K</kbd>).

### Manually

If you prefer not to use CocoaPods, you can integrate `EvenlyWrappedLabel` into your project manually.

<a name="license"> License </a>
--------------

`CountableLabel` is developed by [Andrew Foghel](https://www.linkedin.com/in/andrew-foghel-6b90a9137/) at [StockX](https://stockx.com) and is released under the MIT license. See the `LICENSE` file for details.

<a name="contact"> Contact </a>
--------------

Feel free to email me (at andrewfoghel@gmail.com). If you find any problems with the project or have ideas to enhance it, feel free to open a GitHub issue and/or create a pull request.
