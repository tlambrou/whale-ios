# SwiftyOnboard
> A simple iOS framework that allows developers to create onboarding experiences.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
<!-- [![Carthage compatible](https://img.shields.io/badge/Carthage-incompatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) -->
[![CocoaPods](https://img.shields.io/cocoapods/v/SwiftyOnboard.svg)](https://cocoapods.org/pods/SwiftyOnboard)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

SwiftyOnboard makes it easy to add onboarding to any iOS application. SwiftyOnboard handles all of the logic behind the pagination of views, which allows you to quickly add a highly customizable onboarding to your app, all in a lightweight framework.

![](screenshots/confess.gif)

## Contents

* [Requirements](#requirements)
* [Installation](#installation)
    * [CocoaPods](#cocoapods)
    * [Manually](#manually)
* [Usage](#usage)
    * [Properties](#properties)
    * [Methods](#methods)
    * [Protocols](#protocols)
        * [DataSource](#swiftyonboarddatasource)
        * [Delegate](#swiftyonboarddelegate)
* [Notes](#notes)
* [Contribute](#contribute)
* [License](#license)

## Requirements

- iOS 9.0+
- Xcode 7.3+

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `SwiftyOnboard` by adding it to your `Podfile`:

```ruby
use_frameworks!
pod 'SwiftyOnboard'
```
#### Manually
1. Drag and drop ```SwiftyOnboard.swift``` ```SwiftyOnboardOverlay.swift``` ```SwiftyOnboardPage.swift``` in your project.  
2. That's it!

## Usage
1. Import `SwiftyOnboard` module to your `ViewController` class
```swift
import SwiftyOnboard
```
2. Add `SwiftyOnboard` to `ViewController`, then set dataSource and delegate for it
```swift
class ViewController: UIViewController {
    override func viewDidLoad() {
            super.viewDidLoad()

            let swiftyOnboard = SwiftyOnboard(frame: view.frame)
            view.addSubview(swiftyOnboard)
            swiftyOnboard.dataSource = self
            swiftyOnboard.delegate = self
        }
}
```
3. Conform your `ViewController` to `SwiftyOnboardDataSource` protocol and implement all the methods, e.g.
```swift
extension ViewController: SwiftyOnboardDataSource {

        func swiftyOnboardNumberOfPages(swiftyOnboard: SwiftyOnboard) -> Int {
            return 3
        }

        func swiftyOnboardPageForIndex(swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
            let page = SwiftyOnboardPage()
            return page
        }

        func swiftyOnboardViewForOverlay(swiftyOnboard: SwiftyOnboard) -> SwiftyOnboardOverlay? {
            let overlay = SwiftyOnboardOverlay()
            return overlay
        }
}
```
4. `SwiftyOnboard` works with default implementation. Override it to customize its behavior

<!-- [Example project with CocoaPods](https://github.com/juanpablofernandez). -->

### Properties
--------------

SwiftyOnboard has the following properties:
```swift
public var dataSource: SwiftyOnboardDataSource?
```
An object that supports the SwiftyOnboardDataSource protocol and can provide views to populate the SwiftyOnboard.
```swift
public var delegate: SwiftyOnboardDelegate?
```
An object that supports the SwiftyOnboardDelegate protocol and can respond to SwiftyOnboard events.
```swift
public var shouldSwipe: Bool
```
Whether or not swiping is enabled [default = true].

### Methods
--------------

SwiftyOnboard class has the following methods:
```swift
func goToPage(index: Int, animated: Bool)
```
This method allows you to move to a certain page in the onboarding.

### Protocols
---------------

The SwiftyOnboard follows the Apple convention for data-driven views by providing two protocol interfaces, SwiftyOnboardDataSource and SwiftyOnboardDelegate.
#### SwiftyOnboardDataSource
SwiftyOnboardDataSource protocol has the following methods:
```swift
func swiftyOnboardNumberOfPages(swiftyOnboard: SwiftyOnboard) -> Int
```
Return the number of items (pages) in the onboarding.
```swift
func swiftyOnboardViewForBackground(swiftyOnboard: SwiftyOnboard) -> UIView?
```
Return a view to be displayed as the background of the onboarding.
```swift
func swiftyOnboardPageForIndex(swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage?
```
Return a view (page) to be displayed at the specified index in the onboarding.
```swift
func swiftyOnboardViewForOverlay(swiftyOnboard: SwiftyOnboard) -> SwiftyOnboardOverlay?
```
Return an overlay (view) to be displayed on top of the onboarding pages. e.g. [The continue and skip buttons which don't move with the pages, also included is the page control]
```swift
func swiftyOnboardOverlayForPosition(swiftyOnboard: SwiftyOnboard, overlay: SwiftyOnboardOverlay, for position: Double)
```
Edit the overlay (view) for the desired position. e.g. [Change the "continue button" text to "Done", when the last page is reached]

#### SwiftyOnboardDelegate
SwiftyOnboardDelegate protocol has the following methods:
```swift
func swiftyOnboard(swiftyOnboard: SwiftyOnboard, currentPage index: Int)
```
This method is called whenever a page is shown, it holds the index to that page. It is called regardless of whether the page was swiped programmatically or through user interaction.
```swift
func swiftyOnboard(swiftyOnboard: SwiftyOnboard, leftEdge position: Double)
```
This method is called whenever the pages are scrolling, it holds the current distance between the left side of the screen and the left side of the first page.

## Notes
* Carthage is not supported
* Landscape mode is not supported

## Contribute
I want to see your amazing onboarding. Take screenshots and/or record a gif and send it my way!

## License

Distributed under the MIT license. See ``LICENSE`` for more information.

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
