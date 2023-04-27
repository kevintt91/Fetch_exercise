//
//  ContentView.swift
//  FreeMeal
//
//  Created by 김창현 on 4/24/23.
//

import SwiftUI

struct DessertListScreen: View {
    
    @ObservedObject private var dessertListVM: DessertListViewModel
    
    init() {
        self.dessertListVM = DessertListViewModel()
        self.dessertListVM.getAllDesserts()
    }
    
    var body: some View {
        NavigationView {
            DessertListView(dessert: self.dessertListVM.desserts)
            
            .navigationTitle("Dessert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListScreen()
    }
}
