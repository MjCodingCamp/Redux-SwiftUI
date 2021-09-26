//
//  HomeView.swift
//  Sept14
//
//  Created by Mohammed Jeeshan on 14/09/21.
//

import SwiftUI
import Kingfisher
import FirebaseAuth
import FirebaseDatabase
import ActivityIndicatorView

struct HomeView: View {
    @EnvironmentObject var appstore:Store
    @State private var actionSheet = false

    var body: some View {
        VStack{
            HStack{
                Text(appstore.state.userName)
                    .bold()
                    .foregroundColor(.init("TitleColor"))
                    .font(.title2)
                Spacer()
                    .navigationBarHidden(true)
                Image("login")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(radius: 5)
                    .onTapGesture {
                        actionSheet = true
                    }
                    .actionSheet(isPresented: $actionSheet, content: {
                        let logoutBtn = ActionSheet.Button.default(Text("Logout")){
                            logout()
                        }
                        let cancelBtn = ActionSheet.Button.destructive(Text("Cancel"))
                        return ActionSheet.init(title: Text("Are to sure to logout!"), message: Text(""), buttons: [logoutBtn, cancelBtn])
                    })
            }.padding(.horizontal, 20)
            
            List(appstore.state.moviesData){ movie in
                NavigationLink(
                    destination: DetailView(movie: movie)){
                    HStack(alignment: .top, spacing: 10){
                        KFImage.url(URL(string: Link.pathLink + movie.poster_path!))
                            .resizable()
                            .frame(width: 180, height: 120, alignment: .leading)
                        VStack(alignment: .leading, spacing:5){
                            Text(movie.title!)
                                .foregroundColor(.init("TitleColor"))
                                .font(.title2)
                                .fontWeight(.medium)
                            Text(movie.release_date!)
                                .foregroundColor(.init("TitleColor"))
                                .font(.title3)
                        }
                    }
                }
                .navigationBarHidden(true)
            }.animation(.linear)
          Spacer()
        }.onAppear(){
            appstore.dispatch(FetchUserName())
            appstore.dispatch(FetchMovies())
        }
    }
    
    func logout()  {
        do{
            try FirebaseAuth.Auth.auth().signOut()
        }catch{
            print(error.localizedDescription)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(store)
    }
}

