# Marvel App

## Developer Prerequisites

### macOS High Sierra

10.13.4 (17E202)

### Xcode

Xcode Version  9.4.1 (9F2000)

### Swift

Apple Swift version 4.1.2 (swiftlang-902.0.54 clang-902.0.39.2)

### Deployment Target 

iOS 10.0

## TEST COVERAGE

84% of the classes are tested, including all the resources, services, view models, routers and view controllers.
There are also http mock tests done my mocking the URLProtocol of URLSessionConfiguration 
(You can find more about this specific http mocking technique on 2018 WWDC video).

## ImageLoader

Image loader has a simple caching abilty on memory only with maximum cache limit of 50.

## App Architecture

**MVVM** with Routers and layered service architecture. Dependency injection with Component creator for services and routers.

Main components of MVVM with Routers and Services architecture are

• Router - Navigation

• ViewController - Views

• ViewModel - Model for view controller/Views

• ComponentCreator - Dependency injection for view model, services, routers

• Service - Handle business logic, make api request, read write to disk

• Remote  - Makes api request, convert response into different types

• Dao  -  protocol or class for reading, writing from local storage (if needed)

• Request - api request that has the http request,response and resource 

• Response - it holds the success logic for the request

• Resource - equivalent dto of json object


## MarvelApp Drilldown of the classes

**• App**

- MarvelApp 

- MarvelAppRouter


**• MarvelCharacter**

- MarvelCharactersRouter

- MarvelCharactersViewController

- MarvelCharactersViewModel

- MarvelCharacterService

- MarvelCharacterRemote

- MarvelCharactersRequest

- MarvelCharactersResource

- MarvelCharacterResource

- MarvelCharacterCellRepresentable

- MarvelCharacterViewModelDelegate


**• MarvelCharacterDetail**

- MarvelCharacterDetailRouter

- MarvelCharacterDetailViewController

- MarvelCharacterDetailViewModel

- MarvelCharacterDetailRepresentable



