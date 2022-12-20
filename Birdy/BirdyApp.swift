//
//  BirdyApp.swift
//  Birdy
//
//  Created by Marin Bencevic on 06.12.2022..
//

import SwiftUI

let IMAGE_URL = URL(string: "https://cdn.britannica.com/01/88401-050-26CBE648/American-crow.jpg")!

@main
struct BirdyApp: App {

  @StateObject var tweetData = TweetData()
  @StateObject var userData = UserData()

  var body: some Scene {
    WindowGroup {
      TabView {
        ContentView()
          .tabItem {
            Label("Feed", systemImage: "list.bullet.circle")
          }
        SearchView()
          .tabItem {
            Label("Search", systemImage: "magnifyingglass.circle")
          }
        ProfileView()
          .tabItem {
            Label("Profile", systemImage: "person.circle")
          }
      }
      .environmentObject(tweetData)
      .environmentObject(userData)
      .task(tweetData.fetchTweets)
    }
  }
}
