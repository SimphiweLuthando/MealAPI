//
//  ViewModel.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/06/29.
//

import Foundation
import SwiftUI

struct ReturnedObject: Hashable, Codable{
    let meals: [Meal]
}

struct ReturnedMealObject: Hashable, Codable{
    let meals: [MealDetailed]
}


struct MealDetailed: Hashable, Codable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
    let strYoutube: String
    // Add other properties if needed
    var id: String { idMeal }
    
}



struct Meal: Hashable, Codable{
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    var isFavorite: Bool? = nil


    var id: String { idMeal }
}

class ViewModel: ObservableObject{
    
    private let favoriteMealsManager = FavoriteMealsManager()
    @Published var favoriteMealIds: Set<String> = []
    
    init() {
        loadFavoriteMealIds()
    }
        

    @Published var meals: [Meal] = []
    @Published var mealDetailed: [MealDetailed] = []
   
    func fetchMeals() {
            // Call the fetchMealsWithQuery function multiple times with different query parameters
            fetchMealsWithQuery("Dessert")
            fetchMealsWithQuery("Beef")
            fetchMealsWithQuery("Seafood")
            fetchMealsWithQuery("Chicken")
        }
        
        private func fetchMealsWithQuery(_ query: String) {
            guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(query)") else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let returnedObject = try JSONDecoder().decode(ReturnedObject.self, from: data)
                    
                    DispatchQueue.main.async {
                        self?.meals.append(contentsOf: returnedObject.meals)
                    }
                } catch {
                    print(error)
                }
            }
            
            task.resume()
        }

    func fetch(){
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Beef")
        else{
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) {[weak self]data, _, error in
            guard let data = data, error == nil else{return}


            do{
                let meals = try JSONDecoder().decode(ReturnedObject.self, from: data)
                
               

                DispatchQueue.main.async {
//                    self?.meals = meals.meals
                    self?.meals = meals.meals
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()

    }

    func fetchRecipe(for meal: Meal) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(meal.idMeal)") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) {[weak self]data, _, error in
            guard let data = data else {
                // Handle error
                return
            }

            // Parse the JSON response and update the meal object with the fetched recipe information
            do {
                let decoder = JSONDecoder()
                let mealDetailed = try decoder.decode(ReturnedMealObject.self, from: data)


                DispatchQueue.main.async {
                    self?.mealDetailed = mealDetailed.meals
                }

            } catch {
                // Handle decoding error
                print(error)
            }
        }

        task.resume()
    }

    func getIngredient( key: String) -> String {
        switch key {
        case "strIngredient1":
            return mealDetailed.first?.strIngredient1 ?? ""
        case "strIngredient2":
            return mealDetailed.first?.strIngredient2 ?? ""
        case "strIngredient3":
            return mealDetailed.first?.strIngredient3 ?? ""
            // Add cases for other ingredient keys as needed
        case "strIngredient4":
            return mealDetailed.first?.strIngredient4 ?? ""
        case "strIngredient5":
            return mealDetailed.first?.strIngredient5 ?? ""
        case "strIngredient6":
            return mealDetailed.first?.strIngredient6 ?? ""
        case "strIngredient7":
            return mealDetailed.first?.strIngredient7 ?? ""
        case "strIngredient8":
            return mealDetailed.first?.strIngredient8 ?? ""
        case "strIngredient9":
            return mealDetailed.first?.strIngredient9 ?? ""
        case "strIngredient10":
            return mealDetailed.first?.strIngredient10 ?? ""
        case "strIngredient11":
            return mealDetailed.first?.strIngredient11 ?? ""
        case "strIngredient12":
            return mealDetailed.first?.strIngredient12 ?? ""
        case "strIngredient13":
            return mealDetailed.first?.strIngredient13 ?? ""
        case "strIngredient14":
            return mealDetailed.first?.strIngredient14 ?? ""
        case "strIngredient15":
            return mealDetailed.first?.strIngredient15 ?? ""
        case "strIngredient16":
            return mealDetailed.first?.strIngredient16 ?? ""
        case "strIngredient17":
            return mealDetailed.first?.strIngredient17 ?? ""
        case "strIngredient18":
            return mealDetailed.first?.strIngredient18 ?? ""
        case "strIngredient19":
            return mealDetailed.first?.strIngredient19 ?? ""
        case "strIngredient20":
            return mealDetailed.first?.strIngredient20 ?? ""
        default:
            return ""
        }
    }
    
    func getMeasure( key: String) -> String {
        switch key {
        case "strMeasure1":
            return mealDetailed.first?.strMeasure1 ?? ""
        case "strMeasure2":
            return mealDetailed.first?.strMeasure2 ?? ""
        case "strMeasure3":
            return mealDetailed.first?.strMeasure3 ?? ""
            // Add cases for other ingredient keys as needed
        case "strIngredient4":
            return mealDetailed.first?.strMeasure4 ?? ""
        case "strMeasure5":
            return mealDetailed.first?.strMeasure5 ?? ""
        case "strMeasure6":
            return mealDetailed.first?.strMeasure6 ?? ""
        case "strMeasure7":
            return mealDetailed.first?.strMeasure7 ?? ""
        case "strMeasure8":
            return mealDetailed.first?.strMeasure8 ?? ""
        case "strMeasure9":
            return mealDetailed.first?.strMeasure9 ?? ""
        case "strMeasure10":
            return mealDetailed.first?.strMeasure10 ?? ""
        case "strMeasure11":
            return mealDetailed.first?.strMeasure11 ?? ""
        case "strMeasure12":
            return mealDetailed.first?.strMeasure12 ?? ""
        case "strMeasure13":
            return mealDetailed.first?.strMeasure13 ?? ""
        case "strMeasure14":
            return mealDetailed.first?.strMeasure14 ?? ""
        case "strMeasure15":
            return mealDetailed.first?.strMeasure15 ?? ""
        case "strMeasure16":
            return mealDetailed.first?.strMeasure16 ?? ""
        case "strMeasure17":
            return mealDetailed.first?.strMeasure17 ?? ""
        case "strMeasure18":
            return mealDetailed.first?.strMeasure18 ?? ""
        case "strMeasure19":
            return mealDetailed.first?.strMeasure19 ?? ""
        case "strMeasure20":
            return mealDetailed.first?.strMeasure20 ?? ""
        default:
            return ""
        }
    }

    func getQueryStringParameter(url: String, param: String) -> String? {
      guard let url = URLComponents(string: url) else { return nil }
      return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
    func toggleFavoriteStatus(for meal: Meal) {
        if favoriteMealIds.contains(meal.idMeal) {
            favoriteMealIds.remove(meal.idMeal)
        } else {
            favoriteMealIds.insert(meal.idMeal)
        }
        saveFavoriteMealIds()
    }
    
    func isFavoriteMeal(_ meal: Meal) -> Bool {
        return favoriteMealIds.contains(meal.idMeal)
    }
    
    private func loadFavoriteMealIds() {
            if let data = UserDefaults.standard.data(forKey: "FavoriteMealIds") {
                if let decodedSet = try? JSONDecoder().decode(Set<String>.self, from: data) {
                    favoriteMealIds = decodedSet
                }
            }
        }
        
        private func saveFavoriteMealIds() {
            if let encodedData = try? JSONEncoder().encode(favoriteMealIds) {
                UserDefaults.standard.set(encodedData, forKey: "FavoriteMealIds")
            }
        }
    
}

//class ViewModel: ObservableObject {
//    @Published var meals: [Meal] = []
//
//
////    func fetch() {
////        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood") else {
////            return
////        }
////
////        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
////            guard let data = data, error == nil else {
////                return
////            }
////
////            do {
////                let meals = try JSONDecoder().decode(ReturnedObject.self, from: data)
////
////                DispatchQueue.main.async {
////                    self?.meals = meals.meals
////                }
////            } catch {
////                print(error)
////            }
////        }
////
////        task.resume()
////    }
//
//
//    func fetchRecipe(for meal: Meal) {
//        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(meal.idMeal)") else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//            guard let data = data else {
//                return
//            }
//
//            do {
//                let mealDetails = try JSONDecoder().decode(ReturnedMealObject.self, from: data)
//
//                if let detailedMeal = mealDetails.meals.first {
//                    DispatchQueue.main.async {
//                        self?.updateMeal(with: detailedMeal, meal: meal)
//                    }
//                }
//            } catch {
//                print(error)
//            }
//        }
//
//        task.resume()
//    }
//
//    func updateMeal(with mealDetails: MealDetailed, meal: Meal) {
//        guard let index = meals.firstIndex(where: { $0.idMeal == meal.idMeal }) else {
//            return
//        }
//
//        meals[index].strInstructions = mealDetails.strInstructions
//        meals[index].strCategory = mealDetails.strCategory
//    }
//}
//
