//
//  Helper.swift
//  timerAPP
//
//  Created by Dariusz Urbanczyk on 30/01/2020.
//  Copyright © 2020 Dariusz Urbanczyk. All rights reserved.
//

import Foundation

enum TimerMode {
    case running
    case paused
    case initial
}
func secondsToMinutesAndSeconds (seconds : Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    return "\(minuteStamp): \(secondStamp)"
}
