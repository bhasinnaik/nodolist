//
//  ContentView.swift
//  NoDo
//
//  Created by Shivangi on 10/07/20.
//  Copyright © 2020 Bhasin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //MARK: Main View
    //State variable is used to redraw view when user changed the text.
    //@State var nodoList: [NoDo] = []
    @State var nodoList: [NoDo] = {
        //User defaults are used to store small amount of data on device.
        //data is stored in form of key value pair.
        //data is stored in json format.
        guard var data = UserDefaults.standard.data(forKey: "nodos") else { return [] }
        if let json = try? JSONDecoder().decode([NoDo].self, from: data){
            return json
        }
        return []
    }()
    @State var showField = false
    @State var nodoItem = NoDo()
    var body: some View {
        NavigationView{
            VStack{
                HStack(spacing: 5){
                    TopView(nodoItem: self.$nodoItem, showField: self.$showField, nodoList: self.$nodoList)
                }
                List{
                    ForEach(self.nodoList){ item in
                        NoDoRow(noDoItem: item)
                    }.onDelete(perform: deleteItem)
                }
            }.navigationBarTitle(Text("NoDo"))
        }
    }
    func deleteItem(at offsets: IndexSet) {
        guard let index = Array(offsets).first else { return }
        self.nodoList.remove(at: index)
        save()
    }
    func save() {
        //Save data in user defaults.
        guard let data = try? JSONEncoder().encode(self.nodoList) else { return }
        UserDefaults.standard.set(data, forKey:"nodos")
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



