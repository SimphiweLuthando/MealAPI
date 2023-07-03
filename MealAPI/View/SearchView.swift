//
//  SearchView.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/02.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var searchResults: [Meal] = []
    
    var body: some View {
        VStack {
            
            
            SearchBar(text: $searchText, onSearch: search)
            
            if searchResults.isEmpty {
                Text("No results")
                    .foregroundColor(.gray)
            } else {
                
                
                List(searchResults, id: \.self) { meal in
                    NavigationLink(destination: MealDetailsView(meal: meal)) {
                        HStack {
                            URLImage(urlString: meal.strMealThumb)
                            Text(meal.strMeal)
                            Spacer()
                        }
                        .padding(3)
                    }
                }
            }
        }
    }
    
    
    
    private func search() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(searchText)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("API request error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(ReturnedObject.self, from: data)
                    DispatchQueue.main.async {
                        searchResults = response.meals
                    }
                } catch {
                    print("JSON decoding error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
