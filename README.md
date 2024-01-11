# Animated GIF


https://github.com/Doris-WenZiYing/AnimatedGIF/assets/95731223/bac1810e-6875-40aa-ba08-89df103caca4


### How to display gif in SwiftUI?
In SwiftUI, gif is not supported in Image View, if you try `Image(”your_gif_name”)`, it’ll only show a blank page. There are many ways to do it, like using <font color="#f00">`CGAnimateImageDataWithBloc`</font>, separating your gif into series of image and use <font color="#f00">`animatedImage`</font> to play those pictures and so on, but I found out that you can also use <font color="#f00">`WKWebView`</font> (in WebKit) to accomplish it. So let’s get started. 👍 

## Create a new SwiftUI View and add your gif file into folders
<img width="350" height="250" alt="pic1" src="https://github.com/Doris-WenZiYing/AnimatedGIF/assets/95731223/1bc07a5e-b089-461b-882c-dc016bbb0b9c">
<img width="350" height="250" alt="pic2" src="https://github.com/Doris-WenZiYing/AnimatedGIF/assets/95731223/1334e010-ef1b-44c2-b660-b9e42e9ab585">

## Create a new WKWebView

When you use <font color="#f00">`UIViewRepresentable`</font> , make sure you create <font color="#f00">`makeUIView`</font> and <font color="#f00">`updateUIVew`</font> as well.

```swift
// Remember to import WebKit
import WebKit

struct GifImage: UIViewRepresentable {
	func makeUIView(context: Context) -> some WKWebView {
	// Make a new webview
	    let webView = WKWebView()
			return webView
	}
	// Send data from SwiftUI to UIView
	func updateUIView(_ uiView: UIViewType, context: Context) {
		
	}
}
```

## Setup URL

We need to set up a URL to read our content.

```swift
// Bundle is similar to folders
// Bundle.main.url gives access to the resources inside the file of the application
let url = Bundle.main.url(forResource: name, withExtension: "gif")!
```

URL needs to be not optional. Use force wrapping(!) to cope with it, it's good to use force here because we are sure that the gif will be in our app.

:::info
When you use force, make sure that you are sure your data will be in your app, if not then don't use force
:::



In this case, we want to read delete.gif, so the resource will be "delete". However, we want to use any gif, so we need to initialize a name.

```swift
// Initialize a name
init(_ name: String){
    self.name = name
}
```

## Get URL data

Now we need to extract information from the URL, so we will need to create a data object.

```swift
let data = try! Data(contentsOf: url)
```

## Load webView

Load resource into webview. 

```swift
webView.load(
    data, // Provide data object
    mimeType: "image/gif", // Mimetype is a label to identify a type of data
    characterEncodingName: "UTF-8",
		// DeletingLastPath -> Delete the last part
    baseURL: url.deletingLastPathComponent()
)
```
