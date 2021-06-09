//
//  ProductView.swift
//  Grillhome
//
//  Created by Parasochka Danil on 22.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductView: View {
    var product: Product
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                        .onTapGesture {
                            homeViewModel.selectedProduct = nil
                        }
                    Spacer()
                }
                HStack {
                    Text(homeViewModel.selectedProductType?.title ?? "")
                        .font(.title3)
                        .fontWeight(.black)
                }
            }
            .padding(.vertical, 10)
            
            ScrollView {
                WebImage(url: URL(string: product.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8, alignment: .center)
                    .padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(product.price) руб.")
                            .font(.subheadline)
                            .fontWeight(.black)
                        Text(product.name)
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Spacer()
                    isAvailableView(product: product)
                        .padding(.leading, 15)
                }
                .padding(.horizontal)
                Spacer()
            }
//            Spacer()
            Button(action: {
                homeViewModel.addToCart(product: product)
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(homeViewModel.products[homeViewModel.getIndex(product: product, isCartIndex: false)].isAdded ? .black : .red)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 65, alignment: .center)
                    Text(homeViewModel.products[homeViewModel.getIndex(product: product, isCartIndex: false)].isAdded ? "Убрать из корзины" : "Добавить в корзину")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
            })
        }
    }
}

//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView(product: products[0])
//    }
//}
