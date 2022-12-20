//
//  Tweet.swift
//  Birdy
//
//  Created by Marin Bencevic on 06.12.2022..
//

import SwiftUI

struct TweetModel: Identifiable, Codable {
  var id = UUID().uuidString

  let content: String
  let username: String
  let date: Date
  let imageURL: URL
}

func printURL(url: URL?) throws {
  if url == nil {
    throw URLError(.badURL)
  }

  print(url)
}

func test() {

  do {
    try printURL(url: IMAGE_URL)
  } catch let error {
    print(error)
  }

}



struct Tweet: View {

  @Binding var tweet: TweetModel
  @EnvironmentObject var userData: UserData

  @State var image: UIImage? = nil

  var body: some View {
    HStack {
      if let image {
        Image(uiImage: image)
          .resizable()
          .frame(width: 55, height: 55)
          .clipShape(Circle())
      } else {
        Circle()
          .frame(width: 55, height: 55)
          .foregroundColor(.gray)
      }

      VStack(alignment: .leading) {
        Text(tweet.username)
        Text(tweet.content)
        Text(tweet.date, style: .relative)
      }

      Spacer()

      Button(action: {
        if userData.favoriteTweets.contains(tweet.id) {
          userData.favoriteTweets.remove(tweet.id)
        } else {
          userData.favoriteTweets.insert(tweet.id)
        }
      }) {
        if userData.favoriteTweets.contains(tweet.id) {
          Image(systemName: "heart.fill")
            .foregroundColor(.red)
        } else {
          Image(systemName: "heart")
            .foregroundColor(.red)
        }
      }
    }
    .task {
      do {
        let (data, _) = try await URLSession.shared.data(from: IMAGE_URL)
        image = UIImage(data: data)
      } catch let error {
        print(error)
      }
    }
  }
}

struct Tweet_Previews: PreviewProvider {
    static var previews: some View {
      Tweet(tweet: Binding.constant(TweetModel(
        content: "Tweet 1",
        username: "username",
        date: Date(),
        imageURL: IMAGE_URL)))
      .environmentObject(UserData())
    }
}
