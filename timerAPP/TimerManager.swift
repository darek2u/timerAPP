//
//  TimerManager.swift
//  timerAPP
//
//  Created by Dariusz Urbanczyk on 30/01/2020.
//  Copyright © 2020 Dariusz Urbanczyk. All rights reserved.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLenght")
    
    var timer = Timer()
    
    func start() {
        timerMode = .running
    
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
        if self.secondsLeft == 0 {
            self.reset()
        }
        self.secondsLeft -= 1
    })
    }
    func reset() {
        self.timerMode = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
    func setTimerLenght(minutes: Int) {
        let defaults = UserDefaults.standard
        defaults.set(minutes, forKey: "timerLenght")
        secondsLeft = minutes
    }
    
}
