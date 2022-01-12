//
//  ButtomView.swift
//  moveCharactersListSwiftUI
//
//  Created by Tatsiana Marchanka on 12.01.22.
//

import SwiftUI

struct ButtomView: View {
    var body: some View {
      VStack {
        Spacer()
        VStack() {
          ButtomRow(title: "Deniel Redclif")
        }
          .frame(maxWidth: .infinity)
          .frame(height: 100)
          .background(LinearGradient(gradient: Gradient(colors: [.mint,.green]), startPoint: .bottomLeading, endPoint: .top))
          .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(radius: 30)
        .padding(.horizontal)
      }.padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
      ButtomView()
    }
}

struct ButtomRow: View {
  var title : String
  var body: some View {
    Text("Actor:")
      Text(title)
        .font(.system(size: 30, weight: .bold, design: .rounded))
        .frame(width: 120, alignment: .center)
  }
}
