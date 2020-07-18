//
//  TopView.swift
//  NoDo
//
//  Created by Shivangi on 11/07/20.
//  Copyright © 2020 Bhasin. All rights reserved.
//

import SwiftUI

struct TopView: View {
    //MARK: Top View with Add Item Field
    //when variables are shared between views and views needs to be redrawn based on these values then variables needs to be declared with Binding annotation.
    @Binding var nodoItem: NoDo
    @State var placeHolder = "Add new NODO Item"
    @Binding var showField: Bool
    @Binding var nodoList: [NoDo]
    
    var body: some View {
        ZStack {
            ZStack(alignment: .leading){
                TextField(self.placeHolder, text: self.$nodoItem.item) {
                    //MARK: Commit code for TextField
                    //This is inline function for oncommit of textfield
                    //when user enters new nodo item and press enter, we will add this item to nodo list.
                    self.nodoList.insert(NoDo(item: self.nodoItem.item), at: 0)
                    self.nodoItem.item = ""
                    self.save()
                    
                }.padding(.all, 10)
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background(Color.blue)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .offset(x: self.showField ? 0 : (-UIScreen.main.bounds.width/2 - 180))
                    .animation(.spring())
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
                    .offset(x: self.showField ? (UIScreen.main.bounds.width - 90) : -30)
                    .animation(.spring())
                    .onTapGesture {
                        self.showField.toggle()
                }
            }.padding(.bottom,20)
                .padding(.leading, 3)
        }
    }
    func save() {
        //Save data in user defaults.
        guard let data = try? JSONEncoder().encode(self.nodoList) else { return }
        UserDefaults.standard.set(data, forKey:"nodos")
        
    }
}


