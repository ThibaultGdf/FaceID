//
//  ContentViewModel.swift
//  FaceID
//
//  Created by Thibault GODEFROY on 20/11/2023.
//

import Foundation
import LocalAuthentication

class ContentViewModel: ObservableObject {
    @Published var isUnlocked: Bool = false
    func authentificate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authentificationError in
                if success {
                    self.isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

