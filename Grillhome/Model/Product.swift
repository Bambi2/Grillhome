//
//  Product.swift
//  Grillhome
//
//  Created by Parasochka Danil on 22.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import Foundation


struct Product: Identifiable {
    var id: Int
    var image: String
    var price: Int
    var name: String
    var type: String
    var isAvailable: Bool
    
    var isAdded: Bool = false
}
