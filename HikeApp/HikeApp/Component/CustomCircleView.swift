//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by Rushikesh Suradkar on 26/07/23.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradinet: Bool = false
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors:[
                        .customIndigoMedium,
                        Color ("ColorSalmonLight")
                    ],
                    startPoint: isAnimateGradinet ? .topLeading : .bottomLeading,
                    endPoint: isAnimateGradinet ? .bottomTrailing :
                            .trailing
                )
            )
            .onAppear{
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                    isAnimateGradinet.toggle()
                }
            }
            .frame(width: 256, height: 256)
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}
