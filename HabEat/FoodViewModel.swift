//
//  FoodViewModel.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco and Connor Hanley on 11/30/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation
import CoreData

class FoodViewModel {
    var dish: Dish
    
    let maxCalories: Double = 2000.0
    let maxFat: Double = 65.0 // g
    let maxCholesterol: Double = 300.0 // mg
    let maxSodium: Double = 2400.0 // mg
    let maxCarbs: Double = 300.0 // g
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    func title() -> String? {
        return dish.name
    }
    
    func getPercentDailyAverage() -> Double {
         return ((dish.calories/maxCalories + dish.fat/maxFat + dish.cholesterol/maxCholesterol + dish.sodium/maxSodium + dish.carbs/maxCarbs)/5) * 100
    }
    
    func getHabEatIndex(_ percentDailyAvg: Double) -> Double {
        switch (percentDailyAvg){
        case let idx where idx < 10:
            return 10
        case let idx where idx < 20:
            return 9
        case let idx where idx < 25:
            return 8
        case let idx where idx < 30:
            return 7
        case let idx where idx < 35:
            return 6
        case let idx where idx < 40:
            return 5
        case let idx where idx < 45:
            return 4
        case let idx where idx < 50:
            return 3
        case let idx where idx < 55:
            return 2
        case let idx where idx >= 55:
            return 1
        default:
            return 999
        }
    }
    
    func getHabEatIndex() -> Double {
        return getHabEatIndex(self.getPercentDailyAverage())
    }
    
    func getBackgroundColor() -> UIColor {
        if self.getHabEatIndex() < 3 {
            return UIColor(red: 0.9569, green: 0, blue: 0, alpha: 1.0)
        } else if self.getHabEatIndex() < 5 {
            return UIColor(red: 0.949, green: 0.4745, blue: 0, alpha: 1.0)
        } else if self.getHabEatIndex() < 7 {
            return UIColor(red: 0.9765, green: 0.9765, blue: 0, alpha: 1.0)
        } else if self.getHabEatIndex() < 9 {
            return UIColor(red: 0.6941, green: 0.9686, blue: 0, alpha: 1.0)
        } else {
            return UIColor(red: 0, green: 0.9569, blue: 0.0314, alpha: 1.0)
        }
    }
    
    func addFavorite(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            favorites = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        let entity =  NSEntityDescription.entity(forEntityName: "Favorite", in:managedContext)
        let favorite = NSManagedObject(entity: entity!, insertInto: managedContext)
        
                favorite.setValue(dish.name, forKey: "name")
        favorite.setValue(dish.calories, forKey: "calories")
        
        do {
            try managedContext.save()
            favorites.append(favorite)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func removeFavorite(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            favorites = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        let favoriteToRemove = favorites.filter({String(describing: $0.value(forKey: "name")!) == dish.name}).first
        
        managedContext.delete(favoriteToRemove!)
        favorites = favorites.filter({String(describing: $0.value(forKey: "name")) != dish.name})
    }
    
    func isFavorite() -> Bool{
        let favoriteNames = favorites.map({String(describing: $0.value(forKey: "name")!)})
        return favoriteNames.contains(dish.name)
    }

}

