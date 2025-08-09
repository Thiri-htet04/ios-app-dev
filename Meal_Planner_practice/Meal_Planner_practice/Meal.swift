//
//  Meal.swift
//  Meal_Planner_practice
//
//  Created by Thiri Htet on 25/07/2025.
//

import Foundation


enum MealType{
    case breakfast
    case lunch
    case dinner
}

class DayMeal{
    var date: Date
    var meals: [Meal]
    
    init(date: Date, meals: [Meal]) {
        self.date = date
        self.meals = meals
    }
}

class Meal{
    var title: String
    var type: MealType
    var isVegetarian : Bool
    var note : String
    
    init(title: String, type: MealType, isVegetarian: Bool, note: String) {
        self.title = title
        self.type = type
        self.isVegetarian = isVegetarian
        self.note = note
    }
}
