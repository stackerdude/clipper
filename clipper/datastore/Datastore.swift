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
    var data: [CopiedDate] = []
    
    func add(value:String){
        let newData = CopiedDate(data: value, timestamp: NSDate().timeIntervalSince1970)
        data.insert(newData, at: 0)
        NotificationCenter.default.post(name: .newDataAdded, object: nil)

    }
    
    func numOfItems() -> Int{
        return data.count
    }
}
extension Notification.Name {
    static let newDataAdded = Notification.Name("newDataAdded")
}

struct CopiedDate{
    var data:String
    var timestamp:TimeInterval
}

