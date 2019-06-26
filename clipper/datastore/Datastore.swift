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
    
    class func uniqueDatastore() -> Datastore{
        return Datastore()
    }
    
    func add(value:String){
        let newData = CopiedDate(data: value, timestamp: NSDate().timeIntervalSince1970)
        self.data.insert(newData, at: 0)
        NotificationCenter.default.post(name: .newDataAdded, object: nil)

    }
    
    func numOfItems() -> Int{
        return self.data.count
    }
    func clearStore(){
        self.data.removeAll()
    }
}
extension Notification.Name {
    static let newDataAdded = Notification.Name("newDataAdded")
}

struct CopiedDate{
    var data:String
    var timestamp:TimeInterval
}

