//
//  HiddenNavigationBar.swift
//  Grillhome
//
//  Created by Parasochka Danil on 05.06.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
