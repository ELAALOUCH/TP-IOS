//
//  ContentView.swift
//  Loto
//
//  Created by Mohammed Yassine EL AALOUCH on 04/03/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numeros: [Int] = []
    @State private var chance: Int = 0
    @State private var aJoue: Bool = false
    
    func tirage() {
        var set = Set<Int>()
        while set.count < 5 {
            set.insert(Int.random(in: 1...49))
        }
        numeros = set.sorted()
        chance = Int.random(in: 1...10)
        aJoue = true
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                // Titre
                VStack(spacing: 4) {
                    Text("LOTO")
                        .font(.system(size: 40, weight: .black))
                        .tracking(8)
                    Text("Tentez votre chance")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 60)
                
                // Résultat
                VStack(spacing: 24) {
                    
                    VStack(spacing: 12) {
                        Text("Numéros")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .textCase(.uppercase)
                            .tracking(2)
                        
                        HStack(spacing: 10) {
                            if aJoue {
                                ForEach(numeros, id: \.self) { n in
                                    Boule(nombre: n, couleur: .blue)
                                }
                            } else {
                                ForEach(0..<5) { _ in
                                    Boule(nombre: nil, couleur: .blue)
                                }
                            }
                        }
                    }
                    
                    Divider()
                    
                    // Numéro chance
                    VStack(spacing: 12) {
                        Text("Numéro chance")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .textCase(.uppercase)
                            .tracking(2)
                        
                        Boule(nombre: aJoue ? chance : nil, couleur: .orange)
                    }
                }
                .padding(28)
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.06), radius: 16, x: 0, y: 4)
                .padding(.horizontal, 24)
                
                Spacer()
                
                // Btn
                Button(action: tirage) {
                    Text("Lancer le tirage")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    ContentView()
}
