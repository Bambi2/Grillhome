//
//  isAvailableView.swift
//  Grillhome
//
//  Created by Parasochka Danil on 24.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

struct isAvailableView: View {
    var product: Product

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke()
                .frame(width: 87, height: 26, alignment: .center)
                .foregroundColor(product.isAvailable ? .green : .red)
            Text(product.isAvailable ? "В наличии".uppercased() : "Под заказ".uppercased() )
                .foregroundColor(product.isAvailable ? .green : .red)
                .font(.caption)
        }
    }
}

struct isAvailableView_Previews: PreviewProvider {
    static var previews: some View {
        isAvailableView(product: products[0])
    }
}
