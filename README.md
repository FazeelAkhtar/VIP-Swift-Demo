# VIP-Swift-Demo

Idea is to show how i will use a better iOS pattern to solve  problem in as less time as possible.
Code is done using Clean Swift architecture and TDD

Clean Swift (a.k.a VIP) is Uncle Bob’s Clean Architecture applied to iOS and Mac projects.

### Controller:
This is the normal controller that Apple give us, but it has all setup ready to make the communication with the other layers. This component is in charge of connecting the UI with the code, I need to stress out how important is to say that it must not have complex logic.

### Interactor:
This component handles all the logic decisions, serving as bridge between communications, it receives the action to make a login but it does not contain the logic. His function is to know who’s in charge of doing the login process.
Worker: This component is the helper of the Interactor, in the login case the worker must know how to make the login and it should return an answer to the interactor with the result of the operation.

### Presenter:
This is a presentation layer, it should parse all the data to the controller in the correct format. For example if we have an app that presents Dates, usually the logic’s format is implemented in the controller or helpers (in the best case), but with this architecture the rules change. The presenter should receive a NSDate and make the format, then it should send to the controller as a string, with that information the controller only needs to do something like this: dateLabel.text = Presenter.date. In summary, this layer spares the controller to make all the necessary logic to present data to the user.

### Models: 
This is the channel to pass the messages between the layers. The cycle is the following, the controller makes the request, the interactor process the request and sends a response to the presenter which processes the response and sends a view model to the controller, in this case the controller only needs to show the information contained in the view model. Well all of this is posible with the Model, it is in charge to keep the communication between layers.

### Router:
This layer is in charge of the navigation of the scene. All tasks related with navigation should be here.
Configurator: This component is in charge to keep all the Clean Swift cycle in the scene. Most of the time you will not need to work on this class. As it’s name says, is the configurator of the scene that makes the entire flow to work correctly.

Detail links :|
https://hackernoon.com/introducing-clean-swift-architecture-vip-770a639ad7bf


## Requirements

- Xcode 9.0+
- iOS 10.0+


## Dependency libs/Pods :

- pod 'Alamofire'
- pod 'Kingfisher'
- pod 'Cartography'
- pod 'RealmSwift'
   


