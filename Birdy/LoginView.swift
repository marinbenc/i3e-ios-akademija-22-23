//
//  LoginView.swift
//  Birdy
//
//  Created by Marin Bencevic on 10.12.2022..
//

import SwiftUI

struct LoginView: View {

  @Binding var content: String
  @Binding var isPresented: Bool

    var body: some View {
      VStack {

        Spacer()

        HStack {
          Image("crow")
            .resizable()
            .frame(width: 75, height: 75)
            .clipShape(Circle())
          Text("Birdy")
            .font(.largeTitle)
            .bold()
            .padding(.leading, 20)
        }

        TextField("username", text: $content)
          .padding(.leading, 100)
          .padding(.trailing, 100)
          .multilineTextAlignment(.center)
          .textFieldStyle(.roundedBorder)

        Button(action: { isPresented = false }) {
          Text("Log In")
        }
        Spacer()
      }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
      LoginView(
        content: Binding.constant(""),
        isPresented: Binding.constant(true))
    }
}
