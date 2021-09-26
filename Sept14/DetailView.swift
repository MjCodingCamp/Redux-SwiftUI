//
//  DetailView.swift
//  Sept14
//
//  Created by Mohammed Jeeshan on 15/09/21.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    var movie: Results

    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            KFImage.url(URL(string: Link.pathLink + movie.poster_path!))
                .resizable()
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 10)
                .frame(width: .infinity, height: 250, alignment: .center)
            HStack{
                Text("IMDB Rating: \(String(movie.vote_average!))")
                    .foregroundColor(.red)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                Spacer()
                Text("Release: \(movie.release_date!)")
                    .foregroundColor(.red)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
            }
            Text(movie.original_title!)
                .foregroundColor(.init("TitleColor"))
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal, 10)
            Text(movie.overview!)
                .foregroundColor(.gray)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal, 10)
            Spacer()
        }
    }
}
