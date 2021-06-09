//
//  UserPageView.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 01.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI

struct UserPageView: View {
    var body: some View {
        VStack {
            Text("Аккаунт")
            Image("User")
            Text("Здравствуйте,")
                .font(.caption)
            Text("Александра Седельникова")
                .font(.title3)
            Spacer()
        }
        
    }
}

struct UserPageView_Previews: PreviewProvider {
    static var previews: some View {
        UserPageView()
    }
}
