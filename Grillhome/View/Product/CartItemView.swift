//
//  CartItemView.swift
//  Grillhome
//
//  Created by Parasochka Danil on 30.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemView: View {
    var cart: Cart
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    
    var body: some View {
        VStack {
            HStack {
                isAvailableView(product: cart.product)
                Spacer()
            }
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    WebImage(url: URL(string: cart.product.image))
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4, alignment: .center)
                }
                VStack(alignment: .leading) {
                    Text("\(cart.product.price) руб.")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Spacer()
                    Text(cart.product.name)
                        .foregroundColor(.gray)
                        .font(.caption)
                    Spacer()
                    Text("Кол-во: \(cart.quantity)")
                    Spacer()
                    HStack {
                        Button(action: {
                            homeViewModel.increaseQuantity(of: cart)
                        }, label: {
                            Image(systemName: "plus")
                                .font(.title3)
                                .foregroundColor(.black)
                        })
                        .padding(.trailing, 15)
                        
                        Button(action: {
                            homeViewModel.decreaseQuantity(of: cart)
                        }, label: {
                            Image(systemName: "minus")
                                .font(.title3)
                                .foregroundColor(.black)
                        })
                    }
                }
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}

//struct CartItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartItemView(product: products[0]).environmentObject(HomeViewModel())
//    }
//}
