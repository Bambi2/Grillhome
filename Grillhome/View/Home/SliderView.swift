//
//  SliderView.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 12.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    var sliderItems: [SliderItem]
    
    var body: some View {
        
        TabView {
            ForEach(sliderItems) { item in
                SliderItemView(sliderItem: item)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}


//struct SliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderView(sliderItems: sliderImages)
//    }
//}


