//
//  IngredientSquare.swift
//  FreeMeal
//
//  Created by 김창현 on 4/26/23.
//

import SwiftUI

struct IngredientSquare: View {
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            Spacer()
                .frame(height: heightForText(text: text))
        }
    }
    
    func heightForText(text: String) -> CGFloat {
        let uiLabel = UILabel()
        uiLabel.text = text
        uiLabel.font = .systemFont(ofSize: UIFont.systemFontSize)
        uiLabel.numberOfLines = 0
        uiLabel.lineBreakMode = .byWordWrapping
        let constraintSize = CGSize(width: 100, height: CGFloat.greatestFiniteMagnitude)
        let size = uiLabel.sizeThatFits(constraintSize)
        
        return size.height
    }

}


struct IngredientSquare_Previews: PreviewProvider {
    static var previews: some View {
        IngredientSquare(text: "A ingredient")
    }
}
