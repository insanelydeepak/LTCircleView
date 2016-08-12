//
//  ViewController.swift
//  LTCircleView
//
//  Created by leo on 16/8/12.
//  Copyright © 2016年 io.ltebean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleView: LTCircleView!
    var items = ["1"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        circleView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        circleView.reloadData()
    }


    @IBAction func buttonAddPressed(sender: AnyObject) {
        let index = items.count
        items.insert("t", atIndex: index)
        circleView.insertItemAtIndex(index)
    }

    @IBAction func buttonRemovePressed(sender: AnyObject) {
        let index = 2
        items.removeAtIndex(index)
        circleView.removeItemAtIndex(index)

    }
}

extension ViewController: LTCircleViewDataSource {
    
    func numberOfItemsInCircleView(circleView: LTCircleView) -> Int {
        return items.count
    }
    
    func viewAtIndex(index: Int, inCircleView circleView: LTCircleView) -> UIView {
        let label = UILabel(frame: CGRectZero)
        label.frame.size = CGSize(width: 30, height: 30)
        label.backgroundColor = UIColor.redColor()
        label.textAlignment = .Center
        label.text = items[index]
        return label
    }
}

