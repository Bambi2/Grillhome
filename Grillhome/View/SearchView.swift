//
//  SearchView.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 01.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Text("Поиск")
            Divider()
            ZStack {
                Rectangle()
                    .cornerRadius(15)
                    .foregroundColor(.gray)
                    .opacity(0.4)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50, alignment: .center)
                HStack {
                    Button(action: {homeViewModel.searchData()}, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding(.leading, 30)
                            .padding(.trailing, 5)
                    })
                    
                    TextField("Например: Газовый гриль", text: $homeViewModel.search)
                        .font(.caption)
                        .foregroundColor(.black)
                    
                }
            }
            Divider()
            
            ScrollView {
                ForEach(homeViewModel.filtered) { product in
                    ProductPreviewView(product: product).environmentObject(homeViewModel)
                }
            }
            
            Spacer()
        }
        //        VStack {
        //            Text("Поиск")
        //            Divider()
        //            HStack(spacing: 15) {
        //                if homeViewModel.search == "" {
        //                    Image(systemName: "magnifyingglass")
        //                        .font(.title2)
        //                        .foregroundColor(.black)
        //                }
        //                TextField("Поиск", text: $homeViewModel.search)
        //                if homeViewModel.search != "" {
        //                    Button(action: {homeViewModel.searchData()}, label: {
        //                        Image(systemName: "magnifyingglass")
        //                            .font(.title2)
        //                            .foregroundColor(.black)
        //                    })
        //                    .animation(.easeIn)
        //                }
        //            }
        //            .padding(10)
        //            .frame(height: 40)
        //            .cornerRadius(10.0)
        //            .background(Color.gray)
        //
        //            ScrollView {
        //                ForEach(homeViewModel.filtered) { product in
        //                    ProductPreviewView(product: product).environmentObject(homeViewModel)
        //                }
        //            }
        //
        //            Spacer()
        //        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
