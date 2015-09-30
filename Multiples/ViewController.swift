//
//  ViewController.swift
//  Multiples
//
//  Created by Peter Lada on 9/28/15.
//  Copyright © 2015 Peter Lada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    var total: Int = 0
    var tapsLeft: Int = 0

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var numberTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var additionLbl: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    @IBAction func doPlay(sender: UIButton) {
        if numberTxt.text != nil && numberTxt.text != "" {
            number = Int(numberTxt.text!)!
            additionLbl.text = "Press Add to Add \(number)"
            showPlay()
            tapsLeft = 8
            total = 0
        }
    }
    
    @IBAction func doAdd(sender: AnyObject) {
        tapsLeft--
        checkIfFinished()
    }
    
    func showPlay(inverse: Bool = false) {
        logoImg.hidden = !inverse
        playBtn.hidden = !inverse
        numberTxt.hidden = !inverse
        
        addBtn.hidden = inverse
        additionLbl.hidden = inverse
    }
    
    func checkIfFinished() {
        if tapsLeft > 0 {
            additionLbl.text = "\(total) + \(number) = \(total + number)"
            total += number
        } else {
            numberTxt.text = ""
            showPlay(true)
        }
    }
    
}

