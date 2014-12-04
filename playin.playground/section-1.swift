// Playground - noun: a place where people can play

import UIKit

class bullshitView: UIView {
    func bullshit(){
        println("GOOD MORNIN")
    }
}

var str = "Hello, playground"
var imgURL = NSURL(string: "http://i46.tinypic.com/4sckqu.jpg")
var imgData = NSData(contentsOfURL: imgURL)
var img = UIImage(data: imgData)
var button = UIButton(frame: CGRectMake(0.0, 0.0, 500, 500))
button.setImage (img, forState: .Normal)
var view = bullshitView(frame: CGRectMake(0.0, 0.0, 700, 700))
button.addTarget(view, action:"bullshit:", forControlEvents: UIControlEvents.TouchUpInside)
view.addSubview(button)

