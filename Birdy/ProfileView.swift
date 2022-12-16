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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
