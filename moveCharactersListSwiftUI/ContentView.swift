//
//  ContentView.swift
//  moveCharactersListSwiftUI
//
//  Created by Tatsiana Marchanka on 12.01.22.
//

import SwiftUI

struct ContentView: View {
  @State var show = false
  @State var viewState = CGSize.zero
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        PersonView(show: $show)
        ButtomView()
          .background(Color.black.opacity(0.001))
          .offset(y: show ? 0 : screen.height)
          .offset(y: viewState.height)
          .animation(.easeInOut)
          .padding(.horizontal, 10)
//          .onTapGesture {
//            show.toggle()
//          }
      }
    }
}

let screen = UIScreen.main.bounds

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PersonView: View {
  @Binding var show : Bool
 // var person : RecivedDataModelElement
  var body: some View {
    VStack {
      HStack {
        Text("Harry Potter")
          .padding()
        Image(systemName: "wand.and.stars.inverse")
      }
      Text("human")
      Text("31-07-1980")
      HStack {
        Text("♂")
          .bold()
          .frame(width: 32, height: 32)
          .font(.largeTitle)
        Text("male")
      }
      HStack {
        Image(systemName: "house")
          .font(.system(size: 20, weight: .light, design: .default))
          .imageScale(.large)
          .frame(width: 32, height: 32)
        Text("Gryffindor")
      }
      Text("Hogwarts Student")
      VStack {
        HStack {
          Text("Ancestry:")
          Text("half-blood")
        }
        VStack {
          Text("Wand:")
          HStack {
            Text("Wood:")
            Text("holly")}
          HStack {
            Text("Core:")
            Text("phoenix feather")
          }
          HStack {
            Text( "Length:")
            Text("11")
          }
          HStack {
            Text("Patronus:")
            Text("stag")
          }
        }.frame(alignment: .leading)
          .padding(.all, 5)
          .background(LinearGradient(gradient: Gradient(colors: [Color.mint.opacity(0.1), Color.mint.opacity(0.8)]), startPoint: .leading, endPoint: .trailing))
          .cornerRadius(30)
        //   .shadow(color: Color.mint, radius: 10, x: 3, y: 3)
      }.padding(.all, 10)


      Image("harry") .shadow(color: Color.green, radius: 100, x: 10, y: 10)
        .onTapGesture {
          self.show.toggle()
          if show {
            ButtomView()
          }
        }


    }
    .frame(width: screen.width - 30, height: show ? screen.height - 190 :  screen.height, alignment: .center)

    .shadow(color: Color.green, radius: 100, x: 10, y: 10)
    .background(Color.black.opacity(0.03))

    .cornerRadius(30)
    .padding(.all, 30)
    .shadow(radius: 30)
    .shadow(color: Color.green, radius: 100, x: 10, y: 10)
  }
}
