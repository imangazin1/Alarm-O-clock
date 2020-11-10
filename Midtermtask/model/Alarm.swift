//
//  Alarm.swift
//  Midtermtask
//
//  Created by Магжан Имангазин on 10/16/20.
//  Copyright © 2020 Akzhol Imangazin. All rights reserved.
//

import Foundation
import UIKit

class Alarm {
    var timesString: String?
    var notesString: String?
    var isSwitched: Bool?
    
    init(timesString: String, notesString: String, isSwitched: Bool) {
        self.timesString = timesString
        self.notesString = notesString
        self.isSwitched = isSwitched
    }
}
