# UserDefaultsPropertyWrapper

This is a @propertyWrapper class that allows you to create properties that are stored in user defaults and makes it easy to work with them.

So you can create a property like this:
```swift
    @UserDefaultWrapper(key: "someProperty", defaultValue: nil)
    public static var someProperty: String?
```
and then set its value:
```swift
SomeClass.someProperty = "someStringValue"
```
or get it:
```swift
let someProperty = SomeClass.someProperty
```

You can also set the default value:
```swift
    @UserDefaultWrapper(key: "someProperty", defaultValue: "someDefaultStringValue")
    public static var someProperty: String?
```

## Requirements

iOS 9+. Swift 3.0.

## Installation

UserDefaultsPropertyWrapper is available through CocoaPods. To install it, simply add the following line to your Podfile:
```ruby
pod "UserDefaultsPropertyWrapper"
```
UserDefaultsPropertyWrapper is available through Carthage. To install it, simply add the following line to your Cartfile:
```ruby
github "idapgroup/UserDefaultsPropertyWrapper"
```
## License

UserDefaultsPropertyWrapper is available under the New BSD license. See the LICENSE file for more info.
