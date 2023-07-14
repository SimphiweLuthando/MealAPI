//
//  CardView.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/13.
//

import SwiftUI

struct URLImage1: View{
    let urlString: String
    
    @State var data: Data?
    @State private var showFavoritesOnly = false
    
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
            //                .frame(width: 50, height: 50)
            
        }
        else{
            Image(systemName: "Camera")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 130, height: 70)
                .background(Color.gray)
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

struct CardView: View {
    @StateObject var viewModel = ViewModel()
    
    var meal: Meal
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(SwiftUI.Color.gray, lineWidth: 0)
                .frame(width: cardAndImageWidth, height: cardHeight)
            
            
            VStack(alignment: .leading, spacing: 10) {
                URLImage1(urlString: meal.strMealThumb)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardAndImageWidth, height: imageHeight)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(meal.strMeal)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Meal")
                        .font(.footnote)
                        .foregroundColor(SwiftUI.Color.gray)
                }
                .padding(.horizontal,12)
                .padding(.bottom,11)
            }
            .frame(width: cardAndImageWidth, height: cardHeight)
            .cornerRadius(cornerRadius)
        }
        
    }
    let cardAndImageWidth: CGFloat = 170
    let cardHeight: CGFloat = 174
    let imageHeight: CGFloat = 116
    let cornerRadius: CGFloat = 5
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleMeal = Meal(
            idMeal: "52959", strMeal: "Baked Salmon with Fennel & Tomatoes",
            strMealThumb: "https://www.themealdb.com/images/media/meals/1548772327.jpg")
        CardView(meal: sampleMeal)
    }
}
