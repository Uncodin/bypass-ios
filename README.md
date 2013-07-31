# Bypass

Bypass is a markdown rendering library that can directly render markdown as
stylized text to a `UIView`. The Bypass git repository also contains an Android
project that accomplish the same task. In the git repo, there is also code that
handles markdown parsing and representing that markdown as a tree structure,
similar to the HTML DOM. This code is shared between both platforms.

Bypass is very easy to use. Ultimately, you will end up creating a
`BPMarkdownView`, supplying that view with markdown as an `NSString`, and then
displaying it like you would any other view in your heirarchy. `BPMarkdownView`
descends from `UIScrollView`, so you can supply large bodies of markdown.

It features nicely stylized text for typical usage, tappable links, and a smooth
crossfade between representations for different device orientations.

## Requirements

Bypass requires iOS version 6.0 or greater.

## Setup

TODO

## Usage

Bypass is very easy to use in terms of displaying markdown. Essentially, you
directly instantiate a `BPMarkdownView` and supply it with markdown to render.
It handles the rest. An example would be:

```objc
// Initialize the markdown view
CGRect markdownRect = CGRectMake(0.f, 0.f, 100.f, 100.f);
BPMarkdownView *markdownView = [[BPMarkdownView alloc] initWithFrame:markdownRect];

// Obtain some markdown
NSString *markdown = @""
    "# Hello, world!"
    ""
    "This is my text body. There are many like it, "
    "but this one is mine.";

// Supply the markdown view with markdown to render
[markdownView setMarkdown:markdown];

// Add the markdown view to a superview
[[self view] addSubview:markdownView];
```

Feel free to directly embed a `BPMarkdownView` in a Nib or Storyboard, but
ensure that you have configured your **Other Linker Flags** to contain `-ObjC`
if you do this.