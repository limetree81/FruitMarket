//
//  Symbol.swift
//  FuitMarket
//
//  Created by Limetree on 2024/05/13.
//

import SwiftUI

struct Symbol: View {
    let systemName: String
    let imageScale: Image.Scale
    let color: Color?
    
    init(_ systemName: String, scale imageScale: Image.Scale = .medium, color: Color? = nil) {
        self.systemName = systemName
        self.imageScale = imageScale
        self.color = color
    }
    
    var body: some View {
        Image(systemName: systemName)
            .imageScale(imageScale)
            .foregroundColor(color)
    }
}

struct Symbol_Previews: PreviewProvider {
    static var previews: some View {
        Symbol("heart.fill", color: .red)
        Symbol("heart.fill", scale: .large)
        Symbol("heart.fill").foregroundColor(.red)
        Symbol("heart.fill").imageScale(.large)
    }
}
