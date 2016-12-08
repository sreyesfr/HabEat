//
//  FavoritesViewModel.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 12/8/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation

class FavoritesViewModel {
    func foodViewModelForRowAtIndexPath(indexPath: NSIndexPath) -> FoodViewModel {
        let favoritesReverse = favorites.reverse() as Array
        let myFavorite = favoritesReverse[indexPath.row].valueForKey("name") as! String
        let myDish = allDishes.filter({$0.name == myFavorite}).first
        return FoodViewModel(dish: myDish!)
    }

}