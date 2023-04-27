//
//  DessertDetailScreen.swift
//  FreeMeal
//
//  Created by 김창현 on 4/24/23.
//

import SwiftUI

struct DessertDetailScreen: View {
    
    let dessertId: String
    @ObservedObject var dessertDetailVM = DessertDetailViewModel()
    
    var body: some View {
        VStack {
            DessertDetailView(dessertDetailVM: dessertDetailVM)
                .navigationTitle(dessertDetailVM.desertTitle)
        }
        .onAppear {
            self.dessertDetailVM.getDessertsById(id: dessertId)
        }
    }
}

struct DessertDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailScreen(dessertId: "53049")
    }
}
