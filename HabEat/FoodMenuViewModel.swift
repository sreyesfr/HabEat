//
//  FoodMenuViewModel.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 11/21/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation

class FoodMenuViewModel {
    
    // your code here
    var restaurant: Restaurant
    init(restaurant: Restaurant){
        self.restaurant = restaurant
    }
    
    func title() -> String? {
        return self.restaurant.name
    }
    
}