//
//  URL+Extension.swift
//  FreeMeal
//
//  Created by Changhyun Kim on 4/24/23.
//

import Foundation

extension URL {
    
    static func forDessertBy(_ id: String) -> URL? {
        return URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")
    }
}
