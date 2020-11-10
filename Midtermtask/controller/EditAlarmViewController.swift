//
//  EditAlarmViewController.swift
//  Midtermtask
//
//  Created by Магжан Имангазин on 10/16/20.
//  Copyright © 2020 Akzhol Imangazin. All rights reserved.
//

import UIKit

class EditAlarmViewController: UIViewController {

    var timesString: String?
    var notesString: String?
    var changeProtocol: ChangeAlarm?
    var deleteProtocol: DeleteAlarm?
    var index = 0
    @IBOutlet weak var myPicker: UIDatePicker!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Change Alarm"
        myTextField.delegate = self
        myTextField.text = notesString
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        deleteProtocol?.deleteAlarm(index: index)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeAction(_ sender: UIButton) {
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
        timesString = "\(hour) : \(minute)"
        changeProtocol?.changeAlarm(timesString: timesString!, notesString: myTextField.text!, index: index)
        navigationController?.popViewController(animated: true)
    }
}

extension EditAlarmViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
