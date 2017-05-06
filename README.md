
# Playground Driven Development example
This example demonstrates how to use your entire xcode project in a playground. You can quickly preview/prototype/build/change things (especially UI). 

With this workflow you can have the advantage of storyboards while having the UI in code.

Inspired from [Kickstarter's](https://github.com/kickstarter/ios-oss) Playgrounds usage.

This example uses Cocoapods for dependency management, but you can use your preferred solution as well, the aproach is similar.

**Table of contents:**

- [Steps to add playground support to your project](#steps-to-add-playground-support-to-your-project)
- [Steps to try the example project out](#steps-to-try-the-example-project-out)
- [Workflows](#workflows)
- [Handling dependency issues](#handling-dependency-issues)
- [Tips and tricks](#tips-and-tricks)
- [Known issues](#known-issues)
- [Troubleshooting](#troubleshooting)

## Steps to add playground support to your project:

- create a playground in you project
- create a dynamic framework target
- declare it in the `Podfile`, add all the dependencies that you have on your other target(s)
- `pod install`
- add your classes to the framework target (View > Utilities > Show File Inspector, under Target Membership check your framework target)
- build the framework target with SIMULATOR
- import framework in playground: `@testable import MyProjectFramework`
   
   `@testable` make internal classes and members `open`

## Steps to try the example project out

- clone the repo
- open `playground-driven-development.xcworkspace`
- select `projectFramework` scheme and build it
- select `playground` from the file navigator
- open Assistant editor
- wait a little
- you should see some colored views, one of them moving

### So what did I just see?

- usage of a class in playgrounds that's in your project (without copying it in the playground)
- usage of a pod library ([Dance](https://github.com/saoudrizwan/Dance)) that's a dependency of your project

## Workflows
- new UI:
  - create your UI in playground
  - when you're satisfied with the results, add it to the project
- existing UI needs update. You could modify your project files and build the project framework, but this is much slower. Instead:
  - copy the affected code in the playground (modify the class names to avoid duplicate symbols)
  - when you're satisfied with the results, overwrite the project's code with that of the playgrounds

## Handling dependency issues

## Tips and tricks

- playground likes to run all the time, even if you stop it, it restarts after a short while. To stop it for real, long click on the play/stop button, and select `Manually Run`.
- if you want to use custom fonts, you need to do this before:
   ```
   // fonts are under Resources/fonts
   var fontUrl = Bundle.main.url(forResource: "MyCustmFontName", withExtension: "ttf", subdirectory: "fonts")
   CTFontManagerRegisterFontsForURL(fontUrl as! CFURL, CTFontManagerScope.process, nil)
   ```
 
## Known issues

- PDF vector images are not working
- there's no `self` in the playground's "root", so if you want to implement a target-action or delegate pattern here (not inside a class), create an object that will be the `target` or the `delegate` instead of `self`. You also need to assign it to a local variable, and then use it:
   ```
   let chartView = ChartView()
   let delegate = ChartDelegate() // doesn’t work if assigned directly
   chart.delegate = delegate
   ```

## Troubleshooting

Unfortunately playgrounds is still flaky (it's xcode after all), where many times it just doesn't work and you have no idea why.

#### If the playground doesn’t work

When the panel on the right of the editor doesn't show anything or text is greyed out
- stop it and run it again
- restart xcode (the whole app (`cmd-q`) not just the windows)
- make sure simulator isn’t open

#### If live view isn't showing

- try the things from the previous section
- close and reopen assistant editor
- close assistant editor, stop/start playground, open assistant editor
- make sure to set the view’s frame before assigning it to `liveView`
