//
//  ViewModel.swift
//  moveCharactersListSwiftUI
//
//  Created by Tatsiana Marchanka on 12.01.22.
//

import Foundation

class ViewModel : ObservableObject {
  @Published var persons : [RecivedDataModelElement] = []
  @Published var isLoaded = false
  func fetchPersons () {
    let url = "https://hp-api.herokuapp.com/api/characters/house/gryffindor"
    var apiService = APIService(urlString: url)
    isLoaded.toggle()
    apiService.getJSON {(result: Result<[RecivedDataModelElement], APIError>) in
      defer {
        DispatchQueue.main.async {
          self.isLoaded.toggle()
        }

      }
      switch result {
      case .success(let persons):
        DispatchQueue.main.async {
          self.persons = persons
        }
      case .failure(let error):
        print(error)
      }
    }
  }
}
