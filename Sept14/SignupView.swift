//
//  SignupView.swift
//  Sept14
//
//  Created by Mohammed Jeeshan on 14/09/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import ActivityIndicatorView

struct SignupView: View {
    @EnvironmentObject var appstore:Store
    @State private var password:String = ""
    @State private var userName:String = ""
    @State private var userEmail:String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 30){
            LogoView()
                .navigationBarHidden(true)
            VStack(alignment: .leading, spacing: nil){
                Text("Create an account")
                  .bold()
                  .font(.largeTitle)
                  .foregroundColor(.init("TitleColor"))
                  .padding(.horizontal, 20)
                Text("Sign Up to get started.")
                  .bold()
                  .font(.title2)
                  .foregroundColor(.init("TitleColor"))
                  .padding(.horizontal, 20)
                TextField("Name", text: $userName)
                  .textContentType(.name)
                  .padding(.top, 20)
                  .font(.title3)
                  .foregroundColor(.init("TitleColor"))
                  .padding(.horizontal, 20 )
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: $userEmail)
                  .textContentType(.emailAddress)
                  .padding(.top, 10)
                  .font(.title3)
                  .foregroundColor(.init("TitleColor"))
                  .padding(.horizontal, 20 )
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                  .textContentType(.password)
                  .padding(.top, 10)
                  .font(.title3)
                  .foregroundColor(.init("TitleColor"))
                  .padding(.horizontal, 20)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
            ActivityIndicatorView(isVisible: $appstore.state.indicatorStatus, type: .rotatingDots)
                .frame(width: 50.0, height: 50.0)
                .foregroundColor(.init("TitleColor"))
                .padding()
            Button(action: {
                appstore.state.indicatorStatus = true
                store.dispatch(DoSignup(userName: userName, userEmail: userEmail, password: password))
            }){
                Text("SignUp")
                    .bold()
                    .foregroundColor(.init("TitleColor"))
                    .font(.largeTitle)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 20)
                    .border(Color.init("TitleColor"), width: 5)
                    .cornerRadius(5)
            }
            .alert(isPresented: $appstore.state.alertStatus, content: {
                let okayBtn = Alert.Button.default(Text("Okay"))
                return Alert(title: Text("Alert! Message"), message: Text(appstore.state.alertMessage), dismissButton: okayBtn)
            })
        }
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().environmentObject(store)
    }
}
