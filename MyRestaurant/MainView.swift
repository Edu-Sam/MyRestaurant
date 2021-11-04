//
//  MainView.swift
//  MyRestaurant
//
//  Created by Admin on 27.09.2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Label("Menu",systemImage:"list.dash")
                }
            
           OrderView()
            .tabItem{
                Label("Order",systemImage: "square.and.pencil")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
    }
}
