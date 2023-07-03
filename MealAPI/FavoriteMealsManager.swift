//
//  FavoriteMealsManager.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/01.
//

import Foundation

class FavoriteMealsManager {
    private let userDefaults = UserDefaults.standard
    private let favoriteMealsKey = "FavoriteMeals"
    
    func saveFavoriteMeal(_ meal: Meal) {
        var favoriteMeals = fetchFavoriteMeals()
        favoriteMeals.append(meal)
        saveFavoriteMeals(favoriteMeals)
    }
    
    func removeFavoriteMeal(_ meal: Meal) {
        var favoriteMeals = fetchFavoriteMeals()
        favoriteMeals.removeAll(where: { $0.idMeal == meal.idMeal })
        saveFavoriteMeals(favoriteMeals)
    }
    
    func fetchFavoriteMeals() -> [Meal] {
        guard let data = userDefaults.data(forKey: favoriteMealsKey) else {
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            let favoriteMeals = try decoder.decode([Meal].self, from: data)
            return favoriteMeals
        } catch {
            print("Error decoding favorite meals: \(error)")
            return []
        }
    }
    
    private func saveFavoriteMeals(_ favoriteMeals: [Meal]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(favoriteMeals)
            userDefaults.set(data, forKey: favoriteMealsKey)
        } catch {
            print("Error encoding favorite meals: \(error)")
        }
    }
}
