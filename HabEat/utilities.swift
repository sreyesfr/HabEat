//
//  utilities.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 12/3/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}