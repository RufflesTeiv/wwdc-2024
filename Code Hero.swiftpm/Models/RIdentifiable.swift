//
//  RIdentifiable.swift
//
//
//  Created by Rafa (Ruffles) on 21/02/24.
//

import Foundation

class RIdentifiable {
    let name : String
    let identifier : String
    
    init(name: String) {
        self.name = name
        self.identifier = name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
}
