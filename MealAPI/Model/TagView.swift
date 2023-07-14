//
//  TagView.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/14.
//

import SwiftUI

struct TagView: View {
    var meal: String
    
    var body: some View {
        
        Text(meal)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleMeal = MealDetailed(idMeal: "52959", strMeal: "Baked Salmon with Fennel & Tomatoes", strCategory: "Japanese", strInstructions: "", strMealThumb: "https://www.themealdb.com/images/media/meals/1548772327.jpg", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "", strYoutube: "")
        TagView(meal: "Japanese")
    }
}
