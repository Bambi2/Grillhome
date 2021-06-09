//
//  SliderItemView.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 11.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI


struct SliderItemView: View {
    var sliderItem: SliderItem
    
    var body: some View {
        WebImage(url: URL(string: sliderItem.imageURLString))
                    .resizable()
                    .scaledToFill()
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.472, alignment: .center)
                    .cornerRadius(12)
    }
}


//struct SliderItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderItemView(image: sliderImages[1])
//    }
//}
