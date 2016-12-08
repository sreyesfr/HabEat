//
//  RestaurantsViewModel.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 11/21/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation

class RestaurantsViewModel {
    let radius : Double = 10
    let location : Location = Location()
    var restaurants = [Restaurant]()
    
    func numberOfRows() -> Int {
        return restaurants.count
    }
    
    func titleForRowAtIndexPath(indexPath: NSIndexPath) -> String {
        if indexPath.row < numberOfRows(){
            return restaurants[indexPath.row].name
        } else {
            return ""
        }
    }
    func foodMenuViewModelForRowAtIndexPath(indexPath: NSIndexPath) -> FoodMenuViewModel {
        return FoodMenuViewModel(restaurant: restaurants[indexPath.row]) // Add in an input for the food items
    }
    
    func refresh(completion: () -> Void) {
        //location.getCurrentLocation()
        //let result = allRestaurants.filter({distanceForm(Double($0.latitude), x2: location.latitude, y1: $0.longitude, y2: location.longitude) < radius})
        //self.restaurants = result
        self.restaurants = allRestaurants
        completion()
    }
    
    func distanceForm(x1: Double, x2: Double, y1: Double, y2: Double) -> Double {
        let xDist = x2-x1
        let yDist = y2-y1
        let distance = sqrt((xDist * xDist) + (yDist * yDist))
        return distance
    }
}