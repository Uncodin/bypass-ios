# Bypass

Bypass is a markdown library that can directly render markdown as stylized text
in a `UIView`. It features nicely styled text, tappable links, and a smooth
crossfade between representations for different device orientations.

There is also an [Android version](https://github.com/Uncodin/bypass-android)
of this library, that shares the [same core](http://gitub.com/Uncodin/bypass-core).

## Requirements

Bypass requires iOS version 6.0 or greater.

## Usage

Choose from either CocoaPods inclusion or git submodule inclusion for integrating
Bypass into your project.

### CocoaPods

Assuming you have CocoaPods installed, you can start using Bypass by doing the following:

* Create your Xcode project
* Add a `Podfile` that references `Bypass` alongside your Xcode project with the following content:

```ruby
platform :ios, '6.0'
pod 'Bypass', '~> 1.0.1'
```

* Issue `pod install` on the command line from the root project directory
* Start development by using the generated workspace in Xcode

#### References

* [CocoaPods: Integrating a Project](http://docs.cocoapods.org/guides/integrating_a_project.html)
* [CocoaPods: Podfile](http://docs.cocoapods.org/podfile.html)

### Git Submodules

* Create your Xcode project and [initialize your git repository](http://gitref.org/creating/).
* Assuming you have a directory named `Libraries`, issue the command `git submodule add git@github.com:Uncodin/bypass-ios.git Libraries/Bypass`
* Issue the command `git submodule update --init --recursive`
* Open your Xcode project and drag the `Libraries/Bypass/Bypass.xcodeproj` into your project by dropping it into the Project Navigator
* Navigate to your project's Build Settings
  * Add `-ObjC` to `Other Linker Flags`
* Navigate to your project's Build Phases
  * Add `Bypass` as a target dependency
  * In the same tab, add `QuartzCore.framework`, `CoreText.framework`, and `libBypass.a` to the list of libraries to link against.

## Usage

Bypass is very easy to use. An example usage follows:

```objc
CGRect markdownRect = CGRectMake(0.f, 0.f, 100.f, 100.f);
BPMarkdownView *markdownView = [[BPMarkdownView alloc] initWithFrame:markdownRect];

NSString *markdown = @"# Hello, world!"
                      ""
                      "This is my text body. There are many like it,	 "
                      "but this one is mine.";

[markdownView setMarkdown:markdown];
[[self view] addSubview:markdownView];
```

Feel free to directly embed a `BPMarkdownView` in a Nib or Storyboard, but
ensure that you have configured your **Other Linker Flags** to contain `-ObjC`
if you do this.