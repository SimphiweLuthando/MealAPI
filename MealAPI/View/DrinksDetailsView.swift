//
//  DrinksDetailsView.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/02.
//

import SwiftUI


struct DrinksDetailsView: View {
    var drinks: Drink
    @ObservedObject var viewModel = DrinksViewlModel()
    var ingredients: [String] = []
    
    var body: some View {
        ScrollView{
            VStack {
                URLImageDetailed(urlString: drinks.strDrinkThumb)
                
                Text(drinks.strDrink)
                    .font(.title)
                    .fontWeight(.heavy)
                
//                Button(action: {
//                    viewModel.toggleFavoriteStatus(for: drinks)
//                }) {
//                    Image(systemName: viewModel.isFavoriteMeal(drinks) ? "heart.fill" : "heart")
//                        .foregroundColor(viewModel.isFavoriteMeal(drinks) ? .red : .secondary)
//                }
//                .font(.title)
//                .frame(maxWidth: .infinity, alignment: .trailing)
//                .padding(.trailing)
                   
                
                
                Text(viewModel.drinksDetailed.first?.strInstructions ?? "No Instructions to show")
                    .padding()
                
//                YouTubeView(videoURL: viewModel.mealDetailed.first?.strYoutube ?? "")
//                    .frame(height: UIScreen.main.bounds.size.height * 0.3)
//                    .cornerRadius(10)
//                    .padding()
                
               
                
                
                Text("Ingredients")
                    .fontWeight(.bold)
                VStack {
                    ForEach(1...15, id: \.self){index in
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
                .padding()
                

    
                
                
     
            }

            
        }
        .onAppear{
            viewModel.fetchRecipe(for: drinks)
        }
    }
}

struct DrinksDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDrink = Drink(
           idDrink: "15346", strDrink: "155 Belmont",
           strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/yqvvqs1475667388.jpg"
               )
        DrinksDetailsView(drinks: sampleDrink)
    }
}
