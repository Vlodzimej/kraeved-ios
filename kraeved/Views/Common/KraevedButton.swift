//
//  KraevedButton.swift
//  kraeved
//
//  Created by Владимир Амелькин on 25.02.2024.
//

import SwiftUI

struct KraevedButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()

        } label: {
            Text(LocalizedStringKey(title))
                .frame(maxWidth: .infinity, maxHeight: 28)
            
        }
        .buttonStyle(.borderedProminent)
        .tint(Color.Pallete.viridian)
        .padding(16)
    }
}

#Preview {
    KraevedButton(title: "Test") {
        
    }
}
