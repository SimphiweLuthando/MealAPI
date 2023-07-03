//
//  DrinksViewModel.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/02.
//

import Foundation

import SwiftUI

struct ReturnedDrinksObject: Hashable, Codable{
    let drinks: [Drink]
}

struct ReturnedDrinksDetailObject: Hashable, Codable {
    let drinks: [DrinksDetailed]
}



struct DrinksDetailed: Hashable, Codable {
    let idDrink: String
    let strDrink: String
    let strCategory: String
    let strDrinkThumb: String
    let strInstructions: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    // Add other properties if needed
    var id: String { idDrink }
    
}



struct Drink: Hashable, Codable{
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String
    var isFavorite: Bool? = nil
    
    
    var id: String { idDrink }
}


class DrinksViewlModel: ObservableObject{
    
    @Published var drinks: [Drink] = []
    @Published var drinksDetailed: [DrinksDetailed] = []
    
    func fetch(){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic")
        else{
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) {[weak self]data, _, error in
            guard let data = data, error == nil else{return}
            
            
            do{
                let drinks = try JSONDecoder().decode(ReturnedDrinksObject.self, from: data)
                
                
                
                DispatchQueue.main.async {
                    //                    self?.meals = meals.meals
                    self?.drinks = drinks.drinks
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
        
    }
    
    
    
    func fetchRecipe(for drink: Drink) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(drink.idDrink)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self]data, _, error in
            guard let data = data else {
                // Handle error
                return
            }
            
            // Parse the JSON response and update the meal object with the fetched recipe information
            do{
                let drinks = try JSONDecoder().decode(ReturnedDrinksDetailObject.self, from: data)
                
                
                
                DispatchQueue.main.async {
                    //                    self?.meals = meals.meals
                    self?.drinksDetailed = drinks.drinks
                }
            }catch {
                // Handle decoding error
                print(error)
            }
        }
        
        task.resume()
    }
    
    func getIngredient( key: String) -> String {
        switch key {
        case "strIngredient1":
            return drinksDetailed.first?.strIngredient1 ?? ""
        case "strIngredient2":
            return drinksDetailed.first?.strIngredient2 ?? ""
        case "strIngredient3":
            return drinksDetailed.first?.strIngredient3 ?? ""
            // Add cases for other ingredient keys as needed
        case "strIngredient4":
            return drinksDetailed.first?.strIngredient4 ?? ""
        case "strIngredient5":
            return drinksDetailed.first?.strIngredient5 ?? ""
        case "strIngredient6":
            return drinksDetailed.first?.strIngredient6 ?? ""
        case "strIngredient7":
            return drinksDetailed.first?.strIngredient7 ?? ""
        case "strIngredient8":
            return drinksDetailed.first?.strIngredient8 ?? ""
        case "strIngredient9":
            return drinksDetailed.first?.strIngredient9 ?? ""
        case "strIngredient10":
            return drinksDetailed.first?.strIngredient10 ?? ""
        case "strIngredient11":
            return drinksDetailed.first?.strIngredient11 ?? ""
        case "strIngredient12":
            return drinksDetailed.first?.strIngredient12 ?? ""
        case "strIngredient13":
            return drinksDetailed.first?.strIngredient13 ?? ""
        case "strIngredient14":
            return drinksDetailed.first?.strIngredient14 ?? ""
        case "strIngredient15":
            return drinksDetailed.first?.strIngredient15 ?? ""
        default:
            return ""
        }
    }
    
    func getMeasure( key: String) -> String {
        switch key {
        case "strMeasure1":
            return drinksDetailed.first?.strMeasure1 ?? ""
        case "strMeasure2":
            return drinksDetailed.first?.strMeasure2 ?? ""
        case "strMeasure3":
            return drinksDetailed.first?.strMeasure3 ?? ""
            // Add cases for other ingredient keys as needed
        case "strIngredient4":
            return drinksDetailed.first?.strMeasure4 ?? ""
        case "strMeasure5":
            return drinksDetailed.first?.strMeasure5 ?? ""
        case "strMeasure6":
            return drinksDetailed.first?.strMeasure6 ?? ""
        case "strMeasure7":
            return drinksDetailed.first?.strMeasure7 ?? ""
        case "strMeasure8":
            return drinksDetailed.first?.strMeasure8 ?? ""
        case "strMeasure9":
            return drinksDetailed.first?.strMeasure9 ?? ""
        case "strMeasure10":
            return drinksDetailed.first?.strMeasure10 ?? ""
        case "strMeasure11":
            return drinksDetailed.first?.strMeasure11 ?? ""
        case "strMeasure12":
            return drinksDetailed.first?.strMeasure12 ?? ""
        case "strMeasure13":
            return drinksDetailed.first?.strMeasure13 ?? ""
        case "strMeasure14":
            return drinksDetailed.first?.strMeasure14 ?? ""
        case "strMeasure15":
            return drinksDetailed.first?.strMeasure15 ?? ""
        default:
            return ""
        }
    }
    
    
}
