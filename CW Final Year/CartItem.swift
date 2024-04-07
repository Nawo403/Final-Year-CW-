//
//  File.swift
//  CW Final Year
//
//  Created by Thilini Gunawardhana on 2024-04-07.
//

import Foundation
import SwiftUI

struct CartItemView: View {
    let product: Product
    var removeFromCart: (Product) -> Void
    
    var body: some View {
        HStack {
            Text(product.name)
            Spacer()
            Button(action: {
                removeFromCart(product)
            }) {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.red)
            }
        }
    }
}
struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
