//
//  MyNavigationView.swift
//  MyRestaurant
//
//  Created by Admin on 20.09.2021.
//

import SwiftUI

struct MyNavigationView: View {
    let menu=Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu){section in
                    Section(header: Text(section.name)){
                        
                        ForEach(section.items){ item in
                            ItemRow(item: item)
                           // Text(item.name)
                            
                        }
                        
                        
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
