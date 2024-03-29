//
//  PasteboardDataSource.swift
//  clipper
//
//  Created by Wayne Irwin on 16/6/19.
//  Copyright © 2019 Wayne Irwin. All rights reserved.
//

import Foundation

class PasteboardDataSource: PasteboardDataSourceProtocol{
    let _pasteboard: NSPasteboard
    var lastChangeCount: Int = 0
    var timer: Timer!

    
    init(pasteboard:NSPasteboard = NSPasteboard.general) {
        self._pasteboard  = pasteboard
        super.init()
    }
    
    func setPasteBoardTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (t) in
            if self.lastChangeCount != self._pasteboard.changeCount {
                self.lastChangeCount = self._pasteboard.changeCount
                self.pasteboardDidChange()
                
            }
        }
    }
    
    func pasteboardDidChange(){
        guard let items = self._pasteboard.pasteboardItems else { return }
        guard let item = items.first?.string(forType: .string) else { return }
        self._datastore.add(value: item)
        
    }
    
    
    func hasNewData() -> Bool
    func data() -> [String]
}
