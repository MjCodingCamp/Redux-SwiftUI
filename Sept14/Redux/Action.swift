//
//  Action.swift
//  Sept14
//
//  Created by Mohammed Jeeshan on 24/09/21.
//

protocol Action {}

struct CheckLogin:Action {}
struct FetchMovies :Action {}
struct FetchUserName :Action {}

struct DoLogin:Action {
    let userName:String
    let password:String
}

struct DoSignup :Action {
    let userName:String
    let userEmail:String
    let password:String
}

struct SaveLogin:Action {
    let loginStatus:Bool
    init(status:Bool) {
        self.loginStatus = status
    }
}

struct SaveSignup:Action {
    let signupStatus:Bool
    init(status:Bool) {
        self.signupStatus = status
    }
}

struct SaveAppLogin:Action {
    let loginStatus:Bool
    init(status:Bool) {
        self.loginStatus = status
    }
}

struct SaveUserName:Action {
    let userName:String
    init(userName:String) {
        self.userName = userName
    }
}

struct SaveMovies:Action {
    let moviesData:[Results]
    init(moviesData:[Results]) {
        self.moviesData = moviesData
    }
}
