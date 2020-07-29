# TicketKit

#### TicketKit is a framework that can use as a Ticket, Coupon or any way you like
![github-small](https://i.ibb.co/tKzWdTs/Screen-Shot-2020-07-29-at-09-01-20.png)
```kotlin
import TicketKit

ticketView.enrollContentImage.image = UIImage(named: "qr")
ticketView.showEnrollImage()
```
![github-small](https://i.ibb.co/pZnR50G/Screen-Shot-2020-07-29-at-09-09-15.png )
```kotlin
import TicketKit

ticketView.enrollContentImage.image = UIImage(named: "soldout")
ticketView.showEnrollImage()
```
![github-small](https://i.ibb.co/4JJ7fYX/Screen-Shot-2020-07-29-at-09-02-58.png )
```kotlin
import TicketKit

ticketView.showPurchaseButton() # 'Default'
```
![github-small](https://i.ibb.co/THgdmkn/Screen-Shot-2020-07-29-at-09-00-16.png )
```kotlin
import TicketKit

ticketView.hideDetailView()
```

## Requirements
Swift `4.2` & `5.0`. Ready for use on iOS 11.3+

## Installation

To integrate `TicketKit` into your Xcode project using CocoaPods, specify it in your Podfile:

```bash
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
pod 'TicketKit', :git => 'https://github.com/tiskender2/TicketKit.git'
end
```
Then, run the following terminal command:
```bash
pod install
```
#### Manual

Drag `TicketKit.swift` from the `source` folder into your Xcode project.
## Usage
```kotlin
import TicketKit
@IBOutlet weak var ticketView: TicketKit!

ticketView.contentImage.image = UIImage(named: "joker")
ticketView.contentTitle.text = "Joker"
ticketView.duration.text = "2hr 2min"
ticketView.genre.text = "Drama,Action"
ticketView.rating.text = "8.5"
ticketView.price.text = "$30"
ticketView.subTitle.text = "StoryLine"
ticketView.desc.text = "desc"
```
If you want to clipped view add below code in `override func draw(_ rect: CGRect)`
```kotlin
ticketView.addClips(to: .topView, corner: [.bottom,.top]) # default no clip 
```
## Apps using this framework

If you're using this control, I'd love hearing from you! and
don't forget to `put star ★`

## Credits
TicketKit was originally created by [Tolga İskender](https://www.linkedin.com/in/tolga-iskender/)
## License
TicketKit is available under the MIT license. See the LICENSE file for more info.
