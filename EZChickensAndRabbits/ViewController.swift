//
//  ViewController.swift
//  EZChickensAndRabbits
//
//  Created by Leo on 2017/2/10.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var totalFeetsTextField: UITextField!
    
    @IBOutlet weak var msgLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnDidClick(_ sender: UIButton) {
        // Hidden keyboard
        view.endEditing(true)
        
        let totalFeetsStr:String = totalFeetsTextField.text!
        let totalStr:String = totalTextField.text!
        
        // Error input
        guard let totalFeets:Int = Int(totalFeetsStr),
              let total:Int = Int(totalStr)
        else
        {
            msgLabel.text = "請輸入正確的數字。"
            return
        }
        
        // Error input
        if totalFeets % 2 == 1 {
            msgLabel.text = "賣ㄍㄟˋ噢！多出來的那一隻腳是你的嗎？！"
            return
        }
        else if totalFeets / 4 > total {
            msgLabel.text = "我書讀的少，你不要騙我！"
            return
        }
        
        var chickens:Int = 0
        var rabbits:Int = 0
        
        if totalFeets % 4 == 0, totalFeets / 4 == total {
            rabbits = total
        }
        else if totalFeets % 2 == 0, totalFeets / 2 == total {
            chickens = total
        }
        else {
            // x + y = 35
            // x = 35 - y
            // 2x + 4y = 94
            // 2(35 - y) + 4y = 94
            // 70 - 2y + 4y = 94
            // y = 94 - 70 / 2
            if totalFeets / 4 < total {
                rabbits = (totalFeets - (2 * total)) / 2
                chickens = total - rabbits
            }
        }
        
        msgLabel.text = "總共有\(chickens)隻🐔，\(rabbits)隻🐰"
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

