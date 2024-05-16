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
        configurationAppearance()
        return WindowGroup {
            Text("2019110074, 금경훈")
            //Home(store: Store()) //ch.12까지
            Home().accentColor(Color.primary).environmentObject(Store())
        }
    }
    
    private func configurationAppearance() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "peach")!]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "peach")!]
    }
}
