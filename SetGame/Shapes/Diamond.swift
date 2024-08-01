//
//  Diamond.swift
//  SetGame
//
//  Created by Rubing on 8/1/24.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width * 0.8
        let height = width * 0.5
        
        let left = CGPoint(x: rect.midX - width/2, y: rect.midY)
        let top = CGPoint(x: rect.midX, y: rect.midY + height/2)
        let right = CGPoint(x: rect.midX + width/2, y: rect.midY)
        let bottom = CGPoint(x: rect.midX, y: rect.midY - height/2)
        
        var path = Path()
        path.move(to: left)
        path.addLine(to: top)
        path.addLine(to: right)
        path.addLine(to: bottom)
        path.addLine(to: left)
        
        return path
    }
}


