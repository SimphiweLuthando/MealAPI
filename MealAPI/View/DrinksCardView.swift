//
//  DrinksCardView.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/14.
//

import SwiftUI

struct DrinksCardView: View {
    @StateObject var viewModel = ViewModel()
    
    var drink: Drink
    
    let cardAndImageWidth: CGFloat = 170
    let cardHeight: CGFloat = 174
    let imageHeight: CGFloat = 116
    let cornerRadius: CGFloat = 5
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(SwiftUI.Color.gray, lineWidth: 0)
                .frame(width: cardAndImageWidth, height: cardHeight)
            
            
            VStack(alignment: .leading, spacing: 10) {
                URLImage1(urlString: drink.strDrinkThumb)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardAndImageWidth, height: imageHeight)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(drink.strDrink)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Drink")
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
}

struct DrinksCardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDrink = Drink(
           idDrink: "15346", strDrink: "155 Belmont",
           strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/yqvvqs1475667388.jpg"
               )
        DrinksCardView(drink: sampleDrink)
    }
}
