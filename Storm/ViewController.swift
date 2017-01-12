//
//  ViewController.swift
//  Storm
//
//  Created by Kiwami on 2016/11/03.
//  Copyright © 2016年 Kiwami. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var number:Int = 0
    //値段の配列（文字）
    var priceStringArray : [String] = ["2200", "600","800","600","2300","2800"]
    //値段の配列（数字）
    var priceNumArray : [Int] = [2200,600,800,600,2300,2800]
    //グッズの個数
    var countNumArray : [Int] = [0,0,0,0,0,0]
    //合計の値段
    var resultNumArray : [Int] = [0,0,0,0,0,0]
    
    @IBOutlet var label : UILabel!
    @IBOutlet var label2 : UILabel!
    @IBOutlet var label3 : UILabel!
    @IBOutlet var label4 : UILabel!
    @IBOutlet var label5 : UILabel!
    @IBOutlet var label6 : UILabel!
    @IBOutlet var textfield : UITextField!
    @IBOutlet var resultlabel : UILabel!
    @IBOutlet var pickerview : UIPickerView!
    @IBOutlet var pickerview5 : UIPickerView!
    @IBOutlet var pickerview6 : UIPickerView!
    
    var labelArray: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // textfield.delegate = self
        pickerview.delegate = self
        pickerview.dataSource = self
        pickerview5.delegate = self
        pickerview5.dataSource = self
        pickerview6.delegate = self
        pickerview6.dataSource = self
        
        labelArray = [label, label2,label3,label4,label5,label6]
        
    }
    
    @IBAction func uchiwa (button:UIButton) {
        
        var uchiwaCount: Int = Int(button.currentTitle!)!
        
        uchiwaCount = uchiwaCount + 1
        
        button.setTitle(String(uchiwaCount), for: .normal)
        
        countNumArray[1] = countNumArray[1] + 1
        
        
        for i in 0..<6 {
            priceNumArray[i] = Int(labelArray[i].text!)!
            resultNumArray[i] = priceNumArray[i] * countNumArray[i]
        }
        
        resultlabel.text = String(resultNumArray[0] + resultNumArray[1] + resultNumArray[2] + resultNumArray[3] + resultNumArray[4] + resultNumArray[5] ) + "円"
        
        
    }
  
    @IBAction func posuta (button:UIButton) {
            
        var posutaCount : Int = Int(button.currentTitle!)!
            
            posutaCount = posutaCount + 1
        
        button.setTitle(String(posutaCount), for:.normal )
        
        countNumArray[2] = countNumArray[2] + 1
        
        
        for i in 0..<6 {
            priceNumArray[i] = Int(labelArray[i].text!)!
            resultNumArray[i] = priceNumArray[i] * countNumArray[i]
        }
        
        resultlabel.text = String(resultNumArray[0] + resultNumArray[1] + resultNumArray[2] + resultNumArray[3] + resultNumArray[4] + resultNumArray[5] ) + "円"
        
    }
        
    @IBAction func file (button:UIButton) {
        
        var fileCount : Int = Int(button.currentTitle!)!
        
        fileCount = fileCount + 1
        
        button.setTitle(String(fileCount), for: .normal)
        
        countNumArray[3] = countNumArray[3] + 1
        
        for i in 0..<6 {
            priceNumArray[i] = Int(labelArray[i].text!)!
            resultNumArray[i] = priceNumArray[i] * countNumArray[i]
        }
        
        resultlabel.text = String(resultNumArray[0] + resultNumArray[1] + resultNumArray[2] + resultNumArray[3] + resultNumArray[4] + resultNumArray[5] ) + "円"
        
             }
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 30
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(row) + "個"
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        countNumArray[pickerView.tag-1] = row
        
        
        for i in 0..<6 {
            priceNumArray[i] = Int(labelArray[i].text!)!
            resultNumArray[i] = priceNumArray[i] * countNumArray[i]
        }
        
        resultlabel.text = String(resultNumArray[0] + resultNumArray[1] + resultNumArray[2] + resultNumArray[3] + resultNumArray[4] + resultNumArray[5] ) + "円"
        
        print(row)
        
    }
    
    
}
