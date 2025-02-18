//
//  DismissView.swift
//  RickAndMortyUiKit
//
//  Created by Mario Saldana on 18/02/25.
//

import SwiftUI

struct DismissView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Spacer()
            Button("Cerrar") {
                dismiss()
            }
            .tint(.black)
            .padding(.trailing, 12)
        }
        .textFieldStyle(.roundedBorder)
        .buttonStyle(.bordered)
    }
}
