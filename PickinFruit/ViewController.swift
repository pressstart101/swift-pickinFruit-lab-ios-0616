//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerViewLabel: UIPickerView!

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    var numberOfRows = 1000
    var numberOfComponents = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerViewLabel.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        self.pickerViewLabel.delegate = self
        self.pickerViewLabel.dataSource = self
        
        for i in 0..<self.numberOfComponents {
        let randomNumber = arc4random_uniform(UInt32(numberOfRows))
        self.pickerViewLabel.selectRow(Int(randomNumber), inComponent: i, animated: true)
        }
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        self.chooseFruit()
        
    }
    
    
    func chooseFruit(){
        for i in 0..<numberOfComponents{
            let randomNumber = arc4random_uniform(UInt32(numberOfRows))
        pickerViewLabel.selectRow(Int(randomNumber), inComponent: i, animated: true)
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfRows
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return numberOfComponents
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.fruitsArray[row % self.fruitsArray.count]
    }
    
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



