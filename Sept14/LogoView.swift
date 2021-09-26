//
//  LogoImage.swift
//  Sept14
//
//  Created by Mohammed Jeeshan on 14/09/21.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack(alignment:.center, spacing: 10){
            Text("Learning Swift UI")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.init("TitleColor"))
            Image("swiftui")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}

