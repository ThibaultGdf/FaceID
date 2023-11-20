//
//  ContentView.swift
//  FaceID
//
//  Created by Thibault GODEFROY on 20/11/2023.
//

import SwiftUI
import LocalAuthentication

// MARK: - ContentView

struct ContentView: View {
    // MARK: Properties
    
    @StateObject var viewModel = ContentViewModel()
    
    // MARK: Body
    
    var body: some View {
        VStack {
            if viewModel.isUnlocked {
                Text("Application unlocked")
                ZStack {
                    Circle()
                        .stroke(Color.green, lineWidth: 2)
                        .frame(width: 200, height: 100)
                    Image("unlocked")
                }
                Button {
                    viewModel.isUnlocked = false
                } label: {
                    Text("Close")
                }
            } else {
                Text("Application locked")
                ZStack {
                    Circle()
                        .stroke(Color.red, lineWidth: 2)
                        .frame(width: 200, height: 100)
                    Image("locked")
                }
                
                Button {
                    viewModel.authentificate()
                    viewModel.isUnlocked = false
                } label: {
                    Text("Open")
                }
            }
        }.onAppear(perform: viewModel.authentificate)
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
