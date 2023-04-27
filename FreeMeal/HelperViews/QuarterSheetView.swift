//
//  QuarterSheetView.swift
//  FreeMeal
//
//  Created by 김창현 on 4/27/23.
//

import SwiftUI

struct QuarterSheetView<Content: View>: View {
    @Binding var isPresented: Bool
    let content: Content

    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if isPresented {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                isPresented = false
                            }
                        }
                    
                    VStack {
                        Spacer()
                        
                        VStack {
                            content
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, geometry.safeAreaInsets.bottom)
                    }
                }
            }
        }
    }
}
