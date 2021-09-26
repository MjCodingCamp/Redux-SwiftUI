//
//  Store.swift
//  Sept14
//
//  Created by Mohammed Jeeshan on 24/09/21.
//

import SwiftUI

class AppState: ObservableObject {
    var loginStatus:Bool = false
    @Published var moviesData = [Results]()
    @Published var userName:String = ""
    @Published var alertMessage:String = ""
    @Published var alertStatus = false
    @Published var indicatorStatus = false
    @Published var updateLogin:Bool = false
}

class Store: ObservableObject{
    @Published var state:AppState
    var reducer:Reducer
    var middleware:[Middleware]
   
    init(state:AppState, reducer:@escaping Reducer, middleware:[Middleware] = []) {
        self.state = state
        self.reducer = reducer
        self.middleware = middleware
    }

    func dispatch(_ action:Action) {
        middleware.forEach{ middleware in
            middleware(state, action, dispatch)
        }
        self.state = self.reducer(self.state, action)
    }
}
