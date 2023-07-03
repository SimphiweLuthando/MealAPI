//
//  MealListView.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/01.
//

import SwiftUI

struct URLImage: View{
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

struct MealListView: View {
    @StateObject var viewModel = ViewModel()

    
    var body: some View {
        NavigationView{
//            List{
//                ForEach(viewModel.meals, id: \.self){ meal in
//                    NavigationLink(destination: MealDetailsView(meal: meal)){
//                        HStack{
//                            URLImage(urlString: meal.strMealThumb)
//                            Text(meal.strMeal)
//                            Spacer()
//                            if viewModel.isFavoriteMeal(meal) {
//                                           Image(systemName: "heart.fill")
//                                    .foregroundColor(.red)
//                                       }
//                        }
//                        .padding(3)
//                    }
//
//                }
//
//            }
//            .navigationTitle("Meals")
//            .onAppear{
//                viewModel.fetch()
//            }
//            .onChange(of: viewModel.meals) { _ in
//                            // Reload the list whenever the meals array is updated
//
//                        }
            
            List(viewModel.meals, id: \.self) { meal in
                            NavigationLink(destination: MealDetailsView(meal: meal)) {
                                HStack {
                                    URLImage(urlString: meal.strMealThumb)
                                    Text(meal.strMeal)
                                    Spacer()
                                    if viewModel.isFavoriteMeal(meal) {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.green)
                                    }
                                }
                                .padding(3)
                            }
                        }
                        .navigationTitle("Meals")
                        .onAppear {
                            viewModel.fetch()
                        }
                        .onChange(of: viewModel.meals) { _ in
                            // Reload the list whenever the meals array is updated
                            //tableView.reloadData() // Replace this line if needed
                        }
            
        }

    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
