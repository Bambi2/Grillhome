//
//  ProductTypeView.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 19.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductTypeView: View {
    //Providing Data
    var productType: ProductType
    
    var body: some View {
        VStack(spacing: 0) {
            WebImage(url: URL(string: productType.image) )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45, alignment: .center)
            Text(productType.type)
                .foregroundColor(.black)
                .font(.headline)
                .fontWeight(.black)
        }
    }
}

struct ProductTypeView_Previews: PreviewProvider {
    static var previews: some View {
        ProductTypeView(productType: productTypes[2])
    }
}
