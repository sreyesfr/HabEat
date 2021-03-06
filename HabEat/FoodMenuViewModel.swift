//
//  FoodMenuViewModel.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco and Connor Hanley on 11/21/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation

class FoodMenuViewModel {
    
    var dishes : [Dish]
    var restaurant: Restaurant
    
    init(restaurant: Restaurant){
        self.restaurant = restaurant
        self.dishes = allDishes.filter({$0.rest_id == restaurant.id})
    }
    
    func title() -> String? {
        return restaurant.name
    }

    func numberOfRows() -> Int {
        return dishes.count
    }
    
    func titleForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        if indexPath.row < numberOfRows(){
            return dishes[indexPath.row].name
        } else {
            return ""
        }
    }
    
    func habEatIdxForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        if indexPath.row < numberOfRows(){
            let myDishVM = FoodViewModel(dish: dishes[indexPath.row])
            return String(Int(myDishVM.getHabEatIndex()))
        } else {
            return ""
        }
    }
    
    func foodViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> FoodViewModel {
        return FoodViewModel(dish: dishes[indexPath.row])
    }
    
    func refresh(_ completion: () -> Void) {
        let result = allDishes.filter({$0.rest_id == restaurant.id})
        self.dishes = result
        completion()
    }
}
