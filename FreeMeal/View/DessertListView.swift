//
//  DessertListView.swift
//  FreeMeal
//
//  Created by Changhyun Kim on 4/24/23.
//

import SwiftUI

struct DessertListView: View {
    
    let dessert: [DessertViewModel]
    
    var body: some View {
        List(self.dessert, id: \.id) { dessert in
            NavigationLink(destination: DessertDetailScreen(dessertId: dessert.id)) {
                DessertCell(dessert: dessert)
            }
        }
        
    }
}

struct DessertCell: View {
    
    let dessert: DessertViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: dessert.picture)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .cornerRadius(20)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
                
            
            VStack(alignment: .leading) {
                Text(dessert.name)
                    .font(.headline)
            }.padding(5)
            
            Spacer()
            
        }.contentShape(Rectangle())
    }
}
    
struct DessertListView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListView(dessert: [DessertViewModel.init(dessert: Dessert(strMeal: "name", strMealThumb: "ThumbNail str", idMeal: "MEAL 1"))])
    }
}
