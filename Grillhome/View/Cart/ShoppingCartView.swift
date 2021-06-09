//
//  ShoppingCartView.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 01.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

struct ShoppingCartView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            if !homeViewModel.isCheckingOutShowing {
                VStack {
                    Text("Корзина")
                        .font(.title3)
                        .fontWeight(.black)
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1)
                    Text(homeViewModel.cartItems.count == 1 ? "\(homeViewModel.cartItems.count) товар: на \(homeViewModel.calculateCartPrice()) руб." : "\(homeViewModel.cartItems.count) товара: на \(homeViewModel.calculateCartPrice()) руб." )
                        .padding(.vertical, 5)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1)
                    ScrollView {
                        ForEach(homeViewModel.cartItems) { cart in
                            CartItemView(cart: cart).environmentObject(homeViewModel)
                            Divider()
                        }
                    }
                    Spacer()
                    Button(action: {
                        homeViewModel.isCheckingOutShowing = true
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.red)
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 65, alignment: .center)
                            
                            Text("Перейти к оформлению")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    })
                }
            } else {
                CheckingOutView().environmentObject(homeViewModel)
            }
        }
        
        
    }
}

//struct ShoppingCartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShoppingCartView()
//    }
//}
