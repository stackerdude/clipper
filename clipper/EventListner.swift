//
//  EventListner.swift
//  clipper
//
//  Created by Wayne Irwin on 16/6/19.
//  Copyright © 2019 Wayne Irwin. All rights reserved.
//

import Foundation
import Cocoa
import MASShortcut


class EventListner: NSObject {
    var timer: Timer!
    let _pasteboard: NSPasteboard
    var lastChangeCount: Int = 0
    let _datastore: Datastore
    
    init(datastore:Datastore, pasteboard:NSPasteboard) {
        self._datastore = datastore
        self._pasteboard  = pasteboard
        super.init()
        self.lastChangeCount = self._pasteboard.pasteboardItems?.count ??  0
        self.setPasteBoardTimer()
        self.setGlobalHotkey()
        

    }
    
    func setGlobalHotkey(){
        let shortcut = MASShortcut.init(keyCode: UInt(kVK_ANSI_K), modifierFlags: UInt(NSEvent.ModifierFlags.command.rawValue + NSEvent.ModifierFlags.shift.rawValue))
        
        MASShortcutMonitor.shared().register(shortcut, withAction: {
            NotificationCenter.default.post(name: .showMainVC, object: nil)
        })
    }
    
    func setPasteBoardTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (t) in
            if self._pasteboard.pasteboardItems?.count != self.lastChangeCount {
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
    
}
extension Notification.Name {
    static let showMainVC = Notification.Name("showMainVC")
}


