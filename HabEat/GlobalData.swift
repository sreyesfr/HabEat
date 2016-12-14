//
//  GlobalData.swift
//  HabEat
//
//  Created by Sarah Reyes-Franco and Connor Hanley on 12/2/16.
//  Copyright © 2016 Sarah Reyes-Franco. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation

var meals = [NSManagedObject]()
var favorites = [NSManagedObject]()

let allRestaurants = [Restaurant(id: 1, name: "Au Bon Pain", location: CLLocation(latitude: 40.443936, longitude: -79.942250)),
                      Restaurant(id:2, name: "The Exchange", location: CLLocation(latitude: 40.441486, longitude: -79.942014)),
    Restaurant(id: 3, name: "Tazza D'Oro", location: CLLocation(latitude: 40.443343, longitude: -79.944143)),
    Restaurant(id: 4, name: "La Prima Espresso", location: CLLocation(latitude: 40.441379, longitude: -79.944456))]


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
                            sodium: 1640, carbs: 19, vegetarian: false, vegan: false, gluten_free: true, img: "beefBarleySoup"),
                         Dish(id: 17, rest_id: 2, name: "Cheezy Beef Melt", calories: 700, fat: 25, cholesterol: 80, sodium: 1410, carbs: 78, vegetarian: false, vegan: false, gluten_free: false, img: "cheezyBeefMelt"),
                         Dish(id: 9, rest_id: 3, name: "Roasted Turkey Panini", calories: 460, fat: 10, cholesterol: 75,
                              sodium: 1550, carbs: 55, vegetarian: false, vegan: false, gluten_free: false, img: "roastedTurkeyPanini"),
                         Dish(id: 10, rest_id: 3, name: "Winter Prosciutto Panini", calories: 430, fat: 13, cholesterol: 50, sodium: 2150, carbs: 50, vegetarian: false, vegan: false, gluten_free: false, img: "winterPanini"),
                         Dish(id: 11, rest_id: 3, name: "Mediterranean Salad", calories: 600, fat: 44, cholesterol: 60, sodium: 1740, carbs: 25, vegetarian: false, vegan: false, gluten_free: false, img: "mediterraneanSalad"),
                         Dish(id: 12, rest_id: 3, name: "Raisin Scone", calories: 560, fat: 23, cholesterol: 55, sodium: 700, carbs: 93, vegetarian: false, vegan: false, gluten_free: false, img: "raisinScone"),
                         Dish(id: 13, rest_id: 4, name: "Orange Cranberry Muffin", calories: 130, fat: 4.5, cholesterol: 10, sodium: 85, carbs: 22, vegetarian: false, vegan: false, gluten_free: false, img: "cranberryMuffin"),
                         Dish(id: 14, rest_id: 4, name: "Quinoa Vegetable Soup", calories: 70, fat: 2.5, cholesterol: 0, sodium: 260, carbs: 10, vegetarian: false, vegan: false, gluten_free: false, img: "quinoaSoup"),
                         Dish(id: 15, rest_id: 4, name: "Ham and Brie Sandwich", calories: 380, fat: 20, cholesterol: 80, sodium: 1040, carbs: 31, vegetarian: false, vegan: false, gluten_free: false, img: "hamAndBrieSandwich"),
                         Dish(id: 16, rest_id: 4, name: "Chef Salad Wrap", calories: 440, fat: 27, cholesterol: 60, sodium: 1080, carbs: 29, vegetarian: false, vegan: false, gluten_free: false, img: "chefSaladWrap")]

