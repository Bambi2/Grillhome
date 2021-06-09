//
//  Constant.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 27.04.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

// COLOR

let colorLightGrey: Color = Color("ColorLightGrey")
let colorRed: Color = Color("ColorRed")


//Temp Data
let productTypes: [ProductType] = [
    ProductType(id: 1, image: "Charcoal", type: "Угольные", title: "Угольные грили"),
    ProductType(id: 2, image: "Gas", type: "Газовые", title: "Газовые грили"),
    ProductType(id: 3, image: "Electro", type: "Электрические", title: "Электрические грили"),
    ProductType(id: 4, image: "Accessories", type: "Аксессуары", title: "Аксессуары")
]

let sliderImages: [UIImage] = [
    UIImage(named: "firstSlider")!,
    UIImage(named: "secondSlider")!,
    UIImage(named: "thirdSlider")!
]

let products: [Product] = [
    Product(id: 1, image: "smokeyJoe", price: 8900, name: "Гриль-Барбекю угольный Weber Smokey Joe Premium, 37 Cm, Черный", type: "Угольные", isAvailable: true),
    Product(id: 2, image: "goAnywhere", price: 9900, name: "Гриль-Барбекю угольный Weber Smokey Joe Premium, 37 Cm, Черный", type: "Угольные", isAvailable: true),
    Product(id: 3, image: "compactKettle47", price: 9900, name: "Гриль-Барбекю угольный Weber Smokey Joe Premium, 37 Cm, Черный", type: "Угольные", isAvailable: false),
    Product(id: 4, image: "compactKettle57", price: 13900, name: "Гриль-Барбекю угольный Weber Smokey Joe Premium, 37 Cm, Черный", type: "Угольные", isAvailable: true),
    Product(id: 5, image: "originalKettleE4710", price: 16900, name: "Гриль-Барбекю угольный Weber Smokey Joe Premium, 37 Cm, Черный", type: "Угольные", isAvailable: false)
]

var charcoalGrills: [Product] {
    var charcoalGrills: [Product] = []
    
    for grill in products {
        if grill.type == "charcoal" {
            charcoalGrills.append(grill)
        }
    }
    
    return charcoalGrills
}






var gridLayout: [GridItem] = [
    GridItem(.flexible(), spacing: 15),
    GridItem(.flexible(), spacing: 15)
]

var productsPageGrid: [GridItem] = [
    GridItem(.flexible(), spacing: 0),
    GridItem(.flexible(), spacing: 0)
]

