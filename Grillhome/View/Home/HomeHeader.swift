//
//  HomeHeader.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 03.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI


struct HomeHeader: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 117, height: 40, alignment: .center)
    }
}
