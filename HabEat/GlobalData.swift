//
//  GlobalData.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco on 12/2/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation
import CoreData

var meals = [NSManagedObject]()
var favorites = [NSManagedObject]()

let allRestaurants = [Restaurant(id: 1, name: "Au Bon Pain", latitude: 40.443936, longitude: -79.942250), Restaurant(id:2, name: "The Exchange", latitude: 40.441486, longitude: -79.942014)]


let allDishes: [Dish] = [Dish(id: 1, rest_id : 1, name: "Two Egg and Cheddar Sandwich", calories: 450, fat: 16,
    cholesterol: 345, sodium: 620, carbs: 51, vegetarian: true, vegan: false, gluten_free: false, img: "twoEggAndCheddar"),
                         Dish(id: 2, rest_id: 1,  name: "Newport Turkey Sandwich", calories: 730, fat: 29, cholesterol: 100, sodium: 1450,    carbs: 76, vegetarian: false, vegan: false, gluten_free: false, img: "newportTurkeySandwich"),
                         Dish(id: 3, rest_id: 1, name: "Vegetarian Deluxe Salad", calories: 270, fat: 13, cholesterol: 25,
                            sodium: 720, carbs: 29, vegetarian: true, vegan: false, gluten_free: true, img: "veggieSalad"),
                         Dish(id: 4, rest_id: 1, name: "Pecan Roll", calories: 740, fat: 42, cholesterol: 75, sodium: 370,
                            carbs: 86, vegetarian: true, vegan: false, gluten_free: false, img: "pecanRoll"),
                         Dish(id: 5, rest_id: 2, name: "Croissant Egg Sandwich", calories: 490, fat: 31, cholesterol: 260,
                            sodium: 600, carbs: 33, vegetarian: true, vegan: false, gluten_free: false, img: "croissantEggSandwich"),
                         Dish(id: 6, rest_id: 2, name: "Baked Chicken and Pierogies", calories: 570, fat: 32, cholesterol: 160,
                            sodium: 790, carbs: 23, vegetarian: false, vegan: false, gluten_free: false, img: "chickenAndPierogies"),
                         Dish(id: 7, rest_id: 2, name: "Bulgur Wheat Kale Salad", calories: 280, fat: 16, cholesterol: 0,
                            sodium: 1070, carbs: 31, vegetarian: true, vegan: true, gluten_free: false, img: "bulgurWheatSalad"),
                         Dish(id: 8, rest_id: 2, name: "Beef Barley Soup", calories: 120, fat: 2.5, cholesterol: 10,
                            sodium: 1640, carbs: 19, vegetarian: false, vegan: false, gluten_free: true, img: "beefBarleySoup")]

