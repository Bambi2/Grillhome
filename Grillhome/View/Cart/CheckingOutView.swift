//
//  CheckingOutView.swift
//  Grillhome
//
//  Created by Parasochka Danil on 31.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

struct CheckingOutView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        homeViewModel.isCheckingOutShowing = false
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.leading, 20)
                    })
                    
                    Spacer()
                }
                HStack {
                    Text("Введите данные")
                        .font(.title3)
                        .fontWeight(.black)
                }
            }
            VStack {
                TextField("Имя", text: $homeViewModel.userName)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.black)
                    .font(.headline)
                TextField("Адрес", text: $homeViewModel.address)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.black)
                    .font(.headline)
                TextField("Телефон", text: $homeViewModel.phoneNumber)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.black)
                    .font(.headline)
            }
            .padding()
            Button(action: {homeViewModel.makeOrder()}, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(homeViewModel.isOrdered ? .green : .red)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 65, alignment: .center)
                    
                    Text(homeViewModel.isOrdered ? "Товар доставляется" : "Подтвердить заказ")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
            })
            Spacer()
        }
    }
}

struct CheckingOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckingOutView().environmentObject(HomeViewModel())
    }
}
