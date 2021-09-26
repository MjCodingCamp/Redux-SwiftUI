//
//  Middleware.swift
//  Sept14
//
//  Created by Mohammed Jeeshan on 24/09/21.
//

import FirebaseAuth
import FirebaseDatabase

typealias Dispatcher = (Action) -> Void
typealias Middleware = (AppState, Action, @escaping Dispatcher) -> Void

func middleware() -> Middleware {
    return{ state, action, dispatch in
        if let _ = action as? CheckLogin{
            let user = FirebaseAuth.Auth.auth().currentUser
            if user == nil{
                store.dispatch(SaveAppLogin(status: false))
            }else{
                store.dispatch(SaveAppLogin(status: true))
            }
        }
        if let action = action as? DoLogin{
            loginUser(userName: action.userName, password: action.password) { res in
                store.dispatch(SaveLogin(status: res))
            }
        }
        if let action = action as? DoSignup{
            createUser(userName: action.userName, userEmail: action.userEmail, password: action.password) { res in
                store.dispatch(SaveSignup(status: res))
            }
        }
        if let _ = action as? FetchUserName{
            fetchUserName { username in
                store.dispatch(SaveUserName(userName: username))
            }
        }
        if let _ = action as? FetchMovies{
            fetchMovies { movies in
                store.dispatch(SaveMovies(moviesData: movies))
            }
        }
    }
}

func loginUser(userName:String, password:String, completion: @escaping (Bool) -> Void)  {
    FirebaseAuth.Auth.auth().signIn(withEmail: userName, password: password) { result, error in
        if error == nil{
            print("Login Success")
            completion(true)
        }else{
            print("Login Failed")
            completion(false)
        }
    }
}

func createUser(userName:String, userEmail:String, password:String,  completion: @escaping(Bool)->Void) {
    if !userName.isEmpty && !userEmail.isEmpty && !password.isEmpty{
        FirebaseAuth.Auth.auth().createUser(withEmail: userEmail, password: password) { result, error in
            if error == nil{
                if let uid = result?.user.uid{
                    let firebaseRef = FirebaseDatabase.Database.database().reference()
                    let userData = ["Name":userName, "Email":userEmail]
                    firebaseRef.child(uid).setValue(userData)
                    try? FirebaseAuth.Auth.auth().signOut()
                    completion(true)
                }
            }
        }
    }else{
        completion(false)
    }
}


func fetchMovies(completion:@escaping ([Results]) -> Void){
    var moviesData = [Results]()
    if let url = URL(string: Link.ApiLink){
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if data != nil {
                if let data = data{
                    do{
                        let result = try JSONDecoder().decode(MovieModel.self, from: data)
                        if let moviesDetail = result.results{
                            for item in moviesDetail {
                                moviesData.append(item)
                            }
                            completion(moviesData)
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }.resume()
    }
}

func fetchUserName(completion: @escaping (String) -> Void) {
    let firebaseRef = FirebaseDatabase.Database.database().reference()
    if let uid = FirebaseAuth.Auth.auth().currentUser?.uid{
        firebaseRef.child(uid).child("Name").observeSingleEvent(of: .value) { snapshot in
            if let name = snapshot.value as? String{
                completion(name)
            }
        }
    }
}
