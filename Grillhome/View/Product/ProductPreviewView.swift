//
//  ProductPreviewView.swift
//  Grillhome
//
//  Created by Parasochka Danil on 22.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductPreviewView: View {
    var product: Product
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        Button(action: {
            homeViewModel.selectedProduct = product
        }, label: {
            VStack(alignment: .leading, spacing: 5) {
                isAvailableView(product: product)
                    .padding(.bottom)
                WebImage(url: URL(string: product.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4, alignment: .leading)
                HStack {
                    Text("\(product.price) руб.")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Spacer()
                    Image(systemName: "heart")
                        .padding(.trailing)
                }
                .foregroundColor(.black)
                Text(product.name)
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 20)
        })
        
    }
}

//struct ProductPreviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductPreviewView(product: products[0])
//    }
//}
