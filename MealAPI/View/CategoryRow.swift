//
//  CategoryRow.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/06/30.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String = "Beef 🥩"
    var meals: [Meal] = []
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text(categoryName)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(viewModel.meals, id: \.self) { meal in
                        NavigationLink(destination: MealDetailsView(meal: meal)){
                            CategoryItem(meal: meal)
                        }
                        .fontWeight(.bold)
                    }
                }
            }
            .frame(height: 185)
        }
        .onAppear{
            viewModel.fetch()
        }
        
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let sampleMeal = Meal(
           idMeal: "52959", strMeal: "Baked Salmon with Fennel & Tomatoes",
           strMealThumb: "https://www.themealdb.com/images/media/meals/1548772327.jpg"
               )
        CategoryRow(categoryName: "Seafood", meals: [sampleMeal])
    }
}
