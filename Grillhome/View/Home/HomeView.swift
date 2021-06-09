//
//  HomeView.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 01.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var isHeaderAnimated: Bool
//    @State private var isAnimated: Bool = false
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        
        VStack {
            if homeViewModel.selectedProductType == nil {
                VStack {
                    HomeHeader()
                        .padding(.horizontal)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .opacity(isHeaderAnimated ? 1 : 0)
                        .offset(x: 0, y: isHeaderAnimated ? 0 : -25)
                        .onAppear {
                            withAnimation(.easeOut(duration: 0.5)) {
                                self.isHeaderAnimated = true
                            }
                        }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        SliderView(sliderItems: homeViewModel.sliderItems)
                            .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.width * 0.472, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.bottom)
                        LazyVGrid(columns: gridLayout, spacing: 0) {
                            ForEach(homeViewModel.productTypes) { productType in
                                Button(action: {
                                    homeViewModel.selectedProductType = productType
                                }, label: {
                                    ProductTypeView(productType: productType)
                                }
                                )
                            }
                        }
                    }
                }
            }
            else {
                ProductsPage(productType: homeViewModel.selectedProductType!).environmentObject(homeViewModel)
            }
        }
        
    }
}


//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView().environmentObject(HomeViewModel())
//    }
//}


