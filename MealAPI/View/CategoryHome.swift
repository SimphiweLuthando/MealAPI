//
//  CategoryHome.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/06/30.
//

import SwiftUI

struct URLImageHome: View{
    let urlString: String
    
    
    
    @State var data: Data?
    
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
        }
        else{
            Image(systemName: "Camera")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
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

struct CategoryHome: View {
    var viewModel = ViewModel()
    var chickenViewModel = ChickenViewModel()
    let colors = [Color(.systemMint), Color(.systemBlue)]
    @State private var showingProfile = false
    
    var body: some View {
        
        NavigationView{
            List{
                URLImageHome(urlString: "https://www.themealdb.com/images/category/dessert.png")
                    .listRowInsets(EdgeInsets())
                DessertCategoryRow()
                    .listRowInsets(EdgeInsets())
                CategoryRow()
                    .listRowInsets(EdgeInsets())
                ChickenCategoryRow()
                    .listRowInsets(EdgeInsets())
                
            }
            .listStyle(.inset)
            .navigationTitle("MealMe")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
        }
        
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
