//
//  SearchView.swift
//  Birdy
//
//  Created by Marin Bencevic on 12.12.2022..
//

import SwiftUI

struct SearchView: View {

  @EnvironmentObject var tweetData: TweetData

  @State var query: String = ""

  var foundTweets: [TweetModel] {
    if query.isEmpty {
      return tweetData.tweets
    } else {
      return tweetData.tweets.filter { tweet in
        return tweet.content.lowercased().contains(query.lowercased())
      }
    }
  }

  var body: some View {
    VStack {
      TextField("Search", text: $query)
        .textFieldStyle(.roundedBorder)
      List(foundTweets) { tweetModel in
        Tweet(tweet: Binding.constant(tweetModel))
          .disabled(true)
      }
      .listStyle(.plain)
    }.padding()
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
      .environmentObject(TweetData())
  }
}
