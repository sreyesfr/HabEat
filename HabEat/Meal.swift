//
//  Meal.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 11/21/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

struct Meal {
    let dish_id: Int
    let user_id: Int
    let mealOfDay: String
    let time: Int // Not actually going to be an int, probably some other thing, maybe a float
    let date: NSDate // Wee can definitely add a nice extension to NSDate
}
