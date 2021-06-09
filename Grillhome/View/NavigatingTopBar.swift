//
//  NavigatingTopBar.swift
//  Grillhome
//
//  Created by Parasochka Danil on 30.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

//import SwiftUI
//
//struct NavigatingTopBar: View {
//    var body: some View {
//        HStack() {
//            Image(systemName: "chevron.left")
//                .font(.title)
//                .foregroundColor(.black)
//                .onTapGesture {
//                    withAnimation(.easeOut) {
//                        homeViewModel.selectedProductType = nil
//                    }
//                }
//                .padding(.horizontal, 5)
//            Spacer()
//            Text(homeViewModel.selectedProductType?.title ?? "")
//                .font(.title2)
//                .fontWeight(.black)
//            Spacer()
//            
//        }
//        .padding(15)
//    }
//}
//
//struct NavigatingTopBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigatingTopBar()
//    }
//}
