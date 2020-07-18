//
//  NoDoRow.swift
//  NoDo
//
//  Created by Shivangi on 11/07/20.
//  Copyright © 2020 Bhasin. All rights reserved.
//

import SwiftUI

struct NoDoRow: View {
    //MARK: Cell view for List
    @State var noDoItem: NoDo
    
    //@State var noDoList: [String]()
    var body: some View{
        VStack(alignment: .center, spacing: 2){
            Group{
                HStack{
                    Text(self.noDoItem.item)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Spacer()
                    Image(systemName:self.noDoItem.isDone ? "checkmark" : "square" )
                        .padding()
                    
                }
                HStack(alignment: .center, spacing: 3 ){
                    Spacer()
                    Text("Added: \(self.noDoItem.dateText)")
                        .foregroundColor(.white)
                        .padding(.all, 5)
                }.padding(.bottom, 5)
            }.padding(.all,4)
        }.background(self.noDoItem.isDone ? Color.gray: Color.pink)
            .animation(.spring())
            .opacity(self.noDoItem.isDone ? 0.3 : 1)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .onTapGesture {
                    self.noDoItem.isDone.toggle()
                
        }.animation(.spring())
    }
}


