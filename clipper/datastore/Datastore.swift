//
//  Datastore.swift
//  clipper
//
//  Created by Wayne Irwin on 16/6/19.
//  Copyright © 2019 Wayne Irwin. All rights reserved.
//

import Foundation


class Datastore: NSObject{
    static let shared = Datastore()
    var data: [String] = []
    
    func add(value:String){
        data.insert(value, at: 0)
        NotificationCenter.default.post(name: .newDataAdded, object: nil)

    }
    
    func numOfItems() -> Int{
        return data.count
    }
}
extension Notification.Name {
    static let newDataAdded = Notification.Name("newDataAdded")
}



