//
//  StateButton.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 3/06/21.
//

import SwiftUI

struct StateButton: View {
    @Binding var provider: Bool
    var buttonOne: String
    var buttonTwo: String
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    self.provider = true
                }
            }) {
                Text(buttonOne)
                    .foregroundColor(self.provider == true ? .black : .white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(width: (UIScreen.main.bounds.width - 50) / 2)
            }.background(self.provider == true ? Color.white : Color.clear)
                .clipShape(Capsule())
            
            Button(action: {
                withAnimation {
                    self.provider = false
                }
            }) {
                Text(buttonTwo)
                    .foregroundColor(self.provider == false ? .black : .white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(width: (UIScreen.main.bounds.width - 50) / 2)
            }.background(self.provider == false ? Color.white : Color.clear)
                .clipShape(Capsule())
        }.background(Color.black.opacity(0.1))
            .clipShape(Capsule())
    }
}

struct StateButton_Previews: PreviewProvider {
    static var previews: some View {
        StateButton(provider: .constant(true), buttonOne: "", buttonTwo: "").previewLayout(.sizeThatFits)
    }
}
