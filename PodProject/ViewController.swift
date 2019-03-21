//
//  ViewController.swift
//  PodProject
//
//  Created by goldrose on 2018/10/10.
//  Copyright © 2018年 goldrose. All rights reserved.
//

func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}
import UIKit
import FaveButton

class ViewController: UIViewController {

    var bigV: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    let colors = [
        DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
         DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
         DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
         DotColors(first: color(0xE9A966), second: color(0xF8C852)),
         DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
        /*DotColors(first: UIColor.red, second: UIColor.yellow),
        DotColors(first: UIColor.blue, second: UIColor.green),
        DotColors(first: UIColor.orange, second: UIColor.cyan),
        DotColors(first: UIColor.purple, second: UIColor.yellow),
        DotColors(first: UIColor.red, second: UIColor.yellow),
        DotColors(first: UIColor.red, second: UIColor.yellow),
        DotColors(first: UIColor.red, second: UIColor.yellow)*/
    ]
    func configUI() {
        self.view.backgroundColor = UIColor.white
        bigV = UIView.init(frame: self.view.bounds)
        self.view.addSubview(bigV)
        
        let button = FaveButton.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40), faveIconNormal: #imageLiteral(resourceName: "smile"))
        button.center = bigV.center
        bigV.addSubview(button)
        
        button.delegate = self
        
    }

}
extension ViewController: FaveButtonDelegate {
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool) {
        print("选择--->\(selected)")
    }
    func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]? {
        return colors
    }
}
