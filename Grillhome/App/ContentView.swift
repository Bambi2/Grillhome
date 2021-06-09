//
//  ContentView.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 27.04.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItem: Int = 0
    @State private var isHeaderAnimated = false
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            if selectedItem == 0 {
                
                HomeView(isHeaderAnimated: $isHeaderAnimated).environmentObject(homeViewModel)
            }
            else if selectedItem == 1{
                SearchView().environmentObject(homeViewModel)
            }
            else if selectedItem == 2{
                ShoppingCartView().environmentObject(homeViewModel)
            }
            else if selectedItem == 3{
                WishlistView()
            }
            else {
                UserPageView()
            }
            CustomTabView(selectedItem: $selectedItem)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
