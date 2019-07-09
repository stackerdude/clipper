//
//  MainViewController.swift
//  clipper
//
//  Created by Wayne Irwin on 18/6/19.
//  Copyright © 2019 Wayne Irwin. All rights reserved.
//

import Foundation
import DateToolsSwift

class MainViewContoller: NSViewController{
    
    @IBOutlet weak var tableView: NSTableView!
    var _datastore:Datastore!
    
    override func viewDidAppear() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.usesAutomaticRowHeights = true
        self.tableView.usesAlternatingRowBackgroundColors = true
        self.tableView.headerView = nil
        NotificationCenter.default.addObserver(self, selector: #selector(newDataCallBack), name: .newDataAdded, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showWindow), name: .showMainVC, object: nil)

    }
    
    @objc func showWindow(){
        let sharedApp:NSApplication = NSApplication.shared
        _ = sharedApp.mainWindow
        for window:NSWindow in sharedApp.windows{
            print(window.isVisible)
            window.makeKeyAndOrderFront(nil)
        }
        NSRunningApplication.current.activate(options: [.activateIgnoringOtherApps, .activateAllWindows])
        
    }
    
    @objc func newDataCallBack(){
        self.tableView.reloadData()
    }
    
    override func keyDown(with event: NSEvent) {
        
        
        if (event.characters == "\r") {
            let select_row: Int = tableView.selectedRow
            let selected_data: Data? = self._datastore.data[select_row].data.data(using: .utf8)
            let pasteboard: NSPasteboard = .general
            pasteboard.clearContents()
            pasteboard.setData(selected_data, forType: .string)
            hideApplication()            NSApp.hide(nil)

        }
        if (event.keyCode == 53){
            hideApplication()
        }
        
    }
    
    func hideApplication() {
        NSApp.hide(nil)
    }

    
}


extension MainViewContoller: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        if(self._datastore != nil){
            return self._datastore.numOfItems()
        }
        return 0
    }
    
}

extension MainViewContoller: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let result:CopiedTableCellView = self.tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CopiedTableCellView"), owner: self) as! CopiedTableCellView
        result.content?.stringValue = self._datastore.data[row].data
        let date:Date = Date.init(timeIntervalSince1970: self._datastore.data[row].timestamp)
        let timeAgoDate = Date.timeAgo(since: date)
        result.time?.stringValue = timeAgoDate
        return result
        
        
    }

}
