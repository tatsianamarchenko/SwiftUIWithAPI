//
//  ContentView.swift
//  moveCharactersListSwiftUI
//
//  Created by Tatsiana Marchanka on 12.01.22.
//

import SwiftUI

struct ContentView: View {
  @StateObject var vm = ViewModel()
  @State var show = false

  @State var viewState = CGSize.zero
  var body: some View {

    ScrollView(.horizontal, showsIndicators: false) {
      HStack{
        ForEach(vm.persons) { person in
          VStack {
            PersonView(show: $show, person: person)
            ButtomView(person: person)
              .background(Color.black.opacity(0.001))
              .offset(y: show ? 0 : screen.height)
         //     .offset(y: viewState.height)
              .animation(.easeInOut)
              .padding(.horizontal, 30)
            //          .onTapGesture {
            //            show.toggle()
            //          }
          }
        }
      }

    }.overlay(content: {
      if vm.isLoaded {
        ProgressView()
      }
    })
    .onAppear {
      vm.fetchPersons()
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
  var person : RecivedDataModelElement
  var body: some View {
    VStack {
      VStack {
    VStack {
      HStack {
        Text(person.name)
          .font(.largeTitle)
          .padding()
        Image(systemName: "wand.and.stars.inverse")
      }
      Text(person.species.rawValue)
        .padding(1)
      Text(person.dateOfBirth)
        .padding(1)
      HStack {
        Text("♂")
          .bold()
          .frame(width: 32, height: 32)
          .font(.largeTitle)
        Text(person.gender.rawValue)
          .padding(1)
      }
      HStack {
        Image(systemName: "house")
          .font(.system(size: 20, weight: .light, design: .default))
          .imageScale(.large)
          .frame(width: 32, height: 32)
        Text(person.house.rawValue)
      }.padding(1)

      Text( person.hogwartsStudent ? "Hogwarts Student" : "Hogwarts Stuff")
        .padding(1)
    }

      VStack {
        VStack {
          Text("Wand:")
          HStack {
            Text("Wood:")
            Text(person.wand.wood)}
          HStack {
            Text("Core:")
            Text(person.wand.core.rawValue)
          }
          HStack {
            Text("Patronus:")
            Text(person.patronus)
          }
        }.frame(alignment: .leading)
          .padding(.all, 5)
          .background(LinearGradient(gradient: Gradient(colors: person.alive ? [Color.mint.opacity(0.1), Color.mint.opacity(0.8)] : [Color.red.opacity(0.1), Color.pink.opacity(0.8)]), startPoint: .leading, endPoint: .trailing))
          .cornerRadius(30)
      }.padding(.all, 10)
    }
    .padding(.top, 80)

      AsyncImage(url: URL(string: person.image))
        .aspectRatio(contentMode: .fill)

        .shadow(color: person.alive ? Color.green : Color.red, radius: 100, x: 10, y: 10)
        .onTapGesture {
          self.show.toggle()
          if show {
            ButtomView(person: person)
          }
        }
    }
    .frame(width: screen.width - 30, height: show ? screen.height - 190 :  screen.height, alignment: .center)
    .shadow(color: person.alive ? Color.green : Color.red, radius: 100, x: 10, y: 10)
    .background(Color.black.opacity(0.03))

    .cornerRadius(30)
    .padding(.all, 30)
    .shadow(radius: 30)
    .shadow(color: person.alive ? Color.green : Color.red, radius: 100, x: 10, y: 10)
  }
}
