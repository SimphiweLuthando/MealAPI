//
//  CategoryItem.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/06/30.
//

import SwiftUI

struct URLImageRow: View{
    let urlString: String
    
    @State var data: Data?
    
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
        }
        else{
            Image(systemName: "Camera")
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                .onAppear{
                    fetchData()
                }
        }
    }
    private func fetchData(){
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct CategoryItem: View {
    var meal: Meal
    var body: some View {
        VStack(alignment: .leading) {
            URLImageRow(urlString: meal.strMealThumb)
            Text(meal.strMeal)
                .foregroundColor(.primary)
                .font(.caption)
            
            
        }
        .padding(.leading, 15)
        .padding(.bottom, 10)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        let sampleMeal = Meal(
            idMeal: "52959", strMeal: "Baked Salmon with Fennel & Tomatoes",
            strMealThumb: "https://www.themealdb.com/images/media/meals/1548772327.jpg"
        )
        
        CategoryItem(meal: sampleMeal)
    }
}
