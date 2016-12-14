//
//  RestaurantsViewModel.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco and Connor Hanley on 11/21/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation

class RestaurantsViewModel {
    let radius : Double = 3000.0
    let location : Location = Location()
    var restaurants = [Restaurant]()
    
    func numberOfRows() -> Int {
        return restaurants.count
    }
    
    func titleForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        if indexPath.row < numberOfRows(){
            return restaurants[indexPath.row].name
        } else {
            return ""
        }
    }
    func foodMenuViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> FoodMenuViewModel {
        return FoodMenuViewModel(restaurant: restaurants[indexPath.row]) // Add in an input for the food items
    }
    
    func distanceForRowAtIndexPath(_ indexPath: IndexPath) -> String{
        let distance = restaurants[indexPath.row].location.distance(from: location.cllocation)
        let miles = distance/1609.344
        let intDist = Int(miles)
        let stringDec = String(miles-Double(intDist))
        
        let startIndex = stringDec.index(stringDec.startIndex, offsetBy: 1)
        let endIndex = stringDec.index(stringDec.startIndex, offsetBy: 3)
        
        let finalDecString = stringDec[startIndex...endIndex]
        
        let stringResult = String(intDist) + finalDecString
        
        return stringResult + " mi"
    }
    
    func refresh(_ completion: () -> Void) {
        location.getCurrentLocation()
        let result = allRestaurants.filter({$0.location.distance(from: location.cllocation) < self.radius})
        self.restaurants = result.sorted(by: { $0.location.distance(from: location.cllocation) < $1.location.distance(from: location.cllocation) })
        completion()
    }
}
