//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

@testable import projectFramework

import Dance

// Open Assistant Editor for live view. View > Assistant Editor > Show Assistant Editor

var str = "Hello, playground"

// class from project
let view = RedView()
view.frame = CGRect(x: 0, y: 0, width: 300, height: 200)

let view2 = UIView()
view2.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
view2.backgroundColor = UIColor.red
view.addSubview(view2)

// usage of a pod
view2.dance.animate(duration: 2.0, curve: .easeInOut) {
        $0.transform = CGAffineTransform(scaleX: 2, y: 2)
        $0.center = view.center
        $0.backgroundColor = .blue
    }.addCompletion { _ in
        view2.backgroundColor = .yellow
    }.start(after: 0.5)



// make sure to set the view's frame before assigning it to liveView
PlaygroundPage.current.liveView = view
