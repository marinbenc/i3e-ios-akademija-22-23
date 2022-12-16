//
//  TweetData.swift
//  Birdy
//
//  Created by Marin Bencevic on 12.12.2022..
//

import Foundation
import Combine

class TweetData: ObservableObject {
  @Published var tweets: [TweetModel] = [
    TweetModel(
      content: "Tweet 1",
      username: "username",
      date: Date(),
      image: "crow"),
    TweetModel(
      content: "Tweet 2",
      username: "username",
      date: Date(),
      image: "crow"),
  ]
}
