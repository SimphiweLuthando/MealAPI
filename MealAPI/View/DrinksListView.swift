//
//  DrinksListView.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/02.
//

import SwiftUI

struct URLImageDrinksList: View{
    let urlString: String
    
    @State var data: Data?
    @State private var showFavoritesOnly = false
    
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
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

struct DrinksListView: View {
    @StateObject var viewModel = DrinksViewlModel()
    
    
    var body: some View {
//        NavigationView{
//            List(viewModel.drinks, id: \.self) { drink in
//                NavigationLink(destination: DrinksDetailsView(drinks: drink)) {
//                    HStack {
//                        URLImageDrinksList(urlString: drink.strDrinkThumb)
//                        Text(drink.strDrink)
//                        Spacer()
//                        //                                    if viewModel.isFavoriteMeal(drink) {
//                        //                                        Image(systemName: "heart.fill")
//                        //                                            .foregroundColor(.red)
//                        //                                    }
//                    }
//                    .padding(3)
//                }
//            }
//            .navigationTitle("Drinks")
//            .onAppear {
//                viewModel.fetch()
//            }
//
//        }
        
        let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
        
        NavigationView{
                    ScrollView {
                        LazyVGrid(columns: gridItems, spacing: 10) {
                            ForEach(viewModel.drinks, id: \.self) { drink in
                                NavigationLink(destination: DrinksDetailsView(drinks: drink)) {
                                    DrinksCardView(drink: drink)
                                }
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("Drinks")
                    .onAppear {
                        viewModel.fetch()
                    }
                }
    }
}

struct DrinksListView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksListView()
    }
}
