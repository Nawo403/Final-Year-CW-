//
//  File3.swift
//  CW Final Year
//
//  Created by Thilini Gunawardhana on 2024-04-07.
//


import Foundation
import SwiftUI

struct ProductRowView: View {
    let product: Product
    var addToCart: (Product) -> Void
    
    var body: some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(product.name)
                Text("Price: $\(product.price)")
                    .font(.subheadline)
                HStack {
                    ForEach(product.collections, id: \.self) { collection in
                        Text(collection)
                            .font(.caption)
                            .padding(.horizontal, 4)
                            .background(Color.cyan.opacity(0.2))
                            .cornerRadius(4)
                    }
                }
            }
            Spacer()
            Button(action: {
                addToCart(product)
            }) {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.cyan.opacity(0.2))
                    .font(.title)
            }
        }
        .padding()
    }
}
struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
