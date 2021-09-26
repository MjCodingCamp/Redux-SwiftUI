//
//  Sept14App.swift
//  Sept14
//
//  Created by Mohammed Jeeshan on 14/09/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

var store = Store(state: AppState(), reducer: reducer, middleware: [middleware()])

@main
struct Sept14App: App {
    init() {
        FirebaseApp.configure()
        store.dispatch(CheckLogin())
    }
    
    var body: some Scene {
        WindowGroup {
            if store.state.loginStatus{
                HomeView().environmentObject(store)
            }else{
                LoginView().environmentObject(store)
            }
        }
    }
}
