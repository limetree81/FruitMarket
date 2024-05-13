//
//  Store.swift
//  FuitMarket
//
//  Created by Limetree on 2024/04/12.
//

import Foundation

final class Store: ObservableObject {
    @Published var products: [Product]
    @Published var orders: [Order] = []
    
    init(filename: String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
extension Store {
    func toggleFavorite(of product: Product) {
        //guard let index = products.firstIndex(where: {$0.id == product.id }) else { return } //ver1, without extension Product: Equatable {} in Product.swift
        guard let index = products.firstIndex(of: product) else { return }
        products[index].isFavorite.toggle()
    }
    
    func placeOrder(product: Product, quantity: Int) {
        let nextID = Order.orderSequence.next()!
        let order = Order(id: nextID, product: product, quantity: quantity)
        orders.append(order)
        for o in orders{
            print("id: \(o.id), product: \(o.product.name), quantity: \(o.quantity), price: \(o.price)")
        }
    }
}
