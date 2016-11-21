//
//  RestaurantsViewModel.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 11/21/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation

class RestaurantsViewModel {
    var restaurants = [Restaurant]()
    
    // Note: Even if we fake our data we still want to simulate a local area search
    let client = SearchRestaurantsClient()
    let parser = RestaurantsParser()
    
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
    func detailViewModelForRowAtIndexPath(indexPath: NSIndexPath) -> FoodMenuViewModel {
        return FoodMenuViewModel(restaurant: restaurants[indexPath.row])
    }
    
    func refresh(completion: () -> Void) {
        client.fetchRestaurants { [unowned self] data in
            
            // we need in this block a way for the parser to get an array of restaurant
            // objects (if they exist) and then set the restaurants var in the view model to
            // those restaurant objects
            let result = self.parser.restaurantsFromSearchResponse(data)
            self.restaurants = result!
            
            completion()
        }
    }
}