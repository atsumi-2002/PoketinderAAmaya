//
//  LaunchViewModel.swift
//  iOSAppTemplate
//
//  Created by MAC34 on 13/06/22.
//

import Foundation

class LaunchViewModel: ObservableObject {
    
    let appState = AppState.shared
    
    init() {
        appState.currentScreen = .home
    }
}
