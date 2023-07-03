//
//  DessertCategoryRow.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/01.
//

import SwiftUI

struct DessertCategoryRow: View {
    var categoryName: String = "Dessert 🍧"
    var meals: [Meal] = []
    @StateObject var viewModel = DessertViewModel()
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

struct DessertCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        DessertCategoryRow()
    }
}
