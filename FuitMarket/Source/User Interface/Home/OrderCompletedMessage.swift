//
//  OrderCompletedMessage.swift
//  FuitMarket
//
//  Created by Limetree on 2024/05/16.
//

import SwiftUI

struct OrderCompletedMessage: View {
    var body: some View {
        Text("주문 완료!")
            .font(.system(size:24))
            .bold()
            .kerning(2)
    }
}

struct OrderCompletedMessage_Previews: PreviewProvider {
    static var previews: some View {
        Color.primary.colorInvert()
            .popup(isPresented: .constant(true)){ OrderCompletedMessage() }
            .edgesIgnoringSafeArea(.vertical)
    }
}
