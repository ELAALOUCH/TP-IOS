//
//  Boule.swift
//  Loto
//
//  Created by Mohammed Yassine EL AALOUCH on 04/03/2026.
//

import SwiftUI

struct Boule: View {
    let nombre: Int?
    let couleur: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(nombre != nil ? couleur : Color(.systemGray5))
                .frame(width: 52, height: 52)
            
            Text(nombre != nil ? "\(nombre!)" : "?")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(nombre != nil ? .white : Color(.systemGray3))
        }
    }
}
