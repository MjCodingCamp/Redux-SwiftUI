//
//  Reducer.swift
//  Sept14
//
//  Created by Mohammed Jeeshan on 24/09/21.
//

typealias Reducer = (AppState, Action) -> AppState

func reducer(state:AppState, action:Action) -> AppState{
    let state = state
    if let action = action as? SaveAppLogin{
        state.loginStatus = action.loginStatus
    }
    if let action = action as? SaveLogin{
        if action.loginStatus {
            state.updateLogin = action.loginStatus
            state.indicatorStatus = false
        }else{
            state.alertMessage = "Invalid User Details"
            state.alertStatus = true
            state.indicatorStatus = false
        }
    }
    if let action = action as? SaveSignup{
        if action.signupStatus {
            state.alertMessage = "Account created successfully"
            state.alertStatus = true
            state.indicatorStatus = false
        }else{
            state.alertMessage = "Please fill all details"
            state.alertStatus = true
            state.indicatorStatus = false
        }
    }
    if let action = action as? SaveUserName{
        state.userName = action.userName
    }
    if let action = action as? SaveMovies{
        state.moviesData = action.moviesData
    }
    return state
}
