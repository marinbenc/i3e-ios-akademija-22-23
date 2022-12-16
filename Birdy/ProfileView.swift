//
//  ProfileView.swift
//  Birdy
//
//  Created by Marin Bencevic on 12.12.2022..
//

import SwiftUI

struct ProfileView: View {

  @EnvironmentObject var userData: UserData
  @EnvironmentObject var tweetData: TweetData

  var tweets: [TweetModel] {
    return tweetData.tweets.filter { tweet in
      return tweet.username == userData.username
    }
  }

  var body: some View {
    VStack {
      HStack {
        Image(userData.image)
          .resizable()
          .frame(width: 55, height: 55)
          .clipShape(Circle())
        Text(userData.username)
          .font(.title)
          .bold()
        Spacer()
      }
      .padding()

      List(tweets) { tweetModel in
        Tweet(tweet: Binding.constant(tweetModel))
          .disabled(true)
      }
      .listStyle(.plain)
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
      .environmentObject(UserData())
      .environmentObject(TweetData())
  }
}
