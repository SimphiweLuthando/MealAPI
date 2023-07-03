//
//  ChickenViewModel.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/06/30.
//

import Foundation
import SwiftUI

struct ReturnedChickenObject: Hashable, Codable{
    let meals: [Meal]
}

struct ReturnedChickenMealObject: Hashable, Codable{
    let meals: [MealDetailed]
}




class ChickenViewModel: ViewModel{

    @Published var chickenMeals: [Meal] = []
    @Published var chickenMealDetailed: [MealDetailed] = []
   

    override func fetch(){
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Chicken")
        else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) {[weak self]data, _, error in
            guard let data = data, error == nil else{return}


            do{
                let chicken = try JSONDecoder().decode(ReturnedChickenObject.self, from: data)

                DispatchQueue.main.async {
                    self?.chickenMeals = chicken.meals
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()

    }

    override func fetchRecipe(for meal: Meal) {
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
                let meals = try decoder.decode(ReturnedChickenMealObject.self, from: data)


                DispatchQueue.main.async {
                    self?.chickenMealDetailed = meals.meals
                }

            } catch {
                // Handle decoding error
                print(error)
            }
        }

        task.resume()
    }

    override func getIngredient( key: String) -> String {
        switch key {
        case "strIngredient1":
            return chickenMealDetailed.first?.strIngredient1 ?? ""
        case "strIngredient2":
            return chickenMealDetailed.first?.strIngredient2 ?? ""
        case "strIngredient3":
            return chickenMealDetailed.first?.strIngredient3 ?? ""
            // Add cases for other ingredient keys as needed
        case "strIngredient4":
            return chickenMealDetailed.first?.strIngredient4 ?? ""
        case "strIngredient5":
            return chickenMealDetailed.first?.strIngredient5 ?? ""
        case "strIngredient6":
            return chickenMealDetailed.first?.strIngredient6 ?? ""
        case "strIngredient7":
            return chickenMealDetailed.first?.strIngredient7 ?? ""
        case "strIngredient8":
            return chickenMealDetailed.first?.strIngredient8 ?? ""
        case "strIngredient9":
            return chickenMealDetailed.first?.strIngredient9 ?? ""
        case "strIngredient10":
            return chickenMealDetailed.first?.strIngredient10 ?? ""
        case "strIngredient11":
            return chickenMealDetailed.first?.strIngredient11 ?? ""
        case "strIngredient12":
            return chickenMealDetailed.first?.strIngredient12 ?? ""
        case "strIngredient13":
            return chickenMealDetailed.first?.strIngredient13 ?? ""
        case "strIngredient14":
            return chickenMealDetailed.first?.strIngredient14 ?? ""
        case "strIngredient15":
            return chickenMealDetailed.first?.strIngredient15 ?? ""
        case "strIngredient16":
            return chickenMealDetailed.first?.strIngredient16 ?? ""
        case "strIngredient17":
            return chickenMealDetailed.first?.strIngredient17 ?? ""
        case "strIngredient18":
            return chickenMealDetailed.first?.strIngredient18 ?? ""
        case "strIngredient19":
            return chickenMealDetailed.first?.strIngredient19 ?? ""
        case "strIngredient20":
            return chickenMealDetailed.first?.strIngredient20 ?? ""
        default:
            return ""
        }
    }
    
    override func getMeasure( key: String) -> String {
        switch key {
        case "strMeasure1":
            return chickenMealDetailed.first?.strMeasure1 ?? ""
        case "strMeasure2":
            return chickenMealDetailed.first?.strMeasure2 ?? ""
        case "strMeasure3":
            return chickenMealDetailed.first?.strMeasure3 ?? ""
            // Add cases for other ingredient keys as needed
        case "strIngredient4":
            return chickenMealDetailed.first?.strMeasure4 ?? ""
        case "strMeasure5":
            return chickenMealDetailed.first?.strMeasure5 ?? ""
        case "strMeasure6":
            return chickenMealDetailed.first?.strMeasure6 ?? ""
        case "strMeasure7":
            return chickenMealDetailed.first?.strMeasure7 ?? ""
        case "strMeasure8":
            return chickenMealDetailed.first?.strMeasure8 ?? ""
        case "strMeasure9":
            return chickenMealDetailed.first?.strMeasure9 ?? ""
        case "strMeasure10":
            return chickenMealDetailed.first?.strMeasure10 ?? ""
        case "strMeasure11":
            return chickenMealDetailed.first?.strMeasure11 ?? ""
        case "strMeasure12":
            return chickenMealDetailed.first?.strMeasure12 ?? ""
        case "strMeasure13":
            return chickenMealDetailed.first?.strMeasure13 ?? ""
        case "strMeasure14":
            return chickenMealDetailed.first?.strMeasure14 ?? ""
        case "strMeasure15":
            return chickenMealDetailed.first?.strMeasure15 ?? ""
        case "strMeasure16":
            return chickenMealDetailed.first?.strMeasure16 ?? ""
        case "strMeasure17":
            return chickenMealDetailed.first?.strMeasure17 ?? ""
        case "strMeasure18":
            return chickenMealDetailed.first?.strMeasure18 ?? ""
        case "strMeasure19":
            return chickenMealDetailed.first?.strMeasure19 ?? ""
        case "strMeasure20":
            return chickenMealDetailed.first?.strMeasure20 ?? ""
        default:
            return ""
        }
    }

    override func getQueryStringParameter(url: String, param: String) -> String? {
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
