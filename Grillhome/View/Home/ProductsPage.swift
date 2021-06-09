//
//  ProductsPage.swift
//  Grillhome
//
//  Created by Parasochka Danil on 22.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI


struct ProductsPage: View {
    var productType: ProductType
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            if homeViewModel.selectedProduct == nil {
                VStack {
                    ZStack {
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding(.leading, 20)
                                .onTapGesture {
                                    withAnimation {
                                        homeViewModel.selectedProductType = nil
                                    }
                                }
                            Spacer()
                        }
                        HStack {
                        Text(productType.title)
                            .font(.title3)
                            .fontWeight(.black)
                        }
                        
                    }
                    .padding(.vertical,10)
                    
                    ScrollView {
                        LazyVGrid(columns: productsPageGrid, spacing: 20) {
                            ForEach(homeViewModel.products) { product in
                                if productType.type == "Угольные" {
                                    if product.type == "Угольные" {
                                        ProductPreviewView(product: product).environmentObject(homeViewModel)
                                    }
                                }
                                else if productType.type == "Газовые" {
                                    if product.type == "Газовые" {
                                        ProductPreviewView(product: product).environmentObject(homeViewModel)
                                    }
                                }
                                else if productType.type == "Электрические" {
                                    if product.type == "Электрические" {
                                        ProductPreviewView(product: product).environmentObject(homeViewModel)
                                    }
                                }
                                else if productType.type == "Аксессуары" {
                                    if product.type == "Аксессуары" {
                                        ProductPreviewView(product: product).environmentObject(homeViewModel)
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
            else {
                ProductView(product: homeViewModel.selectedProduct!).environmentObject(homeViewModel)
            }
        }
    }
}



//struct ProductsPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductsPage(products: products).environmentObject(HomeViewModel())
//    }
//}
