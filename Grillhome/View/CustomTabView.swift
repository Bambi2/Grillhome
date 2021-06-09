//
//  CustomTabView.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 01.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

struct CustomTabView: View {
    var menu = ["house", "magnifyingglass", "cart", "heart", "person"]
    @Binding var selectedItem: Int
//    @State private var selectedItem = 0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.black)
                .frame(height: 1)
            HStack() {
                ForEach(0..<5) { index in
                    Group {
                        Spacer()
                        Button(action: {
                            self.selectedItem = index
                        }, label: {
                            Image(systemName: self.menu[index])
                                .foregroundColor(self.selectedItem == index ? colorRed : .black)
                                .font(.system(size: 26, weight: .thin))
                                .padding(.bottom, 15)
                        })
                        Spacer()
                    }
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.08)
        }
        
        

    }
    
}




//struct CustomTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView()
//    }
//}
