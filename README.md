# ActivityKit-laboratory
A project to explore and experiment with ActivityKit frameworks

## Description
This project is intended for learning and practicing ActivityKit, a framework that allows live updates in the Dynamic Island and Lock Screen. Live Activities allow for real time updates of your data in a quick and glanceable manner. Live Activities are similar to widgets, except that widgets create a timeline of updates while Live Activities are updated based on new data.

It is important to have an understanding of WidgetKit and widgets design and development, as the ActivityKit framework and Live Activities have similar methods and functionality to WidgetKit and widgets. To learn about widgets, view the authors [iOS Widgets tutorial](https://github.com/ceciliahollins/ios-widgets-tutorial)

## Learning Objectives

### ActivityKit

ActivityKit is the framework that provides live updates from an app as a Live Activity on the Dynamic Island, Lock Screen, or Home Screen Banner. It has similar functionality to WidgetKit, but provides live updates of data instead of creating a static timeline. View the ActivityKit documentation [here](https://developer.apple.com/documentation/activitykit)

### Live Activity presentations

There are a variety of presentations to support for Live Activities, and each presentation has its own use cases and behaviors. Presentations include minimal, compact, expanded, and lock screen. Each presentation state is included in the project, and a description of what each presentation is intended for and its abilites are documented within the project.

### Shared App Groups

The main app and its extensions are independent of each other. The way to share data between the app and the Live Activity extension to properly receive updates is through shared app groups. an App Group allows for mulitple apps developed by the same team to access data across apps or extensions and provice communications between them. This app needs to share information about which song is currently playing, and receive updates if either the app or the extension updates the current song.

### AppIntent

App Intents allow for interactivity on widgets and Live Activities, acting as a bridge between the app and Live Activities. Each app intent represents an action that can be executed specific for the app. In this case, pushing to the next, popping back to the previous, or pausing a song. This tutorial uses app intents only for the purpose of updating Live Activites and the app, but can also be used in the future for Siri, Shortcuts, and Apple Intelligence.


### Apple Push Notification service (APNs)

APNs is used to start and update the Live Activity. ActivityKit obtains a push token from APNs, unique for each Live Activity requested. When there is an update for the Live Activity, the app sends a push request using the token to APNs. APNs then sends the new data to the device, and wake the Dynamic Island or widget to render the new UI. 

## Getting Started

### Requirements

* iOS17+

### Executing program

* Download or clone the project
* Run the project on a simulator or a device

## Help

If the project is running but the simulator or device is not showing the widget, change the scheme to directly run the target.

## Authors

Cecilia Hollins 
hollins.cecilia@gmail.com

## Version History

* 0.1
    * Initial Release
    * Basic UI functionality of the Dynamic Island
* 0.2
    * Improving app functionality
    * Improving basic UI
    * Adding data updates 
* 0.3
    * Setting up the ability for Live Activities
    * Adding detailed documentation
* 1.0
    * Repository migration

## Acknowledgments

* [Apple ActivityKit displaying live data with Live Activities](https://developer.apple.com/documentation/activitykit/displaying-live-data-with-live-activities)
