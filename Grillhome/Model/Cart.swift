//
//  Cart.swift
//  Grillhome
//
//  Created by Parasochka Danil on 28.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import Foundation



struct Cart: Identifiable {
    var id = UUID().uuidString
    var product: Product
    var quantity: Int
}
