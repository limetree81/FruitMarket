//
//  ResizedImage.swift
//  FuitMarket
//
//  Created by Limetree on 2024/05/13.
//

import SwiftUI

struct ResizedImage: View {
    let imageName: String
    let contentMode: ContentMode
    let renderingMode: Image.TemplateRenderingMode?
    
    init(_ imageName: String, contentMode: ContentMode = .fill, rendeingMode: Image.TemplateRenderingMode? = nil) {
        self.imageName = imageName
        self.contentMode = contentMode
        self.renderingMode = rendeingMode
    }
    
    var body: some View {
        Image(imageName)
            .renderingMode(renderingMode)
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}

struct ResizedImage_Previews: PreviewProvider {
    static var previews: some View {
        ResizedImage("SwiftUI", contentMode: .fit)
        ResizedImage("SwiftUI", contentMode: .fit, rendeingMode: .original)
    }
}
