# Playground Driven Development example
This example demonstrates how to use your entire xcode project in a playground. You can quickly preview/prototype/build/change things (especially UI).

Inspired from [Kickstarter's](https://github.com/kickstarter/ios-oss) Playgrounds usage.

This example uses Cocoapods for dependency management, but you can use your preferred solution as well, the aproach is similar.

Steps to add playground support to your project:
- Create a playground in you project
- Create a dynamic framework target
- Declare it in the `Podfile`, add all the dependencies that you have on your other target(s)
- `pod install`
- Add your classes to the framework target (View > Utilities > Show File Inspector, under Target Membership check your framework target)
- Build the framework target with SIMULATOR
- Import framework in playground: `@testable import MyProjectFramework`

Steps to try the example project out:
- clone the repo
- open `playground-driven-development.xcworkspace`
- select `projectFramework` scheme and build it
- select `playground` from the file navigator
- open Assistant editor
- wait a little
- you should see some colored views, one of them moving

So what did I just see?
- usage of a class in playgrounds that's in your project (without copying it in the playground)
- usage of a library ([Dance](https://github.com/saoudrizwan/Dance)) that's a dependency of your project
