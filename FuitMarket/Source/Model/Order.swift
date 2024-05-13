//
//  Order.swift
//  FuitMarket
//
//  Created by Limetree on 2024/05/08.
//

import Foundation

struct Order: Identifiable {
    static var orderSequence = sequence(first: 1) {$0 + 1}
    
    let id: Int
    let product: Product
    let quantity: Int
    
    var price: Int {
        product.price * quantity
    }
}
