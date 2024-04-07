//
//  File4.swift
//  CW Final Year
//
//  Created by Thilini Gunawardhana on 2024-04-07.
//

import Foundation
import SwiftUI

struct ShoppingGalleryView: View {
    @State private var showAlert = false
    @State private var selectedProduct: Product?
    var products: [Product]
    @Binding var cart: [Product]
    var addToCart: (Product) -> Void
    
    var body: some View {
        NavigationView {
            List(products, id: \.id) { product in
                NavigationLink(destination: ProductDetailView(product: product, cart: $cart, addToCart: addToCart, viewState: .constant(.gallery))) {
                    ProductRowView(product: product, addToCart: addToCart)
                }
            }
            .navigationBarTitle("Shopping Gallery")
        }
    }
}
struct ShoppingGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

