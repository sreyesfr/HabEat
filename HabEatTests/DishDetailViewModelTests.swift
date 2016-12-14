//
//  DishDetailViewModelTests.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 12/14/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import XCTest
@testable import HabEat

class FoodViewModelTests: XCTestCase {
    func test_title() {
        let dish = Dish(id: 1, rest_id : 1, name: "Two Egg and Cheddar Sandwich", calories: 450, fat: 16, cholesterol: 345, sodium: 620, carbs: 51, vegetarian: true, vegan: false, gluten_free: false, img: "twoEggAndCheddar")
        let viewModel = FoodViewModel(dish: dish)
        XCTAssertEqual("Two Egg and Cheddar Sandwich", viewModel.title())
    }
    
    func test_getPercentDailyAverage() {
        let dish = Dish(id: 1, rest_id : 1, name: "Two Egg and Cheddar Sandwich", calories: 450, fat: 16, cholesterol: 345, sodium: 620, carbs: 51, vegetarian: true, vegan: false, gluten_free: false, img: "twoEggAndCheddar")
        let dish2 =  Dish(id: 3, rest_id: 1, name: "Vegetarian Deluxe Salad", calories: 270, fat: 13, cholesterol: 25, sodium: 720, carbs: 29, vegetarian: true, vegan: false, gluten_free: true, img: "veggieSalad")
        let viewModel = FoodViewModel(dish:dish)
        let viewModel2 = FoodViewModel(dish: dish2)
        XCTAssertEqual(Int(viewModel.getPercentDailyAverage()), 40)
        XCTAssertEqual(Int(viewModel2.getPercentDailyAverage()), 16)
    }
    
    func test_getHabEatIndex(){
        let dish = Dish(id: 1, rest_id : 1, name: "Two Egg and Cheddar Sandwich", calories: 450, fat: 16, cholesterol: 345, sodium: 620, carbs: 51, vegetarian: true, vegan: false, gluten_free: false, img: "twoEggAndCheddar")
        let viewModel = FoodViewModel(dish: dish)
        XCTAssertEqual(viewModel.getHabEatIndex(), 4)
    }
    
    func test_getBackgroundColor(){
        let dish = Dish(id: 1, rest_id : 1, name: "Two Egg and Cheddar Sandwich", calories: 450, fat: 16, cholesterol: 345, sodium: 620, carbs: 51, vegetarian: true, vegan: false, gluten_free: false, img: "twoEggAndCheddar")
        let viewModel = FoodViewModel(dish: dish)
        XCTAssertEqual(viewModel.getBackgroundColor(), UIColor(red: 0.949, green: 0.4745, blue: 0, alpha: 1.0))
    }
    
    
}
