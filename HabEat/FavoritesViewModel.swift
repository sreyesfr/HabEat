//
//  FavoritesViewModel.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 12/8/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation

class FavoritesViewModel {
    
    func restaurantForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        let favoritesReverse = favorites.reversed() as Array
        let myFavorite = favoritesReverse[indexPath.row].value(forKey: "name") as! String
        let myDish = allDishes.filter({$0.name == myFavorite}).first
        let myRestaurant = allRestaurants.filter({$0.id == (myDish?.rest_id)!}).first?.name
        return myRestaurant!
    }
    
    func foodViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> FoodViewModel {
        let favoritesReverse = favorites.reversed() as Array
        let myFavorite = favoritesReverse[indexPath.row].value(forKey: "name") as! String
        let myDish = allDishes.filter({$0.name == myFavorite}).first
        return FoodViewModel(dish: myDish!)
    }

}
