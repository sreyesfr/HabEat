//
//  RestaurantsViewModelTests.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco and Connor Hanley on 12/14/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation
import XCTest
import CoreLocation
@testable import HabEat

class RestaurantsViewModelTests: XCTestCase {
    
    func test_numberOfRows() {
        let restaurants = [createRestaurant(), createRestaurant(), createRestaurant()]
        let viewModel = RestaurantsViewModel()
        viewModel.restaurants = restaurants
        
        XCTAssertEqual(viewModel.numberOfRows(), 3)
    }
    
    func test_titleForRowAtIndexPath() {
        let rest1 = Restaurant(id: 0, name: "Au Bon Pain", location: CLLocation(latitude: 40.443936, longitude: -79.942250))
        let rest2 = Restaurant(id: 1, name: "Creperie", location: CLLocation(latitude: 40.443936, longitude: -79.942250))
        let restaurants = [rest1, rest2]
        let viewModel = RestaurantsViewModel()
        viewModel.restaurants = restaurants
        
        let indexPath1 = IndexPath(row: 0, section: 0)
        XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath1), "Au Bon Pain")
        
        let indexPath2 = IndexPath(row: 1, section: 0)
        XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath2), "Creperie")
        
        let indexPath3 = IndexPath(row: 99, section: 99)
        XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath3), "")
    }
    
    func test_detailViewModelForRowAtIndexPath() {
        let rest1 = Restaurant(id: 0, name: "Au Bon Pain", location: CLLocation(latitude: 40.443936, longitude: -79.942250))
        let rest2 = Restaurant(id: 1, name: "Creperie", location: CLLocation(latitude: 40.443936, longitude: -79.942250))
        let restaurants = [rest1, rest2]
        
        let viewModel = RestaurantsViewModel()
        viewModel.restaurants = restaurants
        
        let indexPath = IndexPath(row: 1, section: 0)
        let foodMenuVM = viewModel.foodMenuViewModelForRowAtIndexPath(indexPath)
        XCTAssertEqual(foodMenuVM.restaurant.id, rest2.id)
    }
    
    // for testing purposes only
    func createRestaurant() -> Restaurant {
        return Restaurant(id: 0, name: "Au Bon Pain", location: CLLocation(latitude: 40.443936, longitude: -79.942250))
    }
}
