//
//  FuitMarketApp.swift
//  FuitMarket
//
//  Created by Limetree on 2024/03/29.
//

import SwiftUI

@main
struct FuitMarketApp: App {
    var body: some Scene {
        WindowGroup {
            Text("2019110074, 금경훈")
            //Home(store: Store()) //ch.12까지
            Home().environmentObject(Store())
        }
    }
}
