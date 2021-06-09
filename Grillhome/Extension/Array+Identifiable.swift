//
//  Array+Identifiable.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 20.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import Foundation


extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in self.indices {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
