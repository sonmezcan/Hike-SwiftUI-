//
//  MotionAnimationView.swift
//  Hike
//
//  Created by can on 21.11.2024.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - Properties
    
    @State private var randomCircle = Int.random(in: 6...12)
    @State private var isAnimating = false
    
    //MARK: - Functions
    
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 1.0...2.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                
                    Circle()
                        .foregroundColor(.white)
                        .opacity(0.25)
                        .frame(width: randomSize())
                        .position(x: randomCoordinate(), y: randomCoordinate())
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .onAppear(perform: {
                            withAnimation(
                                Animation
                                    .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                                    .repeatForever()
                                    .speed(randomSpeed())
                                    .delay(randomDelay())
                            ) {
                                isAnimating = true
                            }
                        })
                
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    ZStack {
        MotionAnimationView()
            .background(
                Circle()
                    .fill(.teal)
            )
    }
}
