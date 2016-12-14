//
//  RestaurantMenuViewModeLTests.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 12/14/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation
import XCTest
import CoreLocation
@testable import HabEat

class FoodMenuViewModelTests: XCTestCase {
    
    func test_numberOfRows() {
        let dishes = [createFood(), createFood(), createFood()]
        let restaurant = Restaurant(id: 0, name: "Au Bon Pain", location: CLLocation(latitude: 40.443936, longitude: -79.942250))
        let viewModel = FoodMenuViewModel(restaurant: restaurant)
        viewModel.dishes = dishes
        
        XCTAssertEqual(viewModel.numberOfRows(), 3)
    }
    
    func test_titleForRowAtIndexPath() {
        let dish1 = Dish(id: 1, rest_id : 1, name: "Two Egg and Cheddar Sandwich", calories: 450, fat: 16, cholesterol: 345, sodium: 620, carbs: 51, vegetarian: true, vegan: false, gluten_free: false, img: "twoEggAndCheddar")
        let dish2 = Dish(id: 2, rest_id: 1,  name: "Newport Turkey Sandwich", calories: 730, fat: 29, cholesterol: 100, sodium: 1450,    carbs: 76, vegetarian: false, vegan: false, gluten_free: false, img: "newportTurkeySandwich")
        let dishes = [dish1, dish2]
        let restaurant = Restaurant(id: 0, name: "Au Bon Pain", location: CLLocation(latitude: 40.443936, longitude: -79.942250))
        let viewModel = FoodMenuViewModel(restaurant: restaurant)
        viewModel.dishes = dishes
        
        let indexPath1 = IndexPath(row: 0, section: 0)
        XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath1), "Two Egg and Cheddar Sandwich")
        
        let indexPath2 = IndexPath(row: 1, section: 0)
        XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath2), "Newport Turkey Sandwich")
        
        let indexPath3 = IndexPath(row: 99, section: 99)
        XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath3), "")
    }
    
    func test_foodViewModelForRowAtIndexPath() {
        let dish1 = Dish(id: 1, rest_id : 1, name: "Two Egg and Cheddar Sandwich", calories: 450, fat: 16, cholesterol: 345, sodium: 620, carbs: 51, vegetarian: true, vegan: false, gluten_free: false, img: "twoEggAndCheddar")
        let dish2 = Dish(id: 2, rest_id: 1,  name: "Newport Turkey Sandwich", calories: 730, fat: 29, cholesterol: 100, sodium: 1450,    carbs: 76, vegetarian: false, vegan: false, gluten_free: false, img: "newportTurkeySandwich")
        let dishes = [dish1, dish2]
        let restaurant = Restaurant(id: 0, name: "Au Bon Pain", location: CLLocation(latitude: 40.443936, longitude: -79.942250))
        let viewModel = FoodMenuViewModel(restaurant: restaurant)
        viewModel.dishes = dishes
        
        let indexPath = IndexPath(row: 1, section: 0)
        let foodVM = viewModel.foodViewModelForRowAtIndexPath(indexPath)
        XCTAssertEqual(foodVM.dish.id, dish2.id)
    }
    
    // for testing purposes only
    func createFood() -> Dish {
        return Dish(id: 1, rest_id : 1, name: "Two Egg and Cheddar Sandwich", calories: 450, fat: 16, cholesterol: 345, sodium: 620, carbs: 51, vegetarian: true, vegan: false, gluten_free: false, img: "twoEggAndCheddar")
    }
}
