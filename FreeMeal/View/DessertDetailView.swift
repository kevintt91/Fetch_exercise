//
//  DessertDetailView.swift
//  FreeMeal
//
//  Created by Changhyun Kim on 4/24/23.
//

import SwiftUI

struct DessertDetailView: View {
     
    @State private var showIngredientsSheet = false
    @State private var showMeasureSheet = false
    @ObservedObject var dessertDetailVM: DessertDetailViewModel
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 30, maximum: 100)), count: 3)
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top, spacing: 10) {
                AsyncImage(url: URL(string: dessertDetailVM.dessertThumbnail)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 200, height: 200)
                             .cornerRadius(10)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 1) {
                        Image(systemName: "link")
                        Button {
                            if let url = URL(string: dessertDetailVM.youtubeLink) {
                                UIApplication.shared.open(url)
                            }
                        } label: {
                            Text("Youtube")
                        }
                    }
                    
                    Button {
                        withAnimation {
                            showIngredientsSheet.toggle()
                        }
                    } label: {
                        Text("\(dessertDetailVM.ingredients.count) ingredients")
                    }
                    
                    Button {
                        withAnimation {
                            showMeasureSheet.toggle()
                        }
                    } label: {
                        Text("\(dessertDetailVM.measure.count) measures")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Origin")
                        Text(dessertDetailVM.area)
                            .fontWeight(.light)
                    }
                    
                }
                .fontWeight(.bold)
                
            }
            
            VStack {
                Text("Instruction")
                    .fontWeight(.bold)
                Text(dessertDetailVM.instruction)
                    .fontWeight(.medium)
            }.padding([.leading, .trailing], 20)
            
            Divider()
        }//ScrollView
        .overlay(
            Group {
                if showIngredientsSheet {
                    QuarterSheetView(isPresented: $showIngredientsSheet) {
                        VStack {
                            HStack {
                                Text("Ingredients")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.top)
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation {
                                        showIngredientsSheet.toggle()
                                    }
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.title)
                                        .padding(.top)
                                }
                            }
                            .padding(.horizontal)
                            
                            Divider()
                            
                            // Add your ingredients here
                            ForEach(dessertDetailVM.ingredients, id: \.self) { ingredient in
                                Text(ingredient)
                            }
                            
                            Spacer()
                        }
                    }
                }// showIngredientsSheet
                if showMeasureSheet {
                    QuarterSheetView(isPresented: $showMeasureSheet) {
                        VStack {
                            HStack {
                                Text("Ingredients")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.top)
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation {
                                        showMeasureSheet.toggle()
                                    }
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.title)
                                        .padding(.top)
                                }
                            }
                            .padding(.horizontal)
                            
                            Divider()
                            
                            // Add your ingredients here
                            ForEach(dessertDetailVM.measure, id: \.self) { measure in
                                Text(measure)
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
        )
    }//View
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let dessertDetail = DessertDetail(
            idMeal: "53049",
            strMeal: "Apam balik",
            strDrinkAlternate: "",
            strCategory: "Dessert",
            strArea: "Malaysian",
            strInstructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.",
            strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
            strTags: "",
            strYoutube: "https://www.youtube.com/watch?v=6R8ffRRJcrg",
            strIngredient1: "Milk",
            strIngredient2: "Oil",
            strIngredient3: "Eggs",
            strIngredient4: "Flour",
            strIngredient5: "Baking Powder",
            strIngredient6: "Salt",
            strIngredient7: "Unsalted Butter",
            strIngredient8: "Sugar",
            strIngredient9: "Peanut Butter",
            strIngredient10: "",
            strIngredient11: "",
            strIngredient12: "",
            strIngredient13: "",
            strIngredient14: "",
            strIngredient15: "",
            strIngredient16: "",
            strIngredient17: "",
            strIngredient18: "",
            strIngredient19: "",
            strIngredient20: "",
            strMeasure1: "200ml",
            strMeasure2: "60ml",
            strMeasure3: "2",
            strMeasure4: "1600g",
            strMeasure5: "3 tsp",
            strMeasure6: "1/2 tsp",
            strMeasure7: "25g",
            strMeasure8: "45g",
            strMeasure9: "3 tbs",
            strMeasure10: " ",
            strMeasure11: " ",
            strMeasure12: " ",
            strMeasure13: " ",
            strMeasure14: " ",
            strMeasure15: " ",
            strMeasure16: " ",
            strMeasure17: " ",
            strMeasure18: " ",
            strMeasure19: " ",
            strMeasure20: " ",
            strSource: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
            strImageSource: "",
            strCreativeCommonsConfirmed: "",
            dateModified: ""
        )
        
        DessertDetailView(dessertDetailVM: DessertDetailViewModel(dessertDetail: dessertDetail))
    }
}
