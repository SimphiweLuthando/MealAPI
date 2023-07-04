//
//  ContentView.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/06/29.
//

import SwiftUI



struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
            case home
            case list
            case drinksList
            case search
        }

  
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        TabView(selection: $selection) {
                    CategoryHome()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                        .tag(Tab.home)


                    MealListView()
                .tabItem {
                    Label("Meals", systemImage: "fork.knife.circle")
                }
                        .tag(Tab.list)
            
            DrinksListView()
                .tabItem{
                    Label("Drinks", systemImage: "wineglass")
                }
                .tag(Tab.drinksList)
            SearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
                }
            

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
