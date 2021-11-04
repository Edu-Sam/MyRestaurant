//
//  MyRestaurantApp.swift
//  MyRestaurant
//
//  Created by Admin on 20.09.2021.
//

import SwiftUI

@main
struct MyRestaurantApp: App {
    @StateObject var order=Order()
    var body: some Scene {
        WindowGroup {
            /*ContentView()
                .environmentObject(order)*/
            MainView().environmentObject(order)
        }
    }
}
