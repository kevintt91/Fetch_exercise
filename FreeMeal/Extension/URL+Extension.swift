//
//  URL+Extension.swift
//  FreeMeal
//
//  Created by 김창현 on 4/24/23.
//

import Foundation

extension URL {
    
    static func forDessertBy(_ id: String) -> URL? {
        // ex 1) 52772
        return URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")
    }
}
