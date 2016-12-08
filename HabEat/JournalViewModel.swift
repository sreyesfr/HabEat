//
//  JournalViewModel.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 12/4/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation

class JournalViewModel {
    
    func foodViewModelForRowAtIndexPath(indexPath: NSIndexPath) -> FoodViewModel {
        let mealsReverse = meals.reverse() as Array
        let myMeal = mealsReverse[indexPath.row].valueForKey("name") as! String
        let myDish = allDishes.filter({$0.name == myMeal}).first
        return FoodViewModel(dish: myDish!)
    }

}