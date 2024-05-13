//
//  QuantitySelector.swift
//  FuitMarket
//
//  Created by Limetree on 2024/05/03.
//

import SwiftUI

struct QuantitySelector: View {
    @Binding var quantity: Int
    var range: ClosedRange<Int> = 1...20
    private let softFeedback = UIImpactFeedbackGenerator(style: .soft)
    private let rigidFeedback = UIImpactFeedbackGenerator(style: .rigid)
    var body: some View {
        HStack {
            Button(action: { self.changeQuantity(-1)}) {
                Symbol("minus.circle.fill", scale: .large, color: Color.gray.opacity(0.5))
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
            
            Text("\(quantity)")
                .bold()
                .font(Font.system(.title, design: .monospaced))
                .frame(minWidth: 40, maxWidth: 60)
            
            Button(action: {self.changeQuantity(1)}) {
                Symbol("plus.circle.fill", scale: .large, color: Color.gray.opacity(0.5))
                    .padding()
            }
        }
    }
    private func changeQuantity(_ num: Int) {
        if range ~= quantity + num {
            quantity += num
            softFeedback.prepare()
            softFeedback.impactOccurred(intensity: 0.8)
        } else {
            rigidFeedback.prepare()
            rigidFeedback.impactOccurred()
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    @State private var i = 0
    /*
    static var previews: some View {
        Group {
            QuantitySelector(quantity: .constant(1))//constant라서 +-눌러도 값 안 바뀜
            QuantitySelector(quantity: .constant(10))
            QuantitySelector(quantity: .constant(20))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
    */
    static var previews: some View {
        Group {
            QuantitySelector(quantity: Binding<Int>(get: {1}, set: {_ in}))
            QuantitySelector(quantity: Binding<Int>(get: {10}, set: {_ in}))
            QuantitySelector(quantity: Binding<Int>(get: {20}, set: {_ in}))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
    //얘도 변경 안되는데?
}
