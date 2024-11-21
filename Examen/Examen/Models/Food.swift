//
//  Food.swift
//  Examen
//
//  Created by epismac on 21/10/24.
//

import Foundation
		
struct Food: Identifiable, Codable {
    let id = UUID()
    let name: String
    let calories: Double
    let protein: Double
    let fat: Double
    let carbs: Double
}
		
