//
//  NoDo.swift
//  NoDo
//
//  Created by Shivangi on 11/07/20.
//  Copyright © 2020 Bhasin. All rights reserved.
//

import Foundation

let dateFormatter = DateFormatter()
struct NoDo: Identifiable, Decodable, Encodable {
    var id = UUID()
    var item: String = ""
    var isDone = false
    var dateText: String {
        dateFormatter.dateFormat = "MMM d yyyy, h:mm a"
        return dateFormatter.string(from: Date())
    }
    
}
