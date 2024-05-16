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
    @State private var quickOrder: Product?
    var body: some View {
        NavigationView {
            List(store.products) {product in
                NavigationLink(destination: ProductDetailView(product: product)){
                    ProductRow(product: product, quickOrder: self.$quickOrder)
                }.buttonStyle(PlainButtonStyle())
            }
        }.navigationBarTitle("과일마트")
            //.popup(item: $quickOrder, content: popupMessage(product:))
            //.popup(item: $quickOrder, style: .dimmed, content: popupMessage(product:))
            .popupOverContext(item: $quickOrder, style: .blur, content: popupMessage(product:))
    }
    
    
    func popupMessage(product: Product) -> some View {
        let name = product.name.split(separator: " ").last!
        
        return VStack {
            Text(name)
                .font(.title).bold().kerning(3)
                .foregroundColor(.peach)
                .padding()
            OrderCompletedMessage()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        //Preview(source: Home(store: Store())) //until ch.12
        Preview(source: Home()).environmentObject(Store())
    }
}

