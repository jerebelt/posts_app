# Posts App

A Flutter demo project.

This app is aimed to run it on Android and iOS.
## Installation

```bash
flutter pub get
flutter run
```

It follow the Clean Architechture design pattern with a MVVM architechture, implementing Bloc as state management.


## Packages ##

It uses the next packages:
- go_router: for the internal ap navigation
- get_it: for injecting dependencies
- flutter_bloc: app state management
- dio: http requests
- dartz: functional programming
- equatable: comparing obejects with properties

Project structure:
- src : whole project
 - core : the keys utilities to the projects, like the router, networking, services, utils, etc.
 - features: the main features of the app would live here, divided by layers
    - presentation: the classes and widget with the resopnsability of show the user the information and give them the interaction
    - data: the external or internal data sources such as databases, network services, repositories or even local memory
    - dominion: the bussiness logic process belongs here, with the respective use cases
 - shared: it works like the features layer folder but for feature shared accross the whole ap
