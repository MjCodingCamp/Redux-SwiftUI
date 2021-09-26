//
//  ContentView.swift
//  Sept14
//
//  Created by Mohammed Jeeshan on 14/09/21.
//

import SwiftUI
import FirebaseAuth
import ActivityIndicatorView

struct LoginView: View {
    @EnvironmentObject var appstore:Store
    @State private var userName:String = ""
    @State private var password:String = ""
    @State private var alertStatus = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                LogoView()
                  Text("Login Account")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.init("TitleColor"))
                    .padding(.horizontal, 20)
                    .padding(.top, 40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                  Text("Login To Continue")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.init("TitleColor"))
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                  TextField("UserName", text: $userName)
                    .textContentType(.emailAddress)
                    .padding(.top, 30)
                    .font(.title3)
                    .foregroundColor(.init("TitleColor"))
                    .padding(.horizontal, 20 )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                  SecureField("Password", text: $password)
                    .textContentType(.password)
                    .padding(.top, 15)
                    .font(.title3)
                    .foregroundColor(.init("TitleColor"))
                    .padding(.horizontal, 20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                  Text("Forgot Password")
                    .font(.headline)
                    .foregroundColor(.init("TitleColor"))
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                                
                NavigationLink(
                    destination: HomeView().environmentObject(store), isActive: $appstore.state.updateLogin) {
                    Button(action: {
                        appstore.state.indicatorStatus = true
                        appstore.dispatch(DoLogin(userName: userName, password: password))
                    }){
                      Text("Login")
                      .bold()
                      .font(.largeTitle)
                      .padding(.horizontal, 20)
                      .padding(.vertical, 7)
                      .foregroundColor(.init("TitleColor"))
                      .border(Color.init("TitleColor"), width: 5)
                      .cornerRadius(5)
                      .frame(maxWidth: .infinity,alignment: .center)
                      .padding(.top, 40)
                    }
                    }
                .navigationBarHidden(true)
                .alert(isPresented: $appstore.state.alertStatus, content: {
                    let okayBtn = Alert.Button.default(Text("Okay"))
                    return Alert(title: Text("Alert! Message"), message: Text(appstore.state.alertMessage), dismissButton: okayBtn)
                })
                Spacer()
                ActivityIndicatorView(isVisible: $appstore.state.indicatorStatus, type: .rotatingDots)
                    .frame(width: 50.0, height: 50.0)
                    .foregroundColor(.init("TitleColor"))
                    .padding()
                NavigationLink(destination: SignupView().environmentObject(store)){
                    Text("I'm a new user, SignUp")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.init("TitleColor"))
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(store)
    }
}
