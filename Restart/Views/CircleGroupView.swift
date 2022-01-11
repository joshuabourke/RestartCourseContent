//
//  CircleGroupView.swift
//  Restart
//
//  Created by Josh Bourke on 6/12/21.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var shapeColour: Color
    @State var shapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(shapeColour.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColour.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        
        }//: ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColourBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(shapeColour: .white, shapeOpacity: 0.2)
        }
    }
}
