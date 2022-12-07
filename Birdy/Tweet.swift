//
//  Tweet.swift
//  Birdy
//
//  Created by Marin Bencevic on 06.12.2022..
//

import SwiftUI

struct TweetModel: Identifiable {
  var id = UUID()

  let content: String
  let username: String
  let date: Date
  let image: String
  let isFavorite: Bool
}

struct Tweet: View {

  let tweet: TweetModel

  var body: some View {
    HStack {
      Image(tweet.image)
        .resizable()
        .frame(width: 55, height: 55)
        .clipShape(Circle())

      VStack {
        Text(tweet.username)
        Text(tweet.content)
        Text(tweet.date, style: .relative)
      }

      Spacer()

      Button(action: {}) {
        if tweet.isFavorite {
          Image(systemName: "heart.fill")
            .foregroundColor(.red)
        } else {
          Image(systemName: "heart")
            .foregroundColor(.red)
        }
      }
    }
  }
}

struct Tweet_Previews: PreviewProvider {
    static var previews: some View {
      Tweet(tweet: TweetModel(
        content: "Tweet 1",
        username: "username",
        date: Date(),
        image: "crow",
        isFavorite: true))
    }
}
