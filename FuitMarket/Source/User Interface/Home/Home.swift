//
//  Home.swift
//  FuitMarket
//
//  Created by Limetree on 2024/03/29.
//

import SwiftUI

struct Home: View {
    //let store: Store //ch.12까지
    @EnvironmentObject private var store: Store
    var body: some View {
        NavigationView {
            List(store.products) {product in
                NavigationLink(destination: ProductDetailView(product: product)){
                    ProductRow(product: product)
                }.buttonStyle(PlainButtonStyle())
            }
        }.navigationBarTitle("과일마트")
            }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        //Preview(source: Home(store: Store())) //until ch.12
        Preview(source: Home()).environmentObject(Store())
    }
}

