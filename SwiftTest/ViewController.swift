//
//  ViewController.swift
//  SwiftTest
//
//  Created by Clhwa on 17/9/1.
//  Copyright © 2017年 liaozq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var name: String?

    
//    override var name:String

    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 100
        counter = 200
        str = ""
        let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
        print("最小值为 \(bounds.min) ，最大值为 \(bounds.max)")
        
        
        //1.创建NSBlockOperation对象
        let operation = BlockOperation { () -> Void in
            NSLog("%@", Thread.current)
        }
        
        //2.添加多个Block
        for i in 0..<5 {
            operation.addExecutionBlock { () -> Void in
                NSLog("第%ld次 - %@", i, Thread.current)
            }
        }
        
        //2.开始任务
        operation.start()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func setNeedsFocusUpdate() {
        super.setNeedsFocusUpdate()
    }

    var counter: Int = 0{
        willSet(newTotal){
            print("计数器: \(newTotal)")
        }
        didSet{
            if counter > oldValue {
                print("新增数 \(counter - oldValue)")
            }
        }
    }
    
    var str: String = ""{
        
        willSet(newTotal){
            print("str: \(newTotal)")
        }
        didSet{
            if str.isEmpty {
                str = "dfsasd"
            }
        }
    }
    
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
  
    
}
