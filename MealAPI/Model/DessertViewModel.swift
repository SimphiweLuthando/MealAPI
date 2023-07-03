//
//  DessertViewModel.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/01.
//

import Foundation
import SwiftUI

struct ReturnedDessertObject: Hashable, Codable{
    let meals: [Meal]
}

struct ReturnedMealDessertObject: Hashable, Codable{
    let meals: [MealDetailed]
}



class DessertViewModel: ObservableObject{

    @Published var meals: [Meal] = []
    @Published var mealDetailed: [MealDetailed] = []
   

    func fetch(){
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) {[weak self]data, _, error in
            guard let data = data, error == nil else{return}


            do{
                let meals = try JSONDecoder().decode(ReturnedObject.self, from: data)

                DispatchQueue.main.async {
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
