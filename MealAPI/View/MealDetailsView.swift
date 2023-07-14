//
//  MealDetailsView.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/06/29.
//

import SwiftUI
import YouTubePlayerKit
import AVKit

struct URLImageDetailed: View{
    let urlString: String
    
    @State var data: Data?
    
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .ignoresSafeArea(edges: .top)
                .ignoresSafeArea(edges: .horizontal)
                .frame(height: 300)

        }
        else{
            Image(systemName: "camera")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 130, height: 90)
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

struct MealDetailsView: View {
    var meal: Meal
    @ObservedObject var viewModel = ViewModel()
    var ingredients: [String] = []
    
    
    
    var body: some View {
        
        
        ScrollView{
            VStack {
                URLImageDetailed(urlString: meal.strMealThumb)
                

                Text(meal.strMeal)
                    .font(.title)
                    .fontWeight(.heavy)
                
                HStack {
                    TagView(meal: viewModel.mealDetailed.first?.strCategory ?? "")
                        .padding(.leading, 10)
                    
                    Button(action: {
                        viewModel.toggleFavoriteStatus(for: meal)
                    }) {
                        Image(systemName: viewModel.isFavoriteMeal(meal) ? "heart.fill" : "heart")
                            .foregroundColor(viewModel.isFavoriteMeal(meal) ? .red : .secondary)
                    }
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                }
                   
                
                
                Text(viewModel.mealDetailed.first?.strInstructions ?? "No Instructions to show")
                    .padding()
                
                YouTubeView(videoURL: viewModel.mealDetailed.first?.strYoutube ?? "")
                    .frame(height: UIScreen.main.bounds.size.height * 0.3)
                    .cornerRadius(10)
                    .padding()
                
                Spacer(minLength: 10)
                
                
                Text("Ingredients")
                    .fontWeight(.bold)
                VStack {
                    ForEach(1...20, id: \.self){index in
                            let ingredient = "strIngredient\(index)"
                            let measure = "strMeasure\(index)"
                            
                        HStack{
                                Text(viewModel.getIngredient(key: ingredient))
                                Spacer()
                                Text(viewModel.getMeasure(key: measure))
                            }
                            .padding(10)
                    }
   
                }
                

    
                
                
     
            }
            .onAppear{
                viewModel.fetchRecipe(for: meal)
            }
            
        }
        
    }
    
    
        
}


struct MealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
         let sampleMeal = Meal(
            idMeal: "52959", strMeal: "Baked Salmon with Fennel & Tomatoes",
            strMealThumb: "https://www.themealdb.com/images/media/meals/1548772327.jpg")
       
        MealDetailsView(meal: sampleMeal)
    }
}
