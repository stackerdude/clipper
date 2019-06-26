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
    var data: [CopiedData] = []
    
    
    class func uniqueDatastore() -> Datastore{
        return Datastore()
    }

    
    func add(value:String){
        let data = CopiedData(data: value, timestamp: NSDate().timeIntervalSince1970)
        let pos:Int? = self._checkIfDataExists(newData: data)
        if pos != nil  {
            self.data.remove(at: pos!)
        }
        self.data.insert(data, at: 0)
        NotificationCenter.default.post(name: .newDataAdded, object: nil)
    }


    func _checkIfDataExists(newData:CopiedData) ->Int? {
        for (idx, data) in self.data.enumerated() {
            if data.data == newData.data{
                return idx
            }
        }
        return nil
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

struct CopiedData{
    var data:String
    var timestamp:TimeInterval
}

