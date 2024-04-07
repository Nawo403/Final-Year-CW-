//
//  File2.swift
//  CW Final Year
//
//  Created by Thilini Gunawardhana on 2024-04-07.
//

import Foundation
import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @Binding var cart: [Product]
    var addToCart: (Product) -> Void
    @Binding var viewState: ContentView.ViewState
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Text(product.name)
                .font(.title)
                .padding()
            Text("Price: $\(product.price)")
                .font(.headline)
            Spacer()
            
            Button(action: {
                addToCart(product)
                viewState = .cart
            }) {
                Text("Add to cart")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationBarTitle(product.name)
    }
}
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
