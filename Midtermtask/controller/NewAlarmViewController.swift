//
//  NewAlarmViewController.swift
//  Midtermtask
//
//  Created by Магжан Имангазин on 10/16/20.
//  Copyright © 2020 Akzhol Imangazin. All rights reserved.
//

import UIKit

class NewAlarmViewController: UIViewController {
    
    var timesString: String?
    var notesString: String?
    var myProtocol: AddAlarm?
    @IBOutlet weak var myPicker: UIDatePicker!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "New Alarm"
        myTextField.text = notesString
        myTextField.delegate = self
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        let times = myPicker.calendar.dateComponents([.hour, .minute], from: myPicker.date)
        var hour = ""
        var minute = ""
        if times.hour! < 10 {
            hour = "0\(times.hour!)"
        }
        if times.hour! >= 10 {
            hour = "\(times.hour!)"
        }
        if times.minute! < 10 {
            minute = "0\(times.minute!)"
        }
        if times.minute! >= 10 {
            minute = "\(times.minute!)"
        }
        let timesString = "\(hour) : \(minute)"
        myProtocol?.addAlarm(timesString: timesString, notesString: myTextField.text!, isSwitched: false)        
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension NewAlarmViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
