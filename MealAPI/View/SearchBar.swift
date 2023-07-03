//
//  SearchBar.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/02.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void = {}
    
    var body: some View {
        HStack {
             TextField("Search", text: $text,  onCommit: {
                 onSearch()
                 hideKeyboard()
             })
                 .padding(8)
                 .background(Color(.systemGray6))
                 .cornerRadius(8)
             
             Button(action: {
                 onSearch()
                 hideKeyboard()
             }) {
                 Image(systemName: "magnifyingglass")
                     .foregroundColor(.gray)
                     .padding(8)
             }
         }
         .padding()
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchBar_Previews: PreviewProvider {
    @State static var searchText = ""
    
    static var previews: some View {
        SearchBar(text: $searchText)
    }
}

