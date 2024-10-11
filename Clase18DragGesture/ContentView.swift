//
//  ContentView.swift
//  Clase18DragGesture
//
//  Created by Escurra Colquis on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var gesture = CGSize.zero
    @State private var currentPosition = CGSize.zero
    
    var body: some View {
        Text("DragGesture")
            .bold()
            .foregroundStyle(.black)
            .font(.system(size: 20))
            .padding(.top, 20)
        Spacer()
        Image(systemName: "clock")
            .font(.system(size: 100))
            .foregroundStyle(.indigo)
            .offset(x: currentPosition.width + gesture.width, y: currentPosition.height + gesture.height)
            .animation(.easeInOut, value: gesture)
            .gesture(
                DragGesture()
                    .updating($gesture, body: { value, state, transaction in
                        state = value.translation
                    })
                    .onEnded({
                        value in
                        currentPosition.height += value.translation.height
                        currentPosition.width += value.translation.width
                    })
            )
        Spacer()
        VStack {
            Text("Mi canal en Youtube y Github:")
            Text("@escurradeveloper")
                .bold()
                .font(.system(size: 30))
        }
    }
}

#Preview {
    ContentView()
}
