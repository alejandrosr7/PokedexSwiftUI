//
//  MasterBallLoaderView.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 3/06/21.
//

import SwiftUI

struct MasterBallLoaderView: View {

    @State var rotation = 0
    @State var isRotating = false

    var animation: Animation {
        Animation.linear.repeatForever(autoreverses: false)
    }

    var body: some View {
        ZStack {
            Image("masterBall")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(Angle.degrees(isRotating ? 360:0))
                .animation(animation)
                
                
                .onAppear {
                    isRotating = true
                }

                .onDisappear {
                    isRotating = false
                }
        }
    }
}

struct MasterBallLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        MasterBallLoaderView().previewLayout(.sizeThatFits)
    }
}
